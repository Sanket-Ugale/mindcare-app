import 'package:flutter/material.dart';
import 'package:mindcare/const/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindcare/screens/home/settings.dart';
import 'package:page_transition/page_transition.dart';

// ignore: must_be_immutable
class DataTextField extends StatefulWidget {
  final Icon icon;
  final String hintText;
  final String labelText;
  final String value;
  TextInputType keyboardType;

  DataTextField(
      this.icon, this.hintText, this.labelText, this.value, this.keyboardType);

  @override
  State<DataTextField> createState() => _DataTextFieldState();
}

class _DataTextFieldState extends State<DataTextField> {
  TextEditingController _TextFormFieldController = TextEditingController();

  // get keyboardType => widget.keyboardType;

  // String get value => value;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      _TextFormFieldController.text = widget.value;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40.h, left: 50.w, right: 50.w),
      // padding:  EdgeInsets.only(top: 7, left: 20, bottom: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: Color.fromARGB(0, 134, 134, 134)),
      child: TextFormField(
        maxLength: 10,
        keyboardType: widget.keyboardType,
        controller: _TextFormFieldController,
        cursorColor: color2,
        style: TextStyle(color: color2),
        decoration: InputDecoration(
          prefixIcon: widget.icon,
          prefixIconColor: color2,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.r),
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.r),
            borderSide: const BorderSide(color: Colors.black),
          ),
          labelText: widget.labelText,
          hintText: widget.hintText,
          // label : Text(labelText),
          hintStyle: TextStyle(color: color2),
          labelStyle: TextStyle(color: color2),
          // icon:  Icon(Icons.person),
          iconColor: color2,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(100.r)),
        ),
        validator: (value) {
          // if (!value!.isEmail) {
          //   return "Email address is required";
          // }
          return null;
        },
      ),
    );
  }
}

class profilePage extends StatefulWidget {
  profilePage({super.key});

  @override
  State<profilePage> createState() => _profilePageState();
}

class _profilePageState extends State<profilePage> {
  List<String> bloodGroups = [
    'A +ve',
    'A -ve',
    'B +ve',
    'B -ve',
    'AB +ve',
    'AB -ve',
    'O +ve',
    'O -ve'
  ];

  var selectedBloodGroup = 'A +ve';
  DateTime selectedBirthDate=DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      // appBar: AppBar(
      // leading: IconButton(
      //   icon: CircleAvatar(
      //     radius: 40,
      //     backgroundColor: color1,
      //     child: Icon(
      //       Icons.arrow_back,
      //       color: color2,
      //     ),
      //   ),
      //   onPressed: () {
      //     Navigator.pop(context); // This pops the current route off the stack
      //   },
      // ),
      // backgroundColor: color2,
      // title: Text("PROFILE", style: TextStyle(letterSpacing: 5),),centerTitle: true,
      // ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height - 35,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment(0.8, 1),
                colors: <Color>[
                  Color.fromARGB(255, 0, 0, 0),
                  Color.fromARGB(255, 0, 55, 67),
                  Color.fromARGB(255, 0, 91, 111),
                ],
                tileMode: TileMode.mirror,
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white54,
                          child: Icon(
                            Icons.arrow_back,
                            color: color2,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(
                              context); // This pops the current route off the stack
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 380.w),
                        // child: Text(
                        //   "Profile",
                        //   style: TextStyle(
                        //     color: Colors.white60,
                        //     fontSize: 30,
                        //   ),
                        //   textAlign: TextAlign.center,
                        // ),
                      ),
                      IconButton(
                        icon: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white54,
                          child: Icon(
                            Icons.settings,
                            color: color2,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            PageTransition(
                              duration: const Duration(milliseconds: 200),
                              type: PageTransitionType.rightToLeft,
                              child: const settingPage(),
                            ),
                          ); // This pops the current route off the stack
                        },
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white54,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(80),
                                boxShadow: [
                                  BoxShadow(
                                      color: const Color.fromARGB(221, 0, 0, 0)
                                          .withOpacity(.5),
                                      offset: const Offset(0, 0),
                                      blurRadius: 5,
                                      spreadRadius: 1.5,
                                      blurStyle: BlurStyle.outer)
                                ],
                                color: const Color.fromARGB(255, 0, 91, 112),
                              ),
                              child: const ClipOval(
                                child: Image(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage("assets/icons/userImage.png"),
                                  height: 70,
                                  width: 70,
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                const Text(
                                  "Sanket Ugale",
                                  style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  "sanket.ugale@vpt.edu.in",
                                  style: TextStyle(
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        // DataTextField(Icon(Icons.person), "Email", "Email",
                        //     "sanket.ugale@vpt.edu.in",TextInputType.text),
                        Container(
                          margin: EdgeInsets.only(
                              top: 40.h, left: 50.w, right: 50.w),
                          // padding:  EdgeInsets.only(top: 7, left: 20, bottom: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              color: Color.fromARGB(0, 134, 134, 134)),
                          child: DropdownButtonFormField<String>(
        value: selectedBloodGroup,
        onChanged: (String? newValue) {
          setState(() {
            selectedBloodGroup = newValue!;
          });
        },
        items: bloodGroups.map((String bloodGroup) {
          return DropdownMenuItem<String>(
            value: bloodGroup,
            child: Text(bloodGroup),
          );
        }).toList(),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.bloodtype),
          prefixIconColor: color2,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.r),
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.r),
            borderSide: const BorderSide(color: Colors.black),
          ),
          labelText: "Blood Group",
          hintText: "Blood Group",
          // label : Text(labelText),
          hintStyle: TextStyle(color: color2),
          labelStyle: TextStyle(color: color2),
          // icon:  Icon(Icons.person),
          iconColor: color2,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(100.r)),
        ),
        // InputDecoration(
        //   labelText: 'Select Blood Group',
        //   // border: OutlineInputBorder(),
        //   contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        // ),
      ),
    
                        ),
                        Container(
      margin: EdgeInsets.only(top: 40.h, left: 50.w, right: 50.w),
      // padding:  EdgeInsets.only(top: 7, left: 20, bottom: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: Color.fromARGB(0, 134, 134, 134)),
      child: TextFormField(
        // maxLength: 2,
        keyboardType:TextInputType.number,
        // controller: _ageController,
        cursorColor: color2,
        style: TextStyle(color: color2),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.numbers_outlined),
          prefixIconColor: color2,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.r),
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.r),
            borderSide: const BorderSide(color: Colors.black),
          ),
          labelText: "Age",
          hintText: "Age",
          // label : Text(labelText),
          hintStyle: TextStyle(color: color2),
          labelStyle: TextStyle(color: color2),
          // icon:  Icon(Icons.person),
          iconColor: color2,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(100.r)),
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
      margin: EdgeInsets.only(top: 40.h, left: 50.w, right: 50.w),
      // padding:  EdgeInsets.only(top: 7, left: 20, bottom: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: Color.fromARGB(0, 134, 134, 134)),
      child: TextFormField(
        // maxLength: 10,
        keyboardType:TextInputType.number,
        // controller: _heightController,
        cursorColor: color2,
        style: TextStyle(color: color2),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.height),
          prefixIconColor: color2,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.r),
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.r),
            borderSide: const BorderSide(color: Colors.black),
          ),
          labelText: "Height",
          hintText: "Height",
          // label : Text(labelText),
          hintStyle: TextStyle(color: color2),
          labelStyle: TextStyle(color: color2),
          // icon:  Icon(Icons.person),
          iconColor: color2,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(100.r)),
        ),
        validator: (value) {
          // if (value!.length>3) {
          //   return "Age length should be of two numeric values";
          // }
          return null;
        },
      ),
    ),
                       Container(
      margin: EdgeInsets.only(top: 40.h, left: 50.w, right: 50.w),
      // padding:  EdgeInsets.only(top: 7, left: 20, bottom: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.r),
          color: Color.fromARGB(0, 134, 134, 134)),
      child: TextFormField(
        // maxLength: 10,
        keyboardType:TextInputType.number,
        // controller: _weightController,
        cursorColor: color2,
        style: TextStyle(color: color2),
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.monitor_weight),
          prefixIconColor: color2,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.r),
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(100.r),
            borderSide: const BorderSide(color: Colors.black),
          ),
          labelText: "Weight",
          hintText: "Weight",
          // label : Text(labelText),
          hintStyle: TextStyle(color: color2),
          labelStyle: TextStyle(color: color2),
          // icon:  Icon(Icons.person),
          iconColor: color2,
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(100.r)),
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
                          margin: EdgeInsets.only(top: 40.h, left: 50.w, right: 50.w),
                          // padding:  EdgeInsets.only(top: 7, left: 20, bottom: 4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100.r),
                              color: Color.fromARGB(0, 134, 134, 134)),
                          child: ElevatedButton( onPressed: selectBirthDate, child: Text("${selectedBirthDate.day.toString()}/${selectedBirthDate.month.toString()}/${selectedBirthDate.year.toString()}")),
                        ),  
    // DatePickerDialog(initialDate:DateTime.now(), firstDate:DateTime(1900), lastDate:DateTime(2015)),
                        DataTextField(
                            Icon(Icons.date_range_outlined),
                            "Birth Date",
                            "Birth Date",
                            "06-Aug-2003",
                            TextInputType.datetime),
                        DataTextField(Icon(Icons.line_axis), "Gender", "Gender",
                            "Male", TextInputType.text),
                        DataTextField(Icon(Icons.line_axis), "Phone no",
                            "Phone no", "9876543210", TextInputType.phone),
                        // DataTextField(
                        //     Icon(Icons.line_axis),
                        //     "Mental Health Score",
                        //     "Mental Health Score",
                        //     "Normal",TextInputType.text),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            margin: EdgeInsets.only(
                                top: 60.h,
                                bottom: 60.h,
                                left: 100.w,
                                right: 100.w),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color.fromARGB(172, 0, 91, 112),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Save",
                                  style:
                                      TextStyle(color: color2, fontSize: 50.sp),
                                  textAlign: TextAlign.center,
                                ),
                                // SizedBox(width: 30.w,),
                                // Icon(
                                //   Icons.edit,
                                //   color: color2,
                                // )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
    
  }
  void selectBirthDate() {
  showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1900), lastDate: DateTime(2128)).then((value) {setState(() {
            selectedBirthDate=value!;
          });});
}
}


