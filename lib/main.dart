import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mindcare/screens/home/screenList.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  Future<void> checkPermissions() async {
    bool storage = true;
    bool videos = true;
    bool photos = true;

// Only check for storage < Android 13
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    if (androidInfo.version.sdkInt >= 33) {
      videos = await Permission.videos.status.isGranted;
      photos = await Permission.photos.status.isGranted;
    } else {
      storage = await Permission.storage.status.isGranted;
    }

    if (storage && videos && photos) {
      // Good to go!
    } else {
      // crap.
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
    checkPermissions();
    // print("initState() called");
  }

  void dispose() {
    // Allow the system to handle screen orientation again when the app is disposed.
    SystemChrome.setPreferredOrientations(DeviceOrientation.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return ScreenUtilInit(
      designSize: const Size(1080, 2400),
      child: MaterialApp(
        title: 'Mind Care',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.light,
          ),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          useMaterial3: true,
          fontFamily: 'poppins',
        ),
        home:screenList()
      ),
    );
  }
}