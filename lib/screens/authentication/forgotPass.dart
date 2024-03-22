import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindcare/const/colors.dart';

class ForgotpassPage extends StatefulWidget {
  ForgotpassPage({super.key});
  bool isEmail = false;

  @override
  State<ForgotpassPage> createState() => _ForgotpassPageState();
}

class _ForgotpassPageState extends State<ForgotpassPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  const Color.fromARGB(255, 0, 0, 0),
      // appBar: AppBar(title: Text("LOGIN", style: TextStyle(letterSpacing: 5),),centerTitle: true,),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height-35,
            // width: MediaQuery.of(context).size.width,
            decoration:  const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 1),
                colors: <Color>[
                  Color.fromARGB(255, 0, 0, 0),
                  Color.fromARGB(255, 0, 55, 67),
                  Color.fromARGB(255, 0, 91, 111),
                ], // Gradient from https://learnui.design/tools/gradient-generator.html
                tileMode: TileMode.mirror,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.all(60.r),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.ac_unit_sharp,
                              color: Colors.amber,
                              size: 100.h,
                            ),
                            SizedBox(
                              width: 30.w,
                            ),
                            Text(
                              "MindCare",
                              style: TextStyle(color: color1, fontSize: 80.sp),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                   Divider(
                    height: 10.h,
                    thickness: 1.r,
                    indent: 50.h,
                    endIndent: 50.h,
                    color: color1,
                  ),
                  Container(
                    margin:  EdgeInsets.all(30.r),
                    alignment: Alignment.topLeft,
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Forgot",
                          style:
                              TextStyle(color: Colors.amberAccent, fontSize: 130.sp),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "Password",
                          style: TextStyle(
                              color: lightTextColor1,
                              fontSize: 125.sp),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30.r),
                    child: Text(
                      "Don't worry, We got you! As long you still remember your email",
                      style: TextStyle(color: lightTextColor2),
                    ),
                  ),
                  Container(
                  margin:  EdgeInsets.only(top: 10.h, left: 50.w, right: 50.w),
                  // padding:  EdgeInsets.only(top: 7, left: 20, bottom: 4),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100.r),
                      color:  const Color.fromARGB(124, 134, 134, 134)),
                  child: TextFormField(
                    // controller: _loginEmailController,
                    cursorColor: color1,
                    style: TextStyle(color: color1),
                    decoration: InputDecoration(
                      prefixIcon:  const Icon(
                        Icons.person,
                      ),
                      prefixIconColor: color1,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.r),
                        borderSide:  const BorderSide(
                            color: Color.fromARGB(0, 255, 255, 255)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(100.r),
                        borderSide:  const BorderSide(
                            color: Color.fromARGB(0, 255, 255, 255)),
                      ),
                      // labelText: "Email",
                      hintText: "Email",
                      hintStyle: TextStyle(color: color1),
                      labelStyle:  TextStyle(color: color1),
                      // icon:  Icon(Icons.person),
                      // iconColor: color1,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(100.r)),
                    ),
                    validator: (value) {
                      // if (!value!.isEmail) {
                      //   return "Email address is required";
                      // }
                      return null;
                    },
                  ),
                  ),
                  
                  SizedBox(height: 950.h,),
                  Container(
                  margin:  EdgeInsets.only(top: 80.h, bottom: 50.h,left: 50.w, right: 50.h),
                  height: 150.h,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                    onPressed: () {
                      //  if (_loginFormKey.currentState!.validate()) {
                      //           ScaffoldMessenger.of(context).showSnackBar(
                      //              SnackBar(content: Text('Processing Data')),
                      //           );
                      //         }
                    },
                    child:  Text(
                      "Send Verification link",
                      style: TextStyle(color: Colors.black, fontSize: 50.sp,),
                    ),
                  ),
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
