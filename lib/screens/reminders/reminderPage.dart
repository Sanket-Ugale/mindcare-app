import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mindcare/localDB/sql_helper.dart';
import 'package:mindcare/main.dart';
import 'package:mindcare/screens/reminders/notification.dart';
import 'package:mindcare/screens/reminders/services/noti_service.dart';

class reminderPage extends StatefulWidget {
  const reminderPage({super.key});

  @override
  State<reminderPage> createState() => _reminderPageState();
}

class _reminderPageState extends State<reminderPage> {
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
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                  margin: const EdgeInsets.only(top:150),
                  child: AlertDialog(
                    icon: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).pop(false); // Close the dialog
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
                          SizedBox(height:20),
                          ElevatedButton(
                            
                            style: ElevatedButton.styleFrom(
                              minimumSize: const Size(150, 50),
                              primary: Colors.white,
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
                                  Navigator.of(context).pop(
                                      true); // Close the dialog with a result
                                });
                                Noti.showBigTextNotification(
                                    // id: 0,
                                    title: titleController.text,
                                    body: descriptionController.text,
                                    fln: flutterLocalNotificationsPlugin);
                              //   NotificationService().scheduleNotification(
                              //       title: titleController.text,
                              //       body: '$descriptionController.text',
                              //       scheduledNotificationDateTime:DateTime.parse(dateTimeController.text),
                                 
                              // );
                              }},
                            child: const Text('Save', style: TextStyle(fontSize: 20, color: Colors.black),)
                          ),
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
      appBar: AppBar(
        title: const Text('Reminder'),
        centerTitle: true,
      ),
      body: ListView.builder(
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
                      color: Colors.white),
                  child: ListTile(
                    title: Text(remindersList[index]['title']),
                    subtitle: Text(remindersList[index]['description']),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        Text("Date: $formattedDate"),
                        Text("Time: $formattedTime"),
                      ],
                    ),
                    onLongPress: () {
                      showDialog(
                        // barrierColor: Colors.white.withOpacity(0.7),
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: Colors.white,
                          surfaceTintColor: Colors.white,
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
    );
  }
}
