import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class tasksPage extends StatelessWidget {
  tasksPage({Key? key}) : super(key: key);

  final List<String> tasks = [
    'Mind Quest',
    'FaceSoul',
    'Talk Mode',
    'Wear Care',
    'Life Portraits',
    'Appointment',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(90.r),
      child: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            color: Color.fromARGB(125, 255, 255, 255),
            child: ListTile(
              title: Text(tasks[index]),
            ),
          );
        },
      ),
    );
  }
}