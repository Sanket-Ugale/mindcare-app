import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mindcare/const/colors.dart';
import 'package:mindcare/screens/appointment/appointmentBookedPage.dart';
import 'package:mindcare/screens/appointment/appointmentPage.dart';

class AppointmentMainPage extends StatefulWidget {
  const AppointmentMainPage({Key? key}) : super(key: key);

  @override
  State<AppointmentMainPage> createState() => _AppointmentMainPageState();
}

class _AppointmentMainPageState extends State<AppointmentMainPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final List<Widget> tabPages = [const AppointmentPage(), const AppointmentBookedPage()];
  final List<String> tabNames = ["Schedule", "Booked"];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabNames.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
      ),
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
                Row(
                  children: [
                    IconButton(
                      icon: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white54,
                        child: Icon(
                          Icons.arrow_back,
                          color: color1,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 60),
                    Text(
                      "Appointments",
                      style: TextStyle(
                        color: color1,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                TabBar(
                  indicatorColor: color1,
                  labelColor: color1,
                  dividerColor: Colors.transparent,
                  unselectedLabelColor: Colors.white70,
                  controller: tabController,
                  tabs: tabNames.map((name) => Tab(text: name)).toList(),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: tabPages,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}