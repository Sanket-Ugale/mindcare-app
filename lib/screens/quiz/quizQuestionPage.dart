import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:mindcare/const/colors.dart';
import 'package:mindcare/screens/home/home.dart';
import 'package:mindcare/widgets/quizRadioButton.dart';
import 'package:page_transition/page_transition.dart';
import 'package:confetti/confetti.dart';
import 'package:http/http.dart' as http;

import 'package:emoji_rating_bar/emoji_rating_bar.dart';
import 'package:mindcare/const/colors.dart';
import 'package:provider/provider.dart';

class quizQuestionPagea extends StatefulWidget {
  quizQuestionPagea({super.key});

  @override
  State<quizQuestionPagea> createState() => _quizQuestionPageaState();
}

class _quizQuestionPageaState extends State<quizQuestionPagea> {
  String quizResultsJson = '[]'; // Store the results of all questions as a JSON string

  final ValueNotifier<String> _quizResultsNotifier = ValueNotifier('[]');

  // Future<void> updateQuizResult(String resultsJson) async {
  //   try {
  //       print(resultsJson);
  //     final response = await http.put(
  //       // Uri.parse('https://mindcare-app.onrender.com/api/quiz/'),
  //       Uri.parse('http://localhost:8000/api/quiz/'),
  //       // headers: <String, String>{
  //       //   'Content-Type': 'application/json; charset=UTF-8',
  //       // },
  //       body: resultsJson,
  //     );

  //     if (response.statusCode == 200) {
  //       print('Quiz results updated successfully.');
  //     } else {
  //       throw Exception('Failed to update quiz results. Server responded with status code ${response.statusCode}.');
  //     }
  //   } catch (e, stackTrace) {
  //     print('Failed to update quiz results. Error: $e');
  //     print('Stack trace: $stackTrace');
  //     throw Exception('Failed to update quiz results.');
  //   }
  // }

Future<void> updateQuizResult(String resultsJson) async {
  try {
    final response = await http.put(
        Uri.parse('https://mindcare-app.onrender.com/api/quiz/'),
      // Uri.parse('http://localhost:8000/api/quiz/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': '*/*'
        },
      body: resultsJson,
    );
  print('Updating quiz results...');

    if (response.statusCode == 200) {
      print('Quiz results updated successfully.');
    } else {
      throw Exception('Failed to update quiz results. Server responded with status code ${response.statusCode}.');
    }
  } catch (e, stackTrace) {
    print('Failed to update quiz results. Error: $e');
    print('Stack trace: $stackTrace');
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Failed to update quiz results. Please try again later.')),
    );
  }
}

  Future<List<dynamic>> fetchQuizQuestions() async {
    final response = await http.get(Uri.parse('https://mindcare-app.onrender.com/api/quiz/'));

    if (response.statusCode == 200) {
      // return jsonDecode(response.body);

      List<dynamic> data = jsonDecode(response.body);
      return data.take(10).toList();
    } else {
      throw Exception('Failed to load quiz questions');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<dynamic>>(
      future: fetchQuizQuestions(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator(color: Colors.white,));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          return Column(
            children:[ ...snapshot.data!.map((question) {
              return Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    decoration: BoxDecoration(
                      color: lightTextColor3,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                question['id'].toString() +
                                        ". " +
                                        question['question'].toString(),style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            StatefulBuilder(
                              builder: (context, setState) {
                                return EmojiRatingBar(
                                  rating: 3,
                                  onRateChange: (rating) {
                                    if (rating != 3) { // Check if the rating is not the default value
                                      setState(() {
                                        List<dynamic> results = jsonDecode(quizResultsJson);
                                        results.add({
                                          "user_profile_id":1,
                                          "question_id": question['id'],
                                          "question": question['question'],
                                          "result": rating,
                                        });
                                        quizResultsJson = jsonEncode(results);
                                        _quizResultsNotifier.value = quizResultsJson;
                                      });
                                    }
                                    print(rating);
                                  },
                                  isReadOnly: false,
                                  spacing: 10,
                                  size: 40,
                                  selectedSize: 45,
                                  isShowTitle: true,
                                  // isShowDivider: true,
                                  titleStyle: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 8,
                                  ),
                                  selectedTitleStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8,
                                  ),
                                  animationDuration: Duration(milliseconds: 300),
                                  animationCurve: Curves.easeInOut,
                                  ratingBarType: RatingBarType.mood,
                                  applyColorFilter: true,
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
            AnimatedButton(
              height: 60,
              width: 200,
              text: 'Submit',
              isReverse: true,
              selectedTextColor: Colors.black,
              transitionType: TransitionType.LEFT_TO_RIGHT,
              // textStyle: submitTextStyle,
              backgroundColor: lightTextColor3,
              borderColor: Colors.white,
              borderRadius: 40,
              borderWidth: 2, onPress: () async {
                print(quizResultsJson);
                await updateQuizResult(quizResultsJson);
                Navigator.push(
                  context,
                  PageTransition(
                    duration: const Duration(milliseconds: 500),
                    type: PageTransitionType.fade,
                    child: quizSubmitPage(quizResultsJson: quizResultsJson),
                  ),
               );
               },
            ),
            SizedBox(height: 20,)
            ]
          );
        }
      },
    );
  }
}

class quizSubmitPage extends StatefulWidget {
  final String quizResultsJson;

  const quizSubmitPage({Key? key, required this.quizResultsJson}) : super(key: key);

  @override
  State<quizSubmitPage> createState() => _quizSubmitPageState();
}

class _quizSubmitPageState extends State<quizSubmitPage> {
  final confettiController = ConfettiController(duration: const Duration(seconds: 3));

  @override
  void initState() {
    confettiController.play();
    super.initState();
  }

  @override
  void dispose() {
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> quizResultsList = jsonDecode(widget.quizResultsJson);

    String jsonString = jsonEncode(quizResultsList);

    print(jsonString);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 35,
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
          child: SingleChildScrollView(
            child: Column(
              children: [
                ConfettiWidget(
                  blastDirection: pi / 2,
                  confettiController: confettiController,
                  shouldLoop: true,
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Your Score is 5/7", style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),),
                      const SizedBox(height: 20,),
                      AnimatedButton(
                        height: 70,
                        width: 200,
                        text: 'Go to Home',
                        isReverse: true,
                        selectedTextColor: Colors.black,
                        transitionType: TransitionType.LEFT_TO_RIGHT,
                        // textStyle: submitTextStyle,
                        backgroundColor: lightTextColor3,
                        borderColor: Colors.white,
                        borderRadius: 50,
                        borderWidth: 2, onPress: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              duration: const Duration(milliseconds: 500),
                              type: PageTransitionType.fade,
                              child: const homePage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  // TextColor: Colors.black,
                  //       transitionType: Trans
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}