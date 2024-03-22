import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindcare/const/colors.dart';
import 'package:mindcare/screens/authentication/loginPage.dart';
import 'package:mindcare/screens/home/privacyPolicyPage.dart';

class SignupPage extends StatefulWidget {
  SignupPage({super.key});
  bool isEmail = false;

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
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
                        Text(
                          "Skip",
                          style: TextStyle(color: color1, fontSize: 40.sp),
                        )
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
                          "Welcome",
                          style:
                              TextStyle(color: Colors.amberAccent, fontSize: 130.sp),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          "aboard!",
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
                      "Don't worry, Mindcare take the security of your information seriously and keep it safe.",
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
                  Container(
                    margin:  EdgeInsets.only(top: 30.h, left: 50.w, right: 50.w),
                    // padding:  EdgeInsets.only(top: 7, left: 20, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        color:  const Color.fromARGB(124, 134, 134, 134)),
                    child: TextFormField(
                      // controller: _loginEmailController,
                      cursorColor: color1,
                      style: TextStyle(color: color1),
                      decoration: InputDecoration(
                        prefixIcon:  const Icon(Icons.lock),
                        prefixIconColor: color1,
                        suffixIcon:  const Icon(
                          Icons.remove_red_eye_rounded,
                        ),
                        suffixIconColor: color1,
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
                        // labelText: "Password",
                        // labelStyle:  TextStyle(color: color1),
                        hintText: "Password",
                        hintStyle: TextStyle(color: color1),
                        // icon:  Icon(Icons.lock),
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
                  Container(
                    margin:  EdgeInsets.only(top: 30.h, left: 50.w, right: 50.w),
                    // padding:  EdgeInsets.only(top: 7, left: 20, bottom: 4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.r),
                        color:  const Color.fromARGB(124, 134, 134, 134)),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      // controller: _loginEmailController,
                      cursorColor: color1,
                      style:  TextStyle(color: color1),
                      decoration: InputDecoration(
                        prefixIcon:  const Icon(
                          Icons.phone,
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
                        hintText: "Phone Number",
                        hintStyle: TextStyle(color: color1),
                        // icon:  Icon(Icons.phone),
                        iconColor: color1,
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
                  
                  Padding(
                    padding:  EdgeInsets.all(30.r),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => privacyPolicyPage(),
                      ),
                    );
                      },
                      child:  Text.rich(
                        TextSpan(
                          text: "By signing up, you are agree to our ",
                          style: TextStyle(color: lightTextColor2),
                          children: const <TextSpan>[
                            TextSpan(
                              text: "Terms & Conditions ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, ),
                            ),
                            TextSpan(
                              text: "and ",
                            ),
                            TextSpan(
                              text: "Privacy Policy ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin:  EdgeInsets.only(top: 10.h, bottom: 10.h),
                    child: ElevatedButton(
                      onPressed: () {
                        //  if (_loginFormKey.currentState!.validate()) {
                        //           ScaffoldMessenger.of(context).showSnackBar(
                        //              SnackBar(content: Text('Processing Data')),
                        //           );
                        //         }
                      },
                      child:  Padding(
                        padding: EdgeInsets.only(
                            top: 30.h, bottom: 30.h, left: 60.w, right: 60.w),
                        child: Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.black, fontSize: 50.sp),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Divider(
                          indent: 30.w,
                          color: color1,
                          thickness: 2.r,
                          endIndent: 40.w,
                        ),
                      ),
                      Text(
                        'Sign up using',
                        style: TextStyle(color: color1),
                      ),
                      Expanded(
                        child: Divider(
                          color: color1,
                          thickness: 2.r,
                          indent: 40.w,
                          endIndent: 30.w,
                        ),
                      ),
                    ],
                  ),
                   SizedBox(
                    height: 40.h,
                  ),
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: color1,
                        child: Container(
                            padding:  EdgeInsets.all(10.r),
                            child: Image.asset("assets/icons/google.png")),
                      ),
                       SizedBox(
                        width: 60.w,
                      ),
                      CircleAvatar(
                        backgroundColor: color1,
                        child: Container(
                            padding:  EdgeInsets.all(10.r),
                            child: Image.asset("assets/icons/microsoft.png")),
                      ),
                       SizedBox(
                        width: 60.w,
                      ),
                      CircleAvatar(
                        backgroundColor: color1,
                        child: Container(
                            padding:  EdgeInsets.all(10.r),
                            child: Image.asset(
                              "assets/icons/facebook.png",
                            ),),
                      ),
                    ],
                  ),
                  Container(
                    margin:  EdgeInsets.all(50.r),
                    child: InkWell(onTap: () {
                      
                    },
                                
                    child:  InkWell(
                      onTap: () {
                        
                        Navigator.pushReplacement(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => loginPage(),
                      ),
                    );
                      },
                      child: Text.rich(TextSpan(text:"Already have an account? ",
                      style: TextStyle(color: color1),
                            children: <TextSpan>[
                              TextSpan(
                                text: "Sign In",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, color: color1),
                              ),]),
                      ),
                    )),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
