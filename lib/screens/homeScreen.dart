import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindcare/const/colors.dart';
import 'package:mindcare/const/functions.dart';

class homeScreenPage extends StatefulWidget {
  const homeScreenPage({super.key});

  @override
  State<homeScreenPage> createState() => _homeScreenPageState();
}

class _homeScreenPageState extends State<homeScreenPage> {
  @override
  Widget build(BuildContext context) {
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
              Text(
                getGreeting(),
                style: TextStyle(color: Colors.amberAccent, fontSize: 100.sp),
                textAlign: TextAlign.left,
              ),
              Text(
                "Sanket",
                style: TextStyle(
                    color: color1, fontSize: 85.sp, fontWeight: FontWeight.w500),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                height: 100.h,
              ),
              Padding(
                padding: EdgeInsets.all(10.r),
                child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      disabledBackgroundColor: color1,
                      minimumSize: Size(1000.w, 150.h),
                    ),
                    child: Text(
                      "New Chat",
                      style: TextStyle(color: color2),
                    )),
              ),
              SizedBox(
                height: 70.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Explore more",
                    style: TextStyle(
                        color: color1,
                        fontSize: 70.sp,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                  Icon(
                    Icons.arrow_circle_right,
                    color: color1,
                    size: 100.r,
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(30.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: Color.fromARGB(143, 197, 197, 197),
                      ),
                      margin: EdgeInsets.all(30.r),
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
                              color: Color.fromARGB(143, 26, 71, 103),
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
                    Container(
                      padding: EdgeInsets.all(30.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: Color.fromARGB(143, 197, 197, 197),
                      ),
                      margin: EdgeInsets.all(30.r),
                      height: 500.h,
                      width: 500.h,
                      child: Stack(
                        children: [
                          Container(
                            alignment: Alignment.topCenter,
                            child: Text(
                              "FaceSoul",
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
                              color: Color.fromARGB(143, 26, 71, 103),
                            ),
                            alignment: Alignment.bottomRight,
                            child: Image.asset(
                              "assets/images/icons8-face-recognition-64.png",
                              height: 150.h,
                              width: 150.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(30.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: Color.fromARGB(143, 197, 197, 197),
                      ),
                      margin: EdgeInsets.all(30.r),
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
                              color: Color.fromARGB(143, 26, 71, 103),
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
                    Container(
                      padding: EdgeInsets.all(30.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: Color.fromARGB(143, 197, 197, 197),
                      ),
                      margin: EdgeInsets.all(30.r),
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
                              color: Color.fromARGB(143, 26, 71, 103),
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
                    Container(
                      padding: EdgeInsets.all(30.r),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: Color.fromARGB(143, 197, 197, 197),
                      ),
                      margin: EdgeInsets.all(30.r),
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
                              color: Color.fromARGB(143, 26, 71, 103),
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
                  ],
                ),
              )
            ],
          )),
    );
  }
}
