import 'dart:math';
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:mindcare/const/api_Urls.dart';
import 'dart:convert';
import 'package:mindcare/const/colors.dart';

class TasksPage extends StatefulWidget {
  TasksPage({Key? key}) : super(key: key);

  @override
  _TasksPageState createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  final confettiController = ConfettiController(duration: const Duration(seconds: 1));
  List tasks = [];
  bool isLoading = true;
  late List<bool> isChecked;

  @override
  void initState() {
    super.initState();
    fetchTasks();
  }

  fetchTasks() async {
    setState(() {
      isLoading = true;
    });
    var url = Uri.parse(domain_url + '/api/tasks/');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      // Ensure decoding for proper emoji support
      var items = json.decode(utf8.decode(response.bodyBytes));
      print(items); // Debug output to check the response
      setState(() {
        tasks = items;
        isChecked = List<bool>.filled(items.length, false);
      });
    } else {
      throw Exception('Failed to load tasks');
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          )
        : Padding(
            padding: EdgeInsets.all(16.r),
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(tasks[index]['id'].toString()),
                  onDismissed: (direction) {
                    setState(() {
                      tasks.removeAt(index);
                      isChecked.removeAt(index);
                    });
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Task dismissed")));
                  },
                  background: Container(color: const Color.fromARGB(0, 244, 67, 54)),
                  child: Column(
                    children: [
                      ConfettiWidget(
                        blastDirection: pi / 2,
                        confettiController: confettiController,
                        shouldLoop: false,
                      ),
                      Container(
                        padding: EdgeInsets.all(15.r) ,
                        margin: EdgeInsets.only(bottom: 16.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          color: Color.fromARGB(0, 0, 0, 0),
                          boxShadow: [
                            BoxShadow(
                              color: color1.withOpacity(0.25),
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: ListTile(
                          title: Text(
                            tasks[index]['title'] ?? 'Evening Reflection 🌜✨', // Hardcoded for testing
                            textDirection: TextDirection.ltr, // Ensure left-to-right text direction
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 45.sp,
                              decoration: isChecked[index] ? TextDecoration.lineThrough : null,
                            ),
                          ),
                          subtitle: Text(
                            tasks[index]['description'] ?? 'No Description', // Ensure null safety
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40.sp,
                              decoration: isChecked[index] ? TextDecoration.lineThrough : null,
                            ),
                          ),
                          trailing: Checkbox(
                            focusColor: color1,
                            hoverColor: color1,
                            activeColor: lightTextColor1,
                            checkColor: Colors.white,
                            value: isChecked[index],
                            onChanged: (value) {
                              setState(() {
                                isChecked[index] = value!;
                                confettiController.play();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
  }
}
