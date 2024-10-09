import 'package:flutter/material.dart';
import 'package:mindcare/const/colors.dart';
import 'package:mindcare/screens/appointment/appointmentCallPage.dart';

class AppointmentBookedPage extends StatefulWidget {
  const AppointmentBookedPage({super.key});

  @override
  State<AppointmentBookedPage> createState() => _AppointmentBookedPageState();
}

class _AppointmentBookedPageState extends State<AppointmentBookedPage> {
  bool isNoAppointment = false;
  List appointments = [
    {
      "date": "12/12/2021",
      "time": "12:00 PM",
      "doctor": "Dr. Kavita Sharma",
      "mode": "Online",
      "status": "Confirmed"
    },
    {
      "date": "12/12/2021",
      "time": "12:00 PM",
      "doctor": "Dr. Ramesh Kumar",
      "mode": "Online",
      "status": "Pending"
    },
    {
      "date": "12/12/2021",
      "time": "12:00 PM",
      "doctor": "Dr. John Doe",
      "mode": "Online",
      "status": "Rejected"
    },
  ];

  void initState() {
    super.initState();
    setState(() {
      appointments.isEmpty ? isNoAppointment = true : isNoAppointment = false;
    });
    // getAppointments();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: isNoAppointment
          ? Text(
              "You have no Appointments Scheduled",
              style: TextStyle(color: color1),
            )
          : ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(color: color1),
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(23, 0, 0, 0)),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Date",
                                style: TextStyle(
                                    color: color1, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                appointments[index]['date'],
                                style: TextStyle(color: color1),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Time",
                                style: TextStyle(
                                    color: color1, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                appointments[index]['time'],
                                style: TextStyle(color: color1),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Specialist",
                                style: TextStyle(
                                    color: color1, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                appointments[index]['doctor'],
                                style: TextStyle(color: color1),
                              ),
                            ],
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Mode",
                                style: TextStyle(
                                    color: color1, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                appointments[index]['mode'],
                                style: TextStyle(color: color1),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                "Status",
                                style: TextStyle(
                                    color: color1, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                appointments[index]['status'],
                                style: TextStyle(color: color1),
                              ),
                            ],
                          ),
                          if (appointments[index]['status'] == "Confirmed")
                            ElevatedButton(
                              onPressed: () {
                                // Navigator.push(context, MaterialPageRoute(builder: (context) => const AppointmentCallPage()));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(71, 255, 255, 255)),
                              child: Row(
                                children: [
                                  Text(
                                    "Start",
                                    style: TextStyle(color: color1),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  Icon(
                                    Icons.video_call_rounded,
                                    color: color1,
                                  ),
                                ],
                              ),
                            ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
