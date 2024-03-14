import 'dart:math';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

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

  static Future showBigTextNotification(
      {
        // var id = ,
      required String title,
      required String body,
      var payload,
      required FlutterLocalNotificationsPlugin fln, required DateTime scheduledTime}) async {
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
    await fln.show(Random().nextInt(1000).toInt(), title, body, not, payload: payload);
  }
}
