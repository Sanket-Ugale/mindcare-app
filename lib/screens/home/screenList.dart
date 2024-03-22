import 'package:flutter/material.dart';
import 'package:mindcare/screens/appointment/appointmentPage.dart';
import 'package:mindcare/screens/authentication/changePasswordPage.dart';
import 'package:mindcare/screens/chat/chatPage.dart';
import 'package:mindcare/screens/authentication/forgotPass.dart';
import 'package:mindcare/screens/error/maintainance.dart';
import 'package:mindcare/screens/error/noInternetError.dart';
import 'package:mindcare/screens/home/home.dart';
import 'package:mindcare/screens/authentication/loginPage.dart';
import 'package:mindcare/screens/home/privacyPolicyPage.dart';
import 'package:mindcare/screens/profile/profilePage.dart';
import 'package:mindcare/screens/quiz/quizPage.dart';
import 'package:mindcare/screens/home/settings.dart';
import 'package:mindcare/screens/authentication/signUpPage.dart';
import 'package:mindcare/screens/reminders/reminderPage.dart';
import 'package:mindcare/screens/splash/splashScreen.dart';
import 'package:mindcare/screens/authentication/verifyOTPpage.dart';
import 'package:page_transition/page_transition.dart';

class ScreenList extends StatelessWidget {
  const ScreenList({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        //       floatingActionButton: FloatingActionButton(onPressed:() async {
        //         // Request SMS permission
        // var smsPermission = await Permission.sms.request();

        // // Request storage permission
        // var storagePermission = await Permission.storage.request();
        // var videos = await Permission.videos.request();
        // var photos = await Permission.photos.request();
        // var camera = await Permission.camera.request();
        // var light12 = await Permission.camera.request();

        // // Check if both permissions are granted
        // if (smsPermission.isGranted&& storagePermission.isGranted && videos.isGranted && photos.isGranted && camera.isGranted && light12.isGranted) {

        //   print("+++++++++++++++++++++++ done babes ++++++++++++++++++++++");
        //   // Permissions granted, you can perform your actions here
        //   // For example, you can read SMS or access storage.
        //   // Remember to handle the errors if permissions are denied.
        // } else {
        //   print("+++++++++++++++++++++++ Permissions denied babes ++++++++++++++++++++++");
        //   // Permissions denied
        //   // You can show a message to the user or take appropriate action
        // }
        //       },),
        appBar: AppBar(
          leading: const Icon(Icons.ac_unit_outlined),
          title: const Text(
            "SCREEN's LIST",
            style: TextStyle(letterSpacing: 4, wordSpacing: 4),
          ),
          centerTitle: true,
          titleSpacing: 4,
          elevation: 0,
        ),
        body: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(31, 163, 163, 163)),
          child: ListView(
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x00444444).withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 10,
                        spreadRadius: -7,
                      )
                    ]),
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  trailing: const Icon(
                    Icons.construction,
                    color: Colors.redAccent,
                  ),
                  leading: const Icon(Icons.home),
                  title: const Text("Home"),
                  subtitle: const Text("Main page screen"),
                  style: ListTileStyle.list,
                  // focusColor: Colors.black38,
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 400),
                        type: PageTransitionType.fade,
                        child: const homePage(),
                      ),
                    );
                  },
                  minVerticalPadding: 6,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x00444444).withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 10,
                        spreadRadius: -7,
                      )
                    ]),
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  trailing: const Icon(
                    Icons.done,
                    color: Colors.green,
                  ),
                  leading: const Icon(Icons.lock),
                  title: const Text("Login"),
                  subtitle: const Text("Login page screen"),
                  style: ListTileStyle.list,
                  // focusColor: Colors.black38,
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 400),
                        type: PageTransitionType.fade,
                        child: loginPage(),
                      ),
                      // MaterialPageRoute<void>(
                      //   builder: (BuildContext context) => loginPage(),
                      // ),
                    );
                  },
                  minVerticalPadding: 6,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x00444444).withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 10,
                        spreadRadius: -7,
                      )
                    ]),
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  trailing: const Icon(
                    Icons.done,
                    color: Colors.green,
                  ),
                  leading: const Icon(Icons.lock),
                  title: const Text("Sign Up"),
                  subtitle: const Text("Sign Up page screen"),
                  style: ListTileStyle.list,
                  // focusColor: Colors.black38,
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 400),
                        type: PageTransitionType.fade,
                        child: SignupPage(),
                      ),
                    );
                  },
                  minVerticalPadding: 6,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x00444444).withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 10,
                        spreadRadius: -7,
                      )
                    ]),
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  trailing: const Icon(
                    Icons.done,
                    color: Colors.green,
                  ),
                  leading: const Icon(Icons.person),
                  title: const Text("Profile"),
                  subtitle: const Text("Profile page screen"),
                  style: ListTileStyle.list,
                  // focusColor: Colors.black38,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => profilePage(),
                      ),
                    );
                  },
                  minVerticalPadding: 6,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x00444444).withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 10,
                        spreadRadius: -7,
                      )
                    ]),
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  trailing: const Icon(
                    Icons.done,
                    color: Colors.green,
                  ),
                  leading: const Icon(Icons.forest),
                  title: const Text("Forgot Password"),
                  subtitle: const Text("Forgot Password page screen"),
                  style: ListTileStyle.list,
                  // focusColor: Colors.black38,
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 400),
                        type: PageTransitionType.fade,
                        child: ForgotpassPage(),
                      ),
                    );
                  },
                  minVerticalPadding: 6,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x00444444).withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 10,
                        spreadRadius: -7,
                      )
                    ]),
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  // trailing: Icon(Icons.done,color: Colors.green,),
                  leading: const Icon(Icons.settings),
                  title: const Text("Setting"),
                  subtitle: const Text("Setting page screen"),
                  style: ListTileStyle.list,
                  // focusColor: Colors.black38,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const settingPage(),
                      ),
                    );
                  },
                  minVerticalPadding: 6,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x00444444).withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 10,
                        spreadRadius: -7,
                      )
                    ]),
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  leading: const Icon(Icons.calendar_month),
                  title: const Text("Appointment's"),
                  subtitle: const Text("Appointment's page screen"),
                  style: ListTileStyle.list,
                  // focusColor: Colors.black38,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const AppointmentPage(),
                      ),
                    );
                  },
                  minVerticalPadding: 6,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x00444444).withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 10,
                        spreadRadius: -7,
                      )
                    ]),
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  leading: const Icon(Icons.chat),
                  title: const Text("Chat"),
                  subtitle: const Text("Chat page screen"),
                  style: ListTileStyle.list,
                  // focusColor: Colors.black38,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => chatPage(),
                      ),
                    );
                  },
                  minVerticalPadding: 6,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x00444444).withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 10,
                        spreadRadius: -7,
                      )
                    ]),
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  leading: const Icon(Icons.quiz),
                  title: const Text("Quiz"),
                  subtitle: const Text("Quiz page screen"),
                  style: ListTileStyle.list,
                  // focusColor: Colors.black38,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const quizPage(start: false,),
                      ),
                    );
                  },
                  minVerticalPadding: 6,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x00444444).withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 10,
                        spreadRadius: -7,
                      )
                    ]),
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  trailing: const Icon(
                    Icons.done,
                    color: Colors.green,
                  ),
                  leading: const Icon(Icons.numbers),
                  title: const Text("Verify OTP"),
                  subtitle: const Text("Verify OTP page screen"),
                  style: ListTileStyle.list,
                  // focusColor: Colors.black38,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const verifyOTPPage(),
                      ),
                    );
                  },
                  minVerticalPadding: 6,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x00444444).withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 10,
                        spreadRadius: -7,
                      )
                    ]),
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  trailing: const Icon(
                    Icons.done,
                    color: Colors.green,
                  ),
                  // trailing: Icon(Icons.construction,color: Colors.redAccent,),
                  leading: const Icon(Icons.info),
                  title: const Text("Privacy Policy"),
                  subtitle: const Text(
                      "Term's & conditions, Privacy Policy screen's"),
                  style: ListTileStyle.list,
                  // focusColor: Colors.black38,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            privacyPolicyPage(),
                      ),
                    );
                  },
                  minVerticalPadding: 6,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x00444444).withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 10,
                        spreadRadius: -7,
                      )
                    ]),
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  // trailing: Icon(Icons.construction,color: Colors.redAccent,),
                  leading: const Icon(Icons.screenshot),
                  title: const Text("Splash Screen"),
                  subtitle: const Text("App Introduction Screen's"),
                  style: ListTileStyle.list,
                  // focusColor: Colors.black38,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const splashScreenPage(),
                      ),
                    );
                  },
                  minVerticalPadding: 6,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x00444444).withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 10,
                        spreadRadius: -7,
                      )
                    ]),
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  // trailing: Icon(Icons.construction,color: Colors.redAccent,),
                  leading: const Icon(Icons.password),
                  title: const Text("Change Password"),
                  subtitle: const Text(
                      "Change Password screen (email,old password, new password, confirm password)"),
                  style: ListTileStyle.list,
                  // focusColor: Colors.black38,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const changePasswordPage(),
                      ),
                    );
                  },
                  minVerticalPadding: 6,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x00444444).withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 10,
                        spreadRadius: -7,
                      )
                    ]),
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  // trailing: Icon(Icons.construction,color: Colors.redAccent,),
                  leading: const Icon(Icons.construction),
                  title: const Text("Maintainance"),
                  subtitle: const Text(
                      "App Maintainance Page (Under Construction)"),
                  style: ListTileStyle.list,
                  // focusColor: Colors.black38,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const maintainancePage(),
                      ),
                    );
                  },
                  minVerticalPadding: 6,
                ),
              ),
               Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x00444444).withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 10,
                        spreadRadius: -7,
                      )
                    ]),
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  // trailing: Icon(Icons.construction,color: Colors.redAccent,),
                  leading: const Icon(Icons.wifi_off),
                  title: const Text("No Internet"),
                  subtitle: const Text(
                      "Internet Unavailable Page"),
                  style: ListTileStyle.list,
                  // focusColor: Colors.black38,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const noInternetPage(),
                      ),
                    );
                  },
                  minVerticalPadding: 6,
                ),
              ),
                            Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x00444444).withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 10,
                        spreadRadius: -7,
                      )
                    ]),
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  // trailing: Icon(Icons.construction,color: Colors.redAccent,),
                  leading: const Icon(Icons.construction),
                  title: const Text("Maintainance"),
                  subtitle: const Text(
                      "App Maintainance Page (Under Construction)"),
                  style: ListTileStyle.list,
                  // focusColor: Colors.black38,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const maintainancePage(),
                      ),
                    );
                  },
                  minVerticalPadding: 6,
                ),
              ),
               Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0x00444444).withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 10,
                        spreadRadius: -7,
                      )
                    ]),
                margin: const EdgeInsets.all(8),
                child: ListTile(
                  // trailing: Icon(Icons.construction,color: Colors.redAccent,),
                  leading: const Icon(Icons.notification_add),
                  title: const Text("Reminders"),
                  subtitle: const Text(
                      "User Personal Reminders Page"),
                  style: ListTileStyle.list,
                  // focusColor: Colors.black38,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const ReminderPage(),
                      ),
                    );
                  },
                  minVerticalPadding: 6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
