import 'package:flutter/material.dart';
import 'package:mindcare/const/colors.dart';

class settingPage extends StatelessWidget {
  const settingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // appBar: AppBar(title: Text("SETTING", style: TextStyle(letterSpacing: 5),),centerTitle: true,),
      body: SingleChildScrollView(
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}