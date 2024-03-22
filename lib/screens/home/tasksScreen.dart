import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
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
    var url = Uri.parse('https://mindcare-app.onrender.com/api/tasks/');
    var response = await http.get(url);

   if (response.statusCode == 200) {
      var items = json.decode(response.body);
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
  void ChangeTasksStatus(){
    
  }

  @override
  Widget build(BuildContext context) {
    return isLoading? const Center(child: const CircularProgressIndicator(color: Colors.white,),) : 
        
        Padding(
          padding: EdgeInsets.all(90.r),
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
          },
          // background: Container(color: Colors.red),
          child: Column(
            children: [
              ConfettiWidget(
                  blastDirection: pi / 2,
                  confettiController: confettiController,
                  shouldLoop: false,
                ),
              Container(
                
                margin: EdgeInsets.only(bottom: 50.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r),
                  color: Color.fromARGB(6, 255, 255, 255),
                  boxShadow: [
                    BoxShadow(
                      color: color1.withOpacity(0.5),
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: 
                ListTile(
              title: Text(
                      tasks[index]['title'],
                      style: TextStyle(
              color: Colors.white,
              fontSize: 50.sp,
              decoration: isChecked[index] ? TextDecoration.lineThrough : null,
                      ),
              ),
              subtitle: Text(
                      tasks[index]['description'],
                      style: TextStyle(
              color: Colors.white,
              fontSize: 40.sp,
              decoration: isChecked[index] ? TextDecoration.lineThrough : null,
                      ),
              ),
              trailing: Checkbox(
                      focusColor: color1,
                      hoverColor: color1,
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
                // ListTile(
                //   title: Text(
                //     tasks[index]['title'],
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 50.sp,
                //     ),
                //   ),
                //   subtitle: Text(
                //     tasks[index]['description'],
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 40.sp,
                //     ),
                //   ),
                //   trailing: Checkbox(
                //     focusColor: color1,
                //     hoverColor: color1,
                //     checkColor: Colors.white,
                //     value: isChecked[index],
                //     onChanged: (value) {
                //       setState(() {
                //         isChecked[index] = value!;
                //       });
                //     },
                //   ),
                // ),
              
              ),
            ],
          ),
        );
          },
        ),
          // 
          // ListView.builder(
          //   itemCount: tasks.length,
          //   itemBuilder: (context, index) {
          //     return Container(
          //       margin: EdgeInsets.only(bottom: 50.r),
          //       decoration: BoxDecoration(
        
          //         borderRadius: BorderRadius.circular(40.r),
          //         color: const Color.fromARGB(6, 138, 138, 138),
          //         boxShadow: [
          //         BoxShadow(
                    
          //           color: color1.withOpacity(0.5),
          //           // spreadRadius: 0.5,
          //           // blurRadius: 7,
          //           offset: const Offset(0, 3), // changes position of shadow
          //         ),
          //         ]
          //       ),
          //        child: ListTile(
          //         title: Text(
          //           tasks[index]['title'],
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 50.sp,
          //           ),
        
          //         ),
          //         subtitle: Text(
          //           tasks[index]['description'],
          //           style: TextStyle(
          //             color: Colors.white,
          //             fontSize: 40.sp,
          //           ),
          //         ),
        
          //               trailing: Checkbox(
          //                 // activeColor: color1,
          //                 focusColor: color1,
          //                 hoverColor: color1,
          //                 checkColor: Colors.white,
          //                 value: isChecked[index],
          //                 onChanged: (value) {
          //                   setState(() {
          //                     isChecked[index] = value!;
        
          //                     // Call your confetti widget here
          //                   });
          //                 },
          //               ),
          //     ),
          //     );  
          //   },
          // ),

    );

      }
}