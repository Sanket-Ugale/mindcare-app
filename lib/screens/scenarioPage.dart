import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mindcare/const/api_Urls.dart';

class ScenarioQuizPage extends StatefulWidget {
  @override
  _ScenarioQuizPageState createState() => _ScenarioQuizPageState();
}

class _ScenarioQuizPageState extends State<ScenarioQuizPage> {
  List<dynamic> set1 = [];
  List<dynamic> set2 = [];
  List<dynamic> set3 = [];
  int currentQuestionIndex = 0;
  int? selectedScenarioLabel;
  bool isNextButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    fetchScenarioData();
  }

  Future<void> fetchScenarioData() async {
    final response = await http.get(Uri.parse(domain_url +'/api/scenarioquestion/'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        set1 = data['set_1'].map((item) => {
          'id': item['id'],
          'scenario_image': item['scenario_image'],
          'scenario_label': int.parse(item['scenario_label']),
        }).toList();

        set2 = data['set_2'].map((item) => {
          'id': item['id'],
          'scenario_image': item['scenario_image'],
          'scenario_label': int.parse(item['scenario_label']),
        }).toList();

        set3 = data['set_3'].map((item) => {
          'id': item['id'],
          'scenario_image': item['scenario_image'],
          'scenario_label': int.parse(item['scenario_label']),
        }).toList();
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<void> submitResult(int scenarioLabel, int scenarioQuestionId) async {
    final response = await http.post(
      Uri.parse(domain_url+'/api/scenarioresult/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "result": scenarioLabel,
        "timestamp": DateTime.now().toIso8601String(),
        "user_profile_id": 1,
        "ScenarioQuestion_id": scenarioQuestionId,
      }),
    );
    if (response.statusCode != 201) {
      throw Exception('Failed to submit result');
    }
  }

  void onSelectImage(int scenarioLabel) {
    setState(() {
      selectedScenarioLabel = scenarioLabel;
      isNextButtonEnabled = true;
    });
  }

  void onNextQuestion() {
    if (currentQuestionIndex < 2) {
      submitResult(selectedScenarioLabel!, getScenarioIdForCurrentQuestion());
      setState(() {
        currentQuestionIndex++;
        selectedScenarioLabel = null;
        isNextButtonEnabled = false;
      });
    }
  }

  void onSubmit() {
    submitResult(selectedScenarioLabel!, getScenarioIdForCurrentQuestion());
    showSuccessDialog();
  }

  int getScenarioIdForCurrentQuestion() {
    switch (currentQuestionIndex) {
      case 0:
        return set1[0]['id'];
      case 1:
        return set1[1]['id'];
      case 2:
        return set1[2]['id'];
      default:
        return 0;
    }
  }

  void showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 0, 55, 67),
          title: const Text("Success", style: TextStyle(color: Colors.white)),
          content: const Text("Your result has been successfully submitted.", style: TextStyle(color: Colors.white)),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text("OK", style: TextStyle(color: Colors.teal)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (set1.isEmpty || set2.isEmpty || set3.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator(color: Colors.teal)),
      );
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment(0.8, 1),
              colors: <Color>[
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 0, 55, 67),
                Color.fromARGB(255, 0, 91, 111),
              ],
              tileMode: TileMode.mirror,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: IconButton(
                  icon: const CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white54,
                    child: Icon(
                      Icons.arrow_back,
                      color: Color.fromARGB(206, 0, 0, 0),
                    ),
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Text(
                      //   'Scenario Quiz',
                      //   style: TextStyle(
                      //     fontSize: 32,
                      //     color: Colors.white,
                      //     fontWeight: FontWeight.bold,
                      //     letterSpacing: 2,
                      //   ),
                      // ),
                      const Text(
                        'Choose the image which you feel more related to you.',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          // fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        ),
                      ),
                      // SizedBox(height: 20),
                      // Text(
                      //   'Scenario ${currentQuestionIndex + 1}',
                      //   style: TextStyle(
                      //     fontSize: 24,
                      //     color: Colors.white70,
                      //     fontWeight: FontWeight.w500,
                      //   ),
                      // ),
                      const SizedBox(height: 40),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildImageButton("http://192.168.1.6:8000/"+set1[currentQuestionIndex]['scenario_image'], set1[currentQuestionIndex]['scenario_label']),
                          buildImageButton("http://192.168.1.6:8000/"+set2[currentQuestionIndex]['scenario_image'], set2[currentQuestionIndex]['scenario_label']),
                          buildImageButton("http://192.168.1.6:8000/"+set3[currentQuestionIndex]['scenario_image'], set3[currentQuestionIndex]['scenario_label']),
                        ],
                      ),
                      const SizedBox(height: 50),
                      if (currentQuestionIndex < 2)
                        ElevatedButton(
                          onPressed: isNextButtonEnabled ? onNextQuestion : null,
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: const Color.fromARGB(106, 253, 253, 253),
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text('Next', style: TextStyle(fontSize: 18)),
                        )
                      else
                        ElevatedButton(
                          onPressed: isNextButtonEnabled ? onSubmit : null,
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.white12,
                            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          child: const Text('Submit', style: TextStyle(fontSize: 18)),
                        ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildImageButton(String imageUrl, int scenarioLabel) {
    return GestureDetector(
      onTap: () => onSelectImage(scenarioLabel),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.25,
        height: MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          border: Border.all(
            color: selectedScenarioLabel == scenarioLabel ? Colors.green : Colors.white,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            imageUrl,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                      : null,
                  color: Colors.teal,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}