import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:mindcare/const/api_Urls.dart';

class AnalysisPage extends StatefulWidget {
  const AnalysisPage({Key? key}) : super(key: key);

  @override
  _AnalysisPageState createState() => _AnalysisPageState();
}

class _AnalysisPageState extends State<AnalysisPage> {
  late Future<Map<String, dynamic>> _dataFuture;

  @override
  void initState() {
    super.initState();
    _dataFuture = fetchData();
  }

  Future<Map<String, dynamic>> fetchData() async {
    try {
      final response = await http.get(Uri.parse(domain_url+'/chatAnalysis/'));
      if (response.statusCode == 200) {
        final decodedData = jsonDecode(response.body);
        if (decodedData is Map<String, dynamic>) {
          return decodedData;
        } else {
          throw Exception('Invalid data format');
        }
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: _dataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(color: Colors.teal),
          );
        } else if (snapshot.hasError) {
          return _buildErrorMessage("Oops! Something went wrong.");
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return _buildErrorMessage("No data available.");
        } else {
          final data = snapshot.data!;
          return SingleChildScrollView(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader("Your Wellness Journey"),
                SizedBox(height: 16.h),
                _buildMoodTracker(data['moodTracker']),
                SizedBox(height: 16.h),
                _buildStressLevel(data['stressLevel']),
                SizedBox(height: 16.h),
                _buildSleepQuality(data['sleepQuality']),
                SizedBox(height: 16.h),
                _buildActivityLevel(data['activityLevel']),
                SizedBox(height: 16.h),
                _buildProgressInsights(data['progressInsights']),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildErrorMessage(String message) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Text(
          message,
          style: TextStyle(color: Colors.white, fontSize: 16.sp),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildHeader(String title) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.ac_unit_sharp, color: Colors.amberAccent, size: 100.sp),
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 74.sp, fontWeight: FontWeight.bold),
            ),

          ],
        ),
        SizedBox(height: 30.h ,)
      ],
    );
  }

  Widget _buildMoodTracker(dynamic moodData) {
    if (moodData == null || !(moodData is List) || moodData.isEmpty) {
      return _buildErrorCard("Mood Tracker", "No mood data available");
    }

    return _buildCard(
      "Mood Tracker",
      Column(
        children: [
          _buildSubtitle("How you've been feeling this week"),
          SizedBox(height: 8.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: (moodData).map((day) {
              return Column(
                children: [
                  Text(day['day'] ?? '', style: TextStyle(color: Colors.white70, fontSize: 22.sp)),
                  SizedBox(height: 4.h),
                  Icon(
                    _getMoodIcon(day['mood'] ?? ''),
                    color: _getMoodColor(day['mood'] ?? ''),
                    size: 64.w,
                  ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  IconData _getMoodIcon(String mood) {
    switch (mood.toLowerCase()) {
      case 'happy':
        return Icons.sentiment_very_satisfied;
      case 'good':
        return Icons.sentiment_satisfied;
      case 'okay':
        return Icons.sentiment_neutral;
      case 'sad':
        return Icons.sentiment_dissatisfied;
      default:
        return Icons.sentiment_very_dissatisfied;
    }
  }

  Color _getMoodColor(String mood) {
    switch (mood.toLowerCase()) {
      case 'happy':
        return Colors.green;
      case 'good':
        return Colors.lightGreen;
      case 'okay':
        return Colors.yellow;
      case 'sad':
        return Colors.orange;
      default:
        return Colors.red;
    }
  }

  Widget _buildStressLevel(dynamic stressLevel) {
    if (stressLevel == null || !(stressLevel is int)) {
      return _buildErrorCard("Stress Level", "Stress level data not available");
    }

    return _buildCard(
      "Stress Level",
      Column(
        children: [
          _buildSubtitle("Your current stress level"),
          SizedBox(height: 16.h),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                height: 220.w,
                width: 220.w,
                child: CircularProgressIndicator(
                  value: stressLevel / 100,
                  strokeWidth: 22.w,
                  backgroundColor: Colors.grey[800],
                  valueColor: AlwaysStoppedAnimation<Color>(_getStressColor(stressLevel)),
                ),
              ),
              Text(
                "$stressLevel%",
                style: TextStyle(color: Colors.white, fontSize: 34.sp, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            _getStressLevelText(stressLevel),
            style: TextStyle(color: Colors.white70, fontSize: 24.sp),
          ),
        ],
      ),
    );
  }

  Color _getStressColor(int level) {
    if (level < 30) return Colors.green;
    if (level < 60) return Colors.yellow;
    return Colors.red;
  }

  String _getStressLevelText(int level) {
    if (level < 30) return "Low";
    if (level < 60) return "Moderate";
    return "High";
  }
  Widget _buildSleepQuality(dynamic sleepData) {
    if (sleepData == null || !(sleepData is Map<String, dynamic>) || sleepData.isEmpty) {
      return _buildErrorCard("Sleep Quality", "Sleep quality data not available");
    }

    return _buildCard(
      "Sleep Quality",
      Column(
        children: [
          _buildSubtitle("Last night's sleep"),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildSleepMetric("Duration", "${sleepData['duration'] ?? 'N/A'} hrs", Icons.access_time),
              _buildSleepMetric("Quality", sleepData['quality'] ?? 'N/A', Icons.star),
              _buildSleepMetric("Deep Sleep", "${sleepData['deepSleep'] ?? 'N/A'} hrs", Icons.nightlight_round),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSleepMetric(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.teal, size: 100.w),
        SizedBox(height: 4.h),
        Text(value, style: TextStyle(color: Colors.white, fontSize: 35.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 2.h),
        Text(label, style: TextStyle(color: Colors.white70, fontSize: 25.sp)),
      ],
    );
  }

  Widget _buildActivityLevel(dynamic activityData) {
    if (activityData == null || !(activityData is Map<String, dynamic>) || activityData.isEmpty) {
      return _buildErrorCard("Activity Level", "Activity data not available");
    }

    return _buildCard(
      "Activity Level",
      Column(
        children: [
          _buildSubtitle("Today's activity"),
          SizedBox(height: 16.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildActivityMetric("Steps", activityData['steps']?.toString() ?? 'N/A', Icons.directions_walk),
              _buildActivityMetric("Calories", "${activityData['calories'] ?? 'N/A'} kcal", Icons.local_fire_department),
              _buildActivityMetric("Active Time", "${activityData['activeMinutes'] ?? 'N/A'} mins", Icons.timer),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActivityMetric(String label, String value, IconData icon) {
    return Column(
      children: [
        Icon(icon, color: Colors.orange, size: 100.w),
        SizedBox(height: 4.h),
        Text(value, style: TextStyle(color: Colors.white, fontSize: 35.sp, fontWeight: FontWeight.bold)),
        SizedBox(height: 2.h),
        Text(label, style: TextStyle(color: Colors.white70, fontSize: 25.sp)),
      ],
    );
  }

  Widget _buildProgressInsights(dynamic insights) {
    if (insights == null || !(insights is List) || insights.isEmpty) {
      return _buildErrorCard("Progress Insights", "No insights available");
    }

    return _buildCard(
      "Your Progress Insights",
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSubtitle("Here's what we've noticed:"),

          SizedBox(height: 20.h),
          ...(insights).map((insight) => Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.lightbulb, color: Colors.yellow, size: 35.w),
                    SizedBox(width: 10.w),
                    Expanded(
                      child: Text(
                        insight ?? '',
                        style: TextStyle(color: Colors.white, fontSize: 35.sp),
                      ),
                    ),
                  ],
                ),
              )).toList(),
              SizedBox(height: 16.h),
        ],
        
      ),
    );
  }

  Widget _buildCard(String title, Widget content) {
    return Card(
      color: Color.fromARGB(68, 0, 0, 0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.w)),
      child: Padding(
        padding: EdgeInsets.all(26.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 45.sp, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.h),
            content,
          ],
        ),
      ),
    );
  }

  Widget _buildSubtitle(String subtitle) {
    return Text(
      subtitle,
      style: TextStyle(color: Colors.white70, fontSize: 36.sp),
    );
  }

  Widget _buildErrorCard(String title, String errorMessage) {
    return _buildCard(
      title,
      Center(
        child: Text(
          errorMessage,
          style: TextStyle(color: Colors.white70, fontSize: 15.sp),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}