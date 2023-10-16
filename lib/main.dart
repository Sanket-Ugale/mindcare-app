import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mindcare/screens/screenList.dart';
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
    @override
  void initState() {
    super.initState();
    checkPermissions();
    print("initState() called");
  }
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1080,2400),
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
        home:
        // homePage()  
        screenList(),
      ),
    );
  }
}