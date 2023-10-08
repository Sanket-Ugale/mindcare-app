import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindcare/const/colors.dart';
import 'package:mindcare/screens/screenList.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 91, 111),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color.fromARGB(255, 0, 0, 0),
                Color.fromARGB(255, 0, 55, 67),
                Color.fromARGB(255, 0, 91, 111),
              ], // Gradient from https://learnui.design/tools/gradient-generator.html
              tileMode: TileMode.mirror,
            ),
          ),
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(40.r),
          decoration: BoxDecoration(
              color: Colors.black87,
              borderRadius: BorderRadius.circular(100.r),
              boxShadow: [
                BoxShadow(
                  color:
                      Color.fromARGB(221, 0, 0, 0).withOpacity(1),
                  offset: const Offset(1, 0),
                  blurRadius: 5,
                  spreadRadius: 1.5,
                  blurStyle: BlurStyle.outer
                )
              ],
              ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            unselectedItemColor: Colors.white60,
            enableFeedback: false,
            selectedItemColor: color1,
            currentIndex: _currentIndex,
            onTap: (int index) {
              setState(() {
                _currentIndex = index; // Change the current page index
              });
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Container(height: MediaQuery.of(context).size.height, color: const Color.fromARGB(255, 244, 244, 244) ,margin: EdgeInsets.only(bottom: 10.h,left: 50.w, right: 50.h,), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Column(children: [Icon(Icons.home),Text("Home")],),Column(children: [Icon(Icons.message),Text("Chat")],),Column(children: [Icon(Icons.notifications),Text("Notification")],),Column(children: [Icon(Icons.person),Text("Profile")],),],),),
    );
  }
}
