import 'package:flutter/material.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:mindcare/const/colors.dart';
import 'package:mindcare/screens/quiz/quizPage.dart';
import 'package:page_transition/page_transition.dart';

class quizStartPage extends StatefulWidget {
  const quizStartPage({super.key});

  @override
  State<quizStartPage> createState() => _quizStartPageState();
}

class _quizStartPageState extends State<quizStartPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 150,
        ),
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
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  "Mind Quest",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text(
                  "Answer the questions to get a better understanding of your mental health.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              // SizedBox(
              //   height: 300,
              // ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                // child: ElevatedButton(
                //   onPressed: () {
                //     Navigator.pushNamed(context, '/quiz1');
                //   },
                //   child: const Text(
                //     "Start Quiz",
                //     style: TextStyle(
                //       color: Colors.white,
                //       fontSize: 20,
                //     ),
                //   ),
                //   style: ElevatedButton.styleFrom(
                //     primary: color2,
                //     padding: const EdgeInsets.symmetric(
                //         horizontal: 50, vertical: 20),
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(30),
                //     ),
                //   ),
                // ),
                child: AnimatedButton(
                  height: 70,
                  width: 200,
                  text: 'Start Quiz',
                  isReverse: true,
                  selectedTextColor: Colors.black,
                  transitionType: TransitionType.LEFT_TO_RIGHT,
                  // textStyle: submitTextStyle,
                  backgroundColor: const Color.fromARGB(158, 0, 0, 0),
                  borderColor: Colors.white,
                  borderRadius: 50,
                  borderWidth: 2,
                  onPress: () {
                    Navigator.pushReplacement(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 500),
                        type: PageTransitionType.fade,
                        child: quizPage(start: true),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
