import 'package:flutter/material.dart';

class maintainancePage extends StatelessWidget {
  const maintainancePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(title: Text("APPOINTMENT's", style: TextStyle(letterSpacing: 5),),centerTitle: true,),
      body: Container(
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
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Under Maintainance",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Image(
                image: AssetImage('assets/images/appmaintainace.png'),
                height: 300,
                width: 300,
              ),
              Text(
                "We are currently under maintainance. Please check back later.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
