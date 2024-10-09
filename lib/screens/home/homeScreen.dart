import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindcare/community/CommunityPage.dart';
import 'package:mindcare/const/colors.dart';
import 'package:mindcare/const/functions.dart';
import 'package:mindcare/screens/appointment/appointmentPage.dart';
import 'package:mindcare/screens/appointment/appointments.dart';
import 'package:mindcare/screens/chat/chatPage.dart';
import 'package:mindcare/screens/profile/profilePage.dart';
import 'package:mindcare/screens/quiz/quizPage.dart';
import 'package:mindcare/screens/reminders/reminderPage.dart';
import 'package:mindcare/screens/scenarioPage.dart';
import 'package:mindcare/screens/wearcare/wearCare.dart';
import 'package:page_transition/page_transition.dart';
import 'package:circular_seek_bar/circular_seek_bar.dart';

class homeScreenPage extends StatefulWidget {
  const homeScreenPage({super.key});

  @override
  State<homeScreenPage> createState() => _homeScreenPageState();
}

class _homeScreenPageState extends State<homeScreenPage> {
  final ValueNotifier<double> _valueNotifier = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    var progress = 0.0;
    setState(() {
      progress = 80.0;
    });
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        margin: EdgeInsets.all(30.r),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      getGreeting(),
                      style: TextStyle(
                          color: Colors.amberAccent, fontSize: 100.sp),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Sanket",
                      style: TextStyle(
                          color: color1,
                          fontSize: 85.sp,
                          fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    // Scaffold.of(context).openDrawer();
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 300),
                        type: PageTransitionType.leftToRight,
                        child: profilePage(),
                      ),
                    );
                  },
                  child: Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: color1),
                      color: color1,
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(221, 255, 255, 255)
                              .withOpacity(1),
                          offset: const Offset(0, 0),
                          blurRadius: 7,
                          spreadRadius: 1.5,
                          blurStyle: BlurStyle.outer,
                        )
                      ],
                    ),
                    child: const ClipOval(
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/icons/sanket.png"),
                        height: 45,
                        width: 45,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 100.h,
            ),
            Padding(
              padding: EdgeInsets.all(10.r),
              child: IgnorePointer(
                ignoring: true,
                child: CircularSeekBar(
                  width: double.infinity,
                  height: 230,
                  progress: progress,
                  barWidth: 20,
                  startAngle: 45,
                  sweepAngle: 270,
                  // strokeCap: StrokeCap.butt,
                  progressGradientColors: const [
                    Colors.red,
                    Colors.orange,
                    Colors.yellow,
                    Colors.green,
                    Colors.blue,
                    Colors.indigo,
                    Colors.purple
                  ],
                  // innerThumbRadius: 5,
                  // innerThumbStrokeWidth: 3,
                  // innerThumbColor: Colors.white,
                  // outerThumbRadius: 5,
                  // outerThumbStrokeWidth: 10,
                  // outerThumbColor: Colors.blueAccent,
                  // dashWidth: 5,
                  // dashGap: 0.5,
                  // animation: true,
                  // curves: Curves.bounceOut,
                  valueNotifier: _valueNotifier,
                  child: Center(
                    child: ValueListenableBuilder(
                        valueListenable: _valueNotifier,
                        builder: (_, double value, __) => Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('${value.round()} %',
                                    style: TextStyle(color: Colors.white)),
                                Text('progress',
                                    style: TextStyle(color: Colors.grey)),
                              ],
                            )),
                  ),
                ),
              ),
              // ElevatedButton(
              //     onPressed: () {},
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.white,
              //       disabledBackgroundColor: color1,
              //       minimumSize: Size(1000.w, 150.h),
              //     ),
              //     child: Text(
              //       "New Chat",
              //       style: TextStyle(color: color2),
              //     )),
            ),
            SizedBox(
              height: 80.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Explore more",
                  style: TextStyle(
                      color: color1,
                      fontSize: 80.sp,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.left,
                ),
                // Icon(
                //   Icons.arrow_circle_down_outlined,
                //   color: color1,
                //   size: 100.r,
                // ),
              ],
            ),
            SizedBox(
              height: 50.h,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 100),
                        type: PageTransitionType.fade,
                        child: quizPage(
                          start: false,
                        ),
                      ),
                    );
                    // setState(() {
                    //   progress=90.0;
                    // });
                  },
                  child: Container(
                    padding: EdgeInsets.all(30.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: const Color.fromARGB(143, 197, 197, 197),
                    ),
                    margin: EdgeInsets.all(5.r),
                    height: 500.h,
                    width: 500.h,
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Mind Quest",
                            style: TextStyle(
                                color: color1,
                                fontWeight: FontWeight.w500,
                                fontSize: 60.sp),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Mental Health Quiz Model",
                            style: TextStyle(
                              color: Colors.white60,
                              fontWeight: FontWeight.w100,
                              fontSize: 40.sp,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 250.h, left: 250.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.r),
                                bottomLeft: Radius.circular(100.r),
                                topRight: Radius.circular(100.r)),
                            color: const Color.fromARGB(143, 26, 71, 103),
                          ),
                          alignment: Alignment.bottomRight,
                          child: Image.asset(
                            "assets/images/icons8-test-passed-94.png",
                            height: 150.h,
                            width: 150.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 100),
                        type: PageTransitionType.fade,
                        child: chatPage(),
                      ),
                    );
                    // setState(() {
                    //   progress=90.0;
                    // });
                  },
                  child: Container(
                    padding: EdgeInsets.all(30.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: const Color.fromARGB(143, 197, 197, 197),
                    ),
                    margin: EdgeInsets.all(5.r),
                    height: 500.h,
                    width: 500.h,
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Talk Mood",
                            style: TextStyle(
                                color: color1,
                                fontWeight: FontWeight.w500,
                                fontSize: 60.sp),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Your Mental Wellness Buddy",
                            style: TextStyle(
                              color: Colors.white60,
                              fontWeight: FontWeight.w100,
                              fontSize: 40.sp,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 250.h, left: 250.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.r),
                                bottomLeft: Radius.circular(100.r),
                                topRight: Radius.circular(100.r)),
                            color: const Color.fromARGB(143, 26, 71, 103),
                          ),
                          alignment: Alignment.bottomRight,
                          child: Image.asset(
                            "assets/images/icons8-stories-64.png",
                            height: 150.h,
                            width: 150.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 400),
                        type: PageTransitionType.fade,
                        child: WearCare(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(30.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: const Color.fromARGB(143, 197, 197, 197),
                    ),
                    margin: EdgeInsets.all(5.r),
                    height: 500.h,
                    width: 500.h,
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Wear Care",
                            style: TextStyle(
                                color: color1,
                                fontWeight: FontWeight.w500,
                                fontSize: 60.sp),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Wearable Wellness Assessment",
                            style: TextStyle(
                              color: Colors.white60,
                              fontWeight: FontWeight.w100,
                              fontSize: 40.sp,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 250.h, left: 250.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.r),
                                bottomLeft: Radius.circular(100.r),
                                topRight: Radius.circular(100.r)),
                            color: const Color.fromARGB(143, 26, 71, 103),
                          ),
                          alignment: Alignment.bottomRight,
                          child: Image.asset(
                            "assets/images/icons8-running-man-64.png",
                            height: 150.h,
                            width: 150.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 100),
                        type: PageTransitionType.fade,
                        child: ScenarioQuizPage(),
                      ),
                    );
                    // setState(() {
                    //   progress=90.0;
                    // });
                  },
                  child: Container(
                    padding: EdgeInsets.all(30.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: const Color.fromARGB(143, 197, 197, 197),
                    ),
                    margin: EdgeInsets.all(5.r),
                    height: 500.h,
                    width: 500.h,
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Life Portraits",
                            style: TextStyle(
                                color: color1,
                                fontWeight: FontWeight.w500,
                                fontSize: 60.sp),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Personalized Perspectives.",
                            style: TextStyle(
                              color: Colors.white60,
                              fontWeight: FontWeight.w100,
                              fontSize: 40.sp,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 250.h, left: 250.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.r),
                                bottomLeft: Radius.circular(100.r),
                                topRight: Radius.circular(100.r)),
                            color: const Color.fromARGB(143, 26, 71, 103),
                          ),
                          alignment: Alignment.bottomRight,
                          child: Image.asset(
                            "assets/images/icons8-customer-behavior-64.png",
                            height: 150.h,
                            width: 150.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 100),
                        type: PageTransitionType.fade,
                        child: const ReminderPage(),
                      ),
                    );
                    // setState(() {
                    //   progress=90.0;
                    // });
                  },
                  child: Container(
                    padding: EdgeInsets.all(30.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: const Color.fromARGB(143, 197, 197, 197),
                    ),
                    margin: EdgeInsets.all(5.r),
                    height: 500.h,
                    width: 500.h,
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Remiders",
                            style: TextStyle(
                                color: color1,
                                fontWeight: FontWeight.w500,
                                fontSize: 60.sp),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Emotion Insight",
                            style: TextStyle(
                              color: Colors.white60,
                              fontWeight: FontWeight.w100,
                              fontSize: 40.sp,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 250.h, left: 250.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.r),
                                bottomLeft: Radius.circular(100.r),
                                topRight: Radius.circular(100.r)),
                            color: const Color.fromARGB(143, 26, 71, 103),
                          ),
                          alignment: Alignment.bottomRight,
                          child: Image.asset(
                            "assets/images/icons8-reminders-64.png",
                            height: 150.h,
                            width: 150.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 100),
                        type: PageTransitionType.fade,
                        child: const AppointmentMainPage(),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.all(30.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: const Color.fromARGB(143, 197, 197, 197),
                    ),
                    margin: EdgeInsets.all(5.r),
                    height: 500.h,
                    width: 500.h,
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Appointment",
                            style: TextStyle(
                                color: color1,
                                fontWeight: FontWeight.w500,
                                fontSize: 60.sp),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Schedule Meet with Specialist.",
                            style: TextStyle(
                              color: Colors.white60,
                              fontWeight: FontWeight.w100,
                              fontSize: 40.sp,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 250.h, left: 250.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.r),
                                bottomLeft: Radius.circular(100.r),
                                topRight: Radius.circular(100.r)),
                            color: const Color.fromARGB(143, 26, 71, 103),
                          ),
                          alignment: Alignment.bottomRight,
                          child: Image.asset(
                            "assets/images/icons8-video-call-64.png",
                            height: 150.h,
                            width: 150.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 100),
                        type: PageTransitionType.fade,
                        child: const CommunityPage(),
                      ),
                    );
                    // setState(() {
                    //   progress=90.0;
                    // });
                  },
                  child: Container(
                    padding: EdgeInsets.all(30.r),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.r),
                      color: const Color.fromARGB(143, 197, 197, 197),
                    ),
                    margin: EdgeInsets.all(5.r),
                    height: 500.h,
                    width: 500.h,
                    child: Stack(
                      children: [
                        Container(
                          alignment: Alignment.topCenter,
                          child: Text(
                            "Community",
                            style: TextStyle(
                                color: color1,
                                fontWeight: FontWeight.w500,
                                fontSize: 60.sp),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Mental Wellness Hub",
                            style: TextStyle(
                              color: Colors.white60,
                              fontWeight: FontWeight.w100,
                              fontSize: 40.sp,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 250.h, left: 250.w),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50.r),
                                bottomLeft: Radius.circular(100.r),
                                topRight: Radius.circular(100.r)),
                            color: const Color.fromARGB(143, 26, 71, 103),
                          ),
                          alignment: Alignment.bottomRight,
                          child: Image.asset(
                            "assets/images/icons8-community-50.png",
                            height: 150.h,
                            width: 150.w,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
