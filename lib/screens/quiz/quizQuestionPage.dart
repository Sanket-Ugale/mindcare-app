import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:mindcare/const/colors.dart';
import 'package:mindcare/screens/home/home.dart';
import 'package:mindcare/widgets/quizRadioButton.dart';
import 'package:page_transition/page_transition.dart';
import 'package:confetti/confetti.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
class quizQuestionPagea extends StatefulWidget {
  quizQuestionPagea({super.key});

  @override
  State<quizQuestionPagea> createState() => _quizQuestionPageaState();
  
}

class _quizQuestionPageaState extends State<quizQuestionPagea> {
  Map<String, int> quizResults = {}; // Store the results of all questions

  Future<void> updateQuizResult(String id, int result) async {
    final response = await http.patch(
      Uri.parse('https://mindcare-app.onrender.com/api/quiz/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, int>{
        'pk': int.parse(id),
        'result': result,
      }),
    );

    if (response.statusCode == 200) {
      print('Quiz result updated successfully.');
    } else {
      throw Exception('Failed to update quiz result.');
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
              return quizRadioButton(
                questionsNum: question['id'], 
                questions: question['question'], 
                result: question['result'],
                onResultChange: (result) {
                  quizResults[question['id']] = result; // Store the result when it changes
                }
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
                for (var entry in quizResults.entries) {
                  await updateQuizResult(entry.key, entry.value);
                }
                Navigator.push(
                  context,
                  PageTransition(
                    duration: const Duration(milliseconds: 500),
                    type: PageTransitionType.fade,
                    child:  quizSubmitPage(),
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
  quizSubmitPage({super.key});

  @override
  State<quizSubmitPage> createState() => _quizSubmitPageState();
  


}

class _quizSubmitPageState extends State<quizSubmitPage> {
    final confettiController = ConfettiController(duration: const Duration(seconds: 3));
    void initState() {  
      confettiController.play();
      super.initState();
    }
    @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    confettiController.dispose();
  }
  @override
  Widget build(BuildContext context) {
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
        child:SingleChildScrollView(
          child: Column(
            children: [
              ConfettiWidget(
            blastDirection: pi / 2,
            confettiController: confettiController,
            shouldLoop: true,
          ),
              Container(
                height: MediaQuery.of(context).size.height ,
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
              ),
            ],
          ),
        ),
            ),
      ),
    );
  }
}