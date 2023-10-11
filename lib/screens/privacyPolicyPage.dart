import 'package:flutter/material.dart';

class privacyPolicyPage extends StatefulWidget {
  const privacyPolicyPage({super.key});

  @override
  State<privacyPolicyPage> createState() => _privacyPolicyPageState();
}

class _privacyPolicyPageState extends State<privacyPolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("PRIVACY POLICY", style: TextStyle(letterSpacing: 5),),centerTitle: true,),
    );
  }
}