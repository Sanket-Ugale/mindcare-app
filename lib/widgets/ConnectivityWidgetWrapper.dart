import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mindcare/screens/error/noInternetError.dart';

class ConnectivityWidgetWrapper extends StatefulWidget {
  final Widget child;

  const ConnectivityWidgetWrapper({Key? key, required this.child}) : super(key: key);

  @override
  State<ConnectivityWidgetWrapper> createState() => _ConnectivityWidgetWrapperState();
}

class _ConnectivityWidgetWrapperState extends State<ConnectivityWidgetWrapper> {
  late StreamSubscription subscription;
  var isDeviceConnected = false;

  @override
  void initState() {
    super.initState();
    getConnectivity();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

getConnectivity() {
  subscription = Connectivity()
      .onConnectivityChanged
      .listen((ConnectivityResult result) async {
    bool previousConnectionStatus = isDeviceConnected;
    isDeviceConnected = await InternetConnectionChecker().hasConnection;
    if (previousConnectionStatus != isDeviceConnected) {
      setState(() {});
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return isDeviceConnected ? widget.child : const noInternetPage();
  }
}