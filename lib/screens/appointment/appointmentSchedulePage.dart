import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mindcare/const/colors.dart';
import 'package:mindcare/screens/appointment/appointmentBookedPage.dart';
import 'package:mindcare/screens/appointment/appointmentPage.dart';
import 'package:mindcare/screens/appointment/appointments.dart';

class AppointmentSchedulePage extends StatefulWidget {
  const AppointmentSchedulePage({super.key});

  @override
  State<AppointmentSchedulePage> createState() =>
      AappointmentSchedulePageState();
}

class AappointmentSchedulePageState extends State<AppointmentSchedulePage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
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
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: CircleAvatar(
                        radius: 25,
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
                    const Text(
                      'Appointment Schedule',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
                const Image(
                  image: AssetImage('assets/icons/userImage.png'),
                  height: 200,
                  width: 200,
                ),
                Builder(
                  builder: (BuildContext context) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          padding: const EdgeInsets.all(15),
                          height: MediaQuery.of(context).size.height - 302.7,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment(5, 1),
                              colors: <Color>[
                                Color.fromARGB(255, 0, 0, 0),
                                Color.fromARGB(255, 0, 55, 67),
                                Color.fromARGB(255, 0, 91, 111),
                              ],
                              tileMode: TileMode.mirror,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 2,
                                spreadRadius: 1,
                                offset: Offset(0, 0),
                              ),
                            ],
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Column(
                                      children: [
                                        Text(
                                          'Dr. John Doe',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          'Psychiatrist',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        )
                                      ],
                                    ),
                                    IconButton(
                                      icon: Icon(
                                        Icons.call,
                                        color: color1,
                                      ),
                                      onPressed: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //       builder: (context) =>
                                        //           const AppointmentCallPage(),
                                        //     ));
                                      },
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Text(
                                  "About",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Dr. John Doe is a psychiatrist with 10 years of experience in the field. He has a degree in psychiatry from the University of California and has worked with patients of all ages. He specializes in treating anxiety, depression, and other mental health disorders.",
                                  style: TextStyle(color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Availability",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                const Text(
                                  "Monday - Friday: 9:00 AM - 5:00 PM",
                                  style: TextStyle(color: Colors.white),
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                TextFormField(
                                  readOnly: true,
                                  cursorColor: Colors.white,
                                  style: const TextStyle(color: Colors.white),
                                  decoration: InputDecoration(
                                    hintText: "Select Date and Time",
                                    hintStyle:
                                        const TextStyle(color: Colors.white),
                                    prefixIcon: const Icon(
                                      Icons.calendar_today_outlined,
                                      color: Colors.white,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.white)),
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.white)),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                        borderSide: const BorderSide(
                                            color: Colors.white)),
                                  ),
                                  onTap: () async {
                                    final date = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(2025),
                                      builder: (BuildContext context,
                                          Widget? child) {
                                        return Theme(
                                          data: ThemeData.dark(),
                                          child: child!,
                                        );
                                      },
                                    );

                                    if (date != null) {
                                      // ignore: use_build_context_synchronously
                                      final time = await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                        builder: (BuildContext context,
                                            Widget? child) {
                                          return Theme(
                                            data: ThemeData.dark(),
                                            child: child!,
                                          );
                                        },
                                      );

                                      if (time != null) {
                                        final dateTime = DateTime(
                                            date.year,
                                            date.month,
                                            date.day,
                                            time.hour,
                                            time.minute);
                                        this.controller.text =
                                            DateFormat('yyyy-MM-dd – kk:mm')
                                                .format(dateTime);
                                      }
                                    }
                                  },
                                  controller: this.controller,
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        behavior: SnackBarBehavior.floating,

                                        duration: Duration(seconds: 2),
                                        // showCloseIcon: true,
                                        // closeIconColor: Colors.red,
                                        content: Row(
                                          children: [
                                            Icon(
                                              Icons.check_circle,
                                              color: Colors.green,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "Appointment Booked",
                                              style: TextStyle(
                                                  color: Colors.green),
                                            ),
                                          ],),
                                        backgroundColor: Colors.black87,
                                      ),
                                    );
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AppointmentMainPage()));
                                  },
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        lightTextColor0),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(30))),
                                    padding: MaterialStateProperty.all(
                                        const EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 15)),
                                    minimumSize:
                                        MaterialStateProperty.all<Size?>(
                                      Size(
                                          MediaQuery.of(context).size.width -
                                              10,
                                          50),
                                    ),
                                  ),
                                  child: const Text(
                                    "Book Appointment",
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
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
