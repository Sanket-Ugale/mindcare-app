import 'package:flutter/material.dart';
import 'package:mindcare/screens/appointment/appointmentCallPage.dart';
import 'package:page_transition/page_transition.dart';

class appointmentPage extends StatelessWidget {
  const appointmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("APPOINTMENT's", style: TextStyle(letterSpacing: 5),),centerTitle: true,),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Schedule an Appointment"),
            const SizedBox(height: 20,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.all(20),
              ),
              onPressed: () {
                Navigator.push(context, PageTransition(type: PageTransitionType.rightToLeft, child: AppointmentCallPage()));
              },
              child: const Text("Join Call"),
            ),
          ],
        ),
      ),
    );
  }
}