import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mindcare/screens/error/maintainance.dart';
import 'package:mindcare/screens/error/noInternetError.dart';
import 'package:mindcare/screens/home/screenList.dart';
import 'package:mindcare/screens/reminders/notification.dart';
import 'package:permission_handler/permission_handler.dart';


void main() {
  runApp(const MyApp());
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool isUnderMaintainace = false;
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  Future<void> checkPermissions() async {
    bool storage = true;
    bool videos = true;
    bool photos = true;
    bool bodySensors = true;
    bool camera = true;
    bool location = true;
    bool activityRecognition = true;
    bool sms = true;

    // Only check for storage < Android 13
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    if (androidInfo.version.sdkInt >= 33) {
      videos = await Permission.videos.status.isGranted;
      photos = await Permission.photos.status.isGranted;

      bodySensors = await Permission.sensors.status.isGranted;
      camera = await Permission.camera.status.isGranted;
      location = await Permission.location.status.isGranted;
      activityRecognition =
          await Permission.activityRecognition.status.isGranted;
      sms = await Permission.sms.status.isGranted;
    } else {
      storage = await Permission.storage.status.isGranted;
    }

    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
            .resolvePlatformSpecificImplementation<
                AndroidFlutterLocalNotificationsPlugin>()
            ?.areNotificationsEnabled() ??
        false;

    if (storage &&
        videos &&
        photos &&
        bodySensors &&
        camera &&
        location &&
        activityRecognition &&
        sms) {
      // Good to go!
    } else {
      // Request permissions
      await [
        Permission.storage,
        Permission.photos,
        Permission.videos,
        Permission.notification,
        Permission.sensors,
        Permission.camera,
        Permission.location,
        Permission.activityRecognition,
        Permission.sms,
      ].request();

      // final info = statuses[Permission.storage].toString();
      // print(info);
    }
  }

  void onUserLeaveHint() {
    Fluttertoast.showToast(
      msg: "Changing orientation is not allowed in this app.",
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }

  @override
  void initState() {
    super.initState();
    Noti.initialize(flutterLocalNotificationsPlugin);
    checkPermissions();
  }

  getConnectivity() => subscription = Connectivity()
          .onConnectivityChanged
          .listen((ConnectivityResult result) async {
        isDeviceConnected = await InternetConnectionChecker().hasConnection;
      });

  @override
  void dispose() {
    // Allow the system to handle screen orientation again when the app is disposed.
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ScreenUtilInit(
      designSize: const Size(1080, 2400),
      child: MaterialApp(
        title: 'MindCare',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
          fontFamily: 'poppins',
        ),
        home: StreamBuilder<ConnectivityResult>(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data != ConnectivityResult.none) {
              return isUnderMaintainace ? const maintainancePage() : const ScreenList();
            } else {
              return const noInternetPage();
            }
          },
        ),
      ),
    );
  }
}
