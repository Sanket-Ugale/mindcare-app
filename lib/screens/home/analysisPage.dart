import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

class analysisPage extends StatelessWidget {
  const analysisPage({Key? key}) : super(key: key);

  Future<Map<String, dynamic>> fetchData() async {
  final response = await http.get(Uri.parse('https://mindcare-app.onrender.com/chatAnalysis/'));
  if (response.statusCode == 200) {
    print(response.body);
    return jsonDecode(response.body);
  } else {
    print('Failed to load data. Status code: ${response.statusCode}. Body: ${response.body}');
    throw Exception('Failed to load data');
  }
}

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          ));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Padding(
            padding: EdgeInsets.all(90.r),
            child: Column(
              children: [
                Text(
                  "Chat Analysis",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 60.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  padding: EdgeInsets.all(70.r),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30.r),
                  ),
                  child: Column(
                    children: snapshot.data!.entries.map((entry) {
                      double value = entry.value;
                      if (value.isInfinite || value.isNaN) {
                        value = 0; // Replace Infinity or NaN with 0
                      }
                      // Normalize the value to be between 0 and 1
                      value = value.clamp(0, 1).toDouble();
                      return Column(
                        children: [

                          Text('${entry.key}: ${entry.value.toStringAsFixed(2)}'),
                          LinearProgressIndicator(minHeight: 7.0, value: value, borderRadius: BorderRadius.circular(100),),
                          const SizedBox(height: 10,)
                        ],
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
