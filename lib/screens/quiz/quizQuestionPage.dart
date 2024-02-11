import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:mindcare/const/colors.dart';
import 'package:mindcare/screens/home/home.dart';
import 'package:mindcare/widgets/quizRadioButton.dart';
import 'package:page_transition/page_transition.dart';
import 'package:confetti/confetti.dart';
class quizQuestionPagea extends StatefulWidget {
  quizQuestionPagea({super.key});

  @override
  State<quizQuestionPagea> createState() => _quizQuestionPageaState();
  
}

class _quizQuestionPageaState extends State<quizQuestionPagea> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
              quizRadioButton(questionsNum:1, questions:"What color is of your flutter?"),
              
              quizRadioButton(questionsNum:2, questions:"What color is of your flutter?"),
    
              quizRadioButton(questionsNum:3, questions:"What color is of your flutter?"),
    
              quizRadioButton(questionsNum:4, questions:"What color is of your flutter?"),
    
              quizRadioButton(questionsNum:5, questions:"What color is of your flutter?"),
    
              quizRadioButton(questionsNum:6, questions:"What color is of your flutter?"),
    
              quizRadioButton(questionsNum:7, questions:"What color is of your flutter?"),

              AnimatedButton(
              height: 70,
              width: 200,
              text: 'Submit',
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
                        child: quizSubmitPage(),
                      ),
                    );
               },
            ),
            SizedBox(height: 20,)
            ],
    );
  }
}

class quizSubmitPage extends StatefulWidget {
  quizSubmitPage({super.key});

  @override
  State<quizSubmitPage> createState() => _quizSubmitPageState();
  


}

class _quizSubmitPageState extends State<quizSubmitPage> {
    final confettiController = ConfettiController(duration: Duration(seconds: 3));
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
                
                    Text("Your Score is 5/7", style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),),
                    SizedBox(height: 20,),
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
                                  child: homePage(),
                                  
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