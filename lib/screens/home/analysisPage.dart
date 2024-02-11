import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class analysisPage extends StatelessWidget {
  const analysisPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(90.r),
      child:  Center(
          child: Image.asset("assets/icons/empty3.png",fit: BoxFit.cover,height: 600.h,width: 600.w,) ,
          // Text(
          //   "Analysis Not available",
          //   style: TextStyle(color: Colors.amberAccent, fontSize: 80.sp,),
          //   textAlign: TextAlign.left,
          // ),
        ),
    );
  }
}
