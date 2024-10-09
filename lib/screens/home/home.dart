import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindcare/const/colors.dart';
import 'package:mindcare/screens/home/analysisPage.dart';
import 'package:mindcare/screens/home/homeScreen.dart';
import 'package:mindcare/screens/home/tasksScreen.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  // int _currentIndex = 0;

  int _selectedItem = 0;
  var pageList = [homeScreenPage(), TasksPage(), AnalysisPage()];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // appBar: AppBar(backgroundColor: Colors.black,),
        // drawer: DrawerWidget(),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        // floatingActionButton: Builder(
        //   builder: (BuildContext context) {
        //     return FloatingActionButton(
        //       splashColor: color1,
        //       backgroundColor: Colors.transparent,
        //       foregroundColor: color1,
        //       onPressed: () {
        //         Scaffold.of(context).openDrawer(); // Open the drawer
        //       },
        //       child: const Icon(Icons.menu_outlined), // Drawer icon
        //     );
        //   },
        // ),
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
          child: pageList[_selectedItem],
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.all(40.r),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(100.r),
            boxShadow: [
              BoxShadow(
                  color: const Color.fromARGB(221, 0, 0, 0).withOpacity(1),
                  offset: const Offset(1, 0),
                  blurRadius: 5,
                  spreadRadius: 1.5,
                  blurStyle: BlurStyle.outer)
            ],
          ),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            unselectedItemColor: Colors.white60,
            enableFeedback: false,
            selectedItemColor: color1,
            currentIndex: _selectedItem,
            onTap: (value) => setState(
              () {
                setState(() {
                  _selectedItem = value;
                });
              },
            ),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.task_outlined),
                label: "Task's",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.analytics_outlined),
                label: 'Analysis',
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Container(height: MediaQuery.of(context).size.height, color: const Color.fromARGB(255, 244, 244, 244) ,margin: EdgeInsets.only(bottom: 10.h,left: 50.w, right: 50.h,), child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Column(children: [Icon(Icons.home),Text("Home")],),Column(children: [Icon(Icons.message),Text("Chat")],),Column(children: [Icon(Icons.notifications),Text("Notification")],),Column(children: [Icon(Icons.person),Text("Profile")],),],),),
    );
  }
}
