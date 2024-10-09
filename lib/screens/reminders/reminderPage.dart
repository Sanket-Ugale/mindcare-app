import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:mindcare/const/colors.dart';
import 'package:mindcare/localDB/sql_helper.dart';
import 'package:mindcare/main.dart';
// import 'package:mindcare/screens/reminders/notification.dart';
// import 'package:mindcare/screens/reminders/services/noti_service.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/timezone.dart';

class ReminderPage extends StatefulWidget {
  const ReminderPage({super.key});

  @override
  State<ReminderPage> createState() => _ReminderPageState();
}

class _ReminderPageState extends State<ReminderPage> {
  List remindersList = [];
  bool isLoading = true;

  void getReminders() async {
    // get reminders from local db
    final reminders = await SQLHelper.getNotifications();
    setState(() {
      remindersList = reminders;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getReminders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(150, 255, 255, 255),
        onPressed: () {
          TextEditingController titleController = TextEditingController();
          TextEditingController descriptionController = TextEditingController();
          TextEditingController dateTimeController = TextEditingController();
          DateTime? selectedDate;
          TimeOfDay? selectedTime;

          showDialog(
            context: context,
            builder: (context) => StatefulBuilder(
              builder: (context, setState) => SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.only(top: 150),
                  child: AlertDialog(
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context)
                                .pop(false); // Close the dialog
                          },
                          child: const Icon(Icons.close),
                        ),
                      ],
                    ),
                    surfaceTintColor: Colors.white,
                    backgroundColor: Colors.white,
                    content: Container(
                      height: 300,
                      width: 300,
                      child: Column(
                        children: [
                          TextField(
                            controller: titleController,
                            decoration: const InputDecoration(
                              labelText: 'Title',
                            ),
                          ),
                          TextField(
                            controller: descriptionController,
                            decoration: const InputDecoration(
                              labelText: 'Description',
                            ),
                          ),
                          TextField(
                            readOnly: true,
                            controller: dateTimeController,
                            decoration: const InputDecoration(
                              labelText: 'Select Date and Time',
                            ),
                            onTap: () async {
                              selectedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                lastDate: DateTime(2050),
                              );

                              if (selectedDate != null) {
                                selectedTime = await showTimePicker(
                                  context: context,
                                  initialTime: TimeOfDay.now(),
                                );

                                if (selectedTime != null) {
                                  selectedDate = DateTime(
                                    selectedDate!.year,
                                    selectedDate!.month,
                                    selectedDate!.day,
                                    selectedTime!.hour,
                                    selectedTime!.minute,
                                  );

                                  dateTimeController.text =
                                      DateFormat('yyyy-MM-dd HH:mm:ss.SSS')
                                          .format(selectedDate!);
                                }
                              }
                            },
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: const Size(150, 50), backgroundColor: Colors.white,
                                surfaceTintColor: Colors.black,
                                shadowColor: Colors.black,
                                elevation: 10,
                              ),
                              onPressed: () {
                                // save reminder to local db
                                if (selectedDate != null) {
                                  String formattedDateTime =
                                      DateFormat('yyyy-MM-ddTHH:mm:ss.SSS')
                                          .format(selectedDate!);
                                  SQLHelper.insertNotification(
                                          titleController.text,
                                          descriptionController.text,
                                          DateTime.parse(formattedDateTime))
                                      .then((_) {
                                    Navigator.of(context)
                                        .pop(true); // Close the dialog
                                  });
                                  Noti.showBigTextNotification(
                                    title: titleController.text,
                                    body: descriptionController.text,
                                    scheduledTime:
                                        DateTime.parse(formattedDateTime),
                                    fln: flutterLocalNotificationsPlugin,
                                  );
                                }
                              },
                              child: const Text(
                                'Save',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ).then((saved) {
            if (saved != null && saved) {
              getReminders();
              setState(() {});
            }
          });
        },
        child: const Icon(Icons.add),
      ),
        appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.grey[900],
            statusBarIconBrightness: Brightness.light,
          ),
        ),
      ),
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
        child: ListView.builder(
            itemCount: remindersList.length,
            itemBuilder: (context, index) {
              if (isLoading) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                ));
              } else {
                DateTime sendTime =
                    DateTime.parse(remindersList[index]['sendTime']);
                String formattedDate = DateFormat('dd-MM-yyyy').format(sendTime);
                String formattedTime = DateFormat('HH:mm').format(sendTime);
        
                return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(36, 255, 255, 255)),
                    child: ListTile(
                      title: Text(remindersList[index]['title'], style: TextStyle(color: color1),),
                      subtitle: Text(remindersList[index]['description'], style: TextStyle(color: color1),),
                      trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: <Widget>[
                          Text("Date: $formattedDate", style: TextStyle(color: color1),),
                          Text("Time: $formattedTime", style: TextStyle(color: color1),),
                        ],
                      ),
                      onLongPress: () {
                        showDialog(
                          // barrierColor: Colors.white.withOpacity(0.7),
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: Color.fromARGB(124, 255, 255, 255),
                            surfaceTintColor: color1,
                            title: Text('Delete Reminder'),
                            content: Text('Do you want to delete this reminder?'),
                            actions: <Widget>[
                              TextButton(
                                child: Text('Cancel'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Delete'),
                                onPressed: () {
                                  // Delete the item from the data source
                                  SQLHelper.deleteNotification(remindersList[
                                          index][
                                      'id']); // Assuming SQLHelper has a deleteNotification method
        
                                  // Remove the item from the list of items and refresh the list
                                  setState(() {
                                    // remindersList.removeAt(index);
                                    getReminders();
                                  });
        
                                  // Close the dialog
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ));
              }
            }),
      ),
    );
  }
}

class Noti {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var android = AndroidInitializationSettings('@mipmap/launcher_icon');
    // var ios = IOSInitializationSettings();
    var initSettings = InitializationSettings(
      android: android,
      // iOS: ios
    );
    await flutterLocalNotificationsPlugin.initialize(initSettings);
  }

  static Future showBigTextNotification({
    required String title,
    required String body,
    var payload,
    required FlutterLocalNotificationsPlugin fln,
    required DateTime scheduledTime,
  }) async {
    AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'channel_id 69',
      'big text channel name',
      playSound: true,
      enableVibration: true,
      importance: Importance.max,
      priority: Priority.high,
      styleInformation: BigTextStyleInformation(body),
      // sound: RawResourceAndroidNotificationSound('notification'),
    );
    var not = NotificationDetails(
      android: androidPlatformChannelSpecifics,
    );
    await fln.zonedSchedule(
      0,
      title,
      body,
      TZDateTime.from(scheduledTime, tz.local),
      not,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }
}
