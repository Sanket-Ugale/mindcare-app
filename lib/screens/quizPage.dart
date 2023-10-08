import 'package:flutter/material.dart';

class quizPage extends StatelessWidget {
  const quizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("QUIZ", style: TextStyle(letterSpacing: 5),),centerTitle: true,),
    );
  }
}