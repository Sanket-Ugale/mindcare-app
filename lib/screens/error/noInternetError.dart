import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class noInternetPage extends StatelessWidget {
  const noInternetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(title: Text("APPOINTMENT's", style: TextStyle(letterSpacing: 5),),centerTitle: true,),
      body: Container(
        height: MediaQuery.of(context).size.height ,
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                image: const AssetImage("assets/images/noInternet_2.png"),
                height: 1300.h,
                width: 1300.w,
              ),
              const Text(
                "No Internet Connection",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
