import 'package:flutter/material.dart';
import 'package:mindcare/const/colors.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:mindcare/screens/quiz/quizQuestionPage.dart';
import 'package:mindcare/screens/quiz/quizStartPage.dart';
class quizPage extends StatelessWidget {
   const quizPage({super.key, required this.start});
  final bool start;
     

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text("QUIZ", style: TextStyle(letterSpacing: 5),),centerTitle: true,),

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
              
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: CircleAvatar(
                    radius: 25,
                    backgroundColor: lightTextColor3,
                    child: Icon(
                      Icons.arrow_back,
                      color: color2,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(
                        context); // This pops the current route off the stack
                  },
                ),
                start==true?quizQuestionPagea():quizStartPage(),
                 ],
            ),
          ),
        ),
      ),
    );
  }
}