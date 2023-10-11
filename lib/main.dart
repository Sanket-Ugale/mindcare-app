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
          // This is the theme of your application.
          //
          // TRY THIS: Try running your application with "flutter run". You'll see
          // the application has a blue toolbar. Then, without quitting the app,
          // try changing the seedColor in the colorScheme below to Colors.green
          // and then invoke "hot reload" (save your changes or press the "hot
          // reload" button in a Flutter-supported IDE, or press "r" if you used
          // the command line to start the app).
          //
          // Notice that the counter didn't reset back to zero; the application
          // state is not lost during the reload. To reset the state, use hot
          // restart instead.
          //
          // This works for code too, not just values: Most code changes can be
          // tested with just a hot reload.
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