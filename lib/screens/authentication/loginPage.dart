import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindcare/const/api_Urls.dart';
import 'package:mindcare/const/colors.dart';
import 'forgotPass.dart';
import 'signUpPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
Future<String> signIn(String email, String password) async {
  //  var url = Uri.parse('https://mindcare-app.onrender.com/auth/user/signIn/');
  
  // var request = http.MultipartRequest('POST', url);

  // // Add form fields
  // request.fields['email'] = email;
  // request.fields['password'] = password;
  // print(request.fields);
  // try {
  //   var response = await request.send();
    
  //   if (response.statusCode == 404) {
  //     // Successful response
  //     return await response.stream.bytesToString();
  //   } else {
  //     // Handle error
  //     print('Error: ${response.statusCode}');
  //     return 'Error: ${response.statusCode}';
  //   }
  // } catch (error) {
  //   // Handle error
  //   print('Error: $error');
  //   return 'Error: $error';
  // }
    print(email.toString());
    print(password.toString());
    print("+++++++++++++++++++++++++++++++++++");
  final response = await http.post(
    Uri.parse(login_api),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'email': email,
      'password': password,
    }),
  );

  if (response.statusCode == 302) {
    Map<String, dynamic> data = jsonDecode(response.body);
    String user = data['user'];
    String message = data['message'];
    String refresh = data['refresh'];
    String access = data['access'];

    // Now you can use these variables
    print('User: $user');
    print('Message: $message');
    print('Refresh: $refresh');
    print('Access: $access');
    return '$message';
  } else {
     Map<String, dynamic> data = jsonDecode(response.body);
    String message = data['message'];
    print(response.body);
    return '$message';
    // throw Exception('Failed to sign in.');
  }
}

class loginPage extends StatefulWidget {
  loginPage({super.key});
  bool isEmail = false;

  // bool isRememberClicked=false;

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  
  TextEditingController _loginEmailController = TextEditingController();
  TextEditingController _loginPasswordController = TextEditingController();
    final _formKey = GlobalKey<FormState>();
  bool isRememberClicked=true;

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    return null;
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      // appBar: AppBar(title: Text("LOGIN", style: TextStyle(letterSpacing: 5),),centerTitle: true,),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Form(
            key: _formKey,
            child: Container(
              height: MediaQuery.of(context).size.height - 35,
              // width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
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
                      margin: EdgeInsets.all(30.r),
                      alignment: Alignment.topLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Welcome",
                            style: TextStyle(
                                color: Colors.amberAccent, fontSize: 130.sp),
                            textAlign: TextAlign.left,
                          ),
                          Text(
                            "aboard!",
                            style: TextStyle(
                                color: lightTextColor1, fontSize: 125.sp),
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
                      margin: EdgeInsets.only(top: 10.h, left: 50.w, right: 50.w),
                      // padding:  EdgeInsets.only(top: 7, left: 20, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          color: const Color.fromARGB(124, 134, 134, 134)),
                      child: TextFormField(
                        controller: _loginEmailController,
                        validator: validateEmail,
                        cursorColor: color1,
                        style: TextStyle(color: color1),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.person,
                          ),
                          prefixIconColor: color1,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.r),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(0, 255, 255, 255)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.r),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(0, 255, 255, 255)),
                          ),
                          // labelText: "Email",
                          hintText: "Email",
                          hintStyle: TextStyle(color: color1),
                          labelStyle: TextStyle(color: color1),
                          // icon:  Icon(Icons.person),
                          // iconColor: color1,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(100.r)),
                        ),
                        // validator: (value) {
                          // if (!value!.isEmail) {
                          //   return "Email address is required";
                          // }
                          // return null;
                        // },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 30.h, left: 50.w, right: 50.w),
                      // padding:  EdgeInsets.only(top: 7, left: 20, bottom: 4),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100.r),
                          color: const Color.fromARGB(124, 134, 134, 134)
                          ),
                      child: TextFormField(
                        validator: validatePassword,
                        controller: _loginPasswordController,
                        cursorColor: color1,
                        style: TextStyle(color: color1),
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          prefixIconColor: color1,
                          suffixIcon: const Icon(
                            Icons.remove_red_eye_rounded,
                          ),
                          suffixIconColor: color1,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.r),
                            borderSide: const BorderSide(
                                color: Color.fromARGB(0, 255, 255, 255)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100.r),
                            borderSide: const BorderSide(
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
                        // validator: (value) {
                          // if (!value!.isEmail) {
                          //   return "Email address is required";
                          // }
                          // return null;
                        // },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                                    isRememberClicked=!isRememberClicked;
                                  });
                          },
                          child: Row(
                            children: [
                              Checkbox(
                                overlayColor:const MaterialStatePropertyAll(Colors.amber),
                                checkColor: Colors.white,
                                activeColor: Colors.green.shade300,
                                value: isRememberClicked,
                                splashRadius: 1,
                                onChanged: (value) {
                                  setState(() {
                                    isRememberClicked=!isRememberClicked;
                                  });
                                },
                                semanticLabel: "Remember Me",
                              ),
                              Text(
                                "Remember Me",
                                style: TextStyle(color: color1),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute<void>(
                                  builder: (BuildContext context) =>
                                      ForgotpassPage(),
                                ),
                              );
                            },
                            child: const Text(
                              "Forgot Password ?",
                              style: TextStyle(color: Colors.amber),
                            )),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 80.h, bottom: 10.h),
                      child: ElevatedButton(
  onPressed: () async {
    if (_formKey.currentState!.validate()) {
      String email = _loginEmailController.text;
      String password = _loginPasswordController.text;
      try {
        String response = await signIn(email, password);
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Response'),
              content: Text(response),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } catch (e) {
        print(e);
      }
    }
  },
  child: Padding(
    padding: EdgeInsets.only(
        top: 30.h, bottom: 30.h, left: 60.w, right: 60.w),
    child: Text(
      "Sign In",
      style:
          TextStyle(color: Colors.black, fontSize: 50.sp),
    ),
  ),
),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
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
                          'Sign In using',
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
                              padding: EdgeInsets.all(10.r),
                              child: Image.asset("assets/icons/google.png")),
                        ),
                        SizedBox(
                          width: 60.w,
                        ),
                        CircleAvatar(
                          backgroundColor: color1,
                          child: Container(
                              padding: EdgeInsets.all(10.r),
                              child: Image.asset("assets/icons/microsoft.png")),
                        ),
                        SizedBox(
                          width: 60.w,
                        ),
                        CircleAvatar(
                          backgroundColor: color1,
                          child: Container(
                            padding: EdgeInsets.all(10.r),
                            child: Image.asset(
                              "assets/icons/facebook.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(50.r),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => SignupPage(),
                            ),
                          );
                        },
                        child: Text.rich(
                          TextSpan(
                              text: "Don't have an account?, ",
                              style: TextStyle(color: color1),
                              children: <TextSpan>[
                                TextSpan(
                                  text: "Sign Up",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: color1),
                                ),
                              ]),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
