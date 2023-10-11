import 'package:flutter/material.dart';

class splashScreenPage extends StatelessWidget {
  const splashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SPLASH SCREEN'S", style: TextStyle(letterSpacing: 5),),centerTitle: true,),
    );
  }
}