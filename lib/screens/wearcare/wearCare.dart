// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:health/health.dart';
// import 'package:mindcare/const/colors.dart';
// import 'package:permission_handler/permission_handler.dart';

// void main() => runApp(wearCare());

// class wearCare extends StatefulWidget {
//   @override
//   _wearCareState createState() => _wearCareState();
// }

// enum AppState {
//   DATA_NOT_FETCHED,
//   FETCHING_DATA,
//   DATA_READY,
//   NO_DATA,
//   AUTHORIZED,
//   AUTH_NOT_GRANTED,
//   DATA_ADDED,
//   DATA_DELETED,
//   DATA_NOT_ADDED,
//   DATA_NOT_DELETED,
//   STEPS_READY,
// }

// class _wearCareState extends State<wearCare> {
//   List<HealthDataPoint> _healthDataList = [];
//   AppState _state = AppState.DATA_NOT_FETCHED;
//   int _nofSteps = 0;

//   // Define the types to get.

//   // Use the entire list on e.g. Android.
//   // static final types = dataTypesIOS;

//   // Or specify specific types
//   static final types = [
//     HealthDataType.WEIGHT,
//     HealthDataType.STEPS,
//     HealthDataType.HEIGHT,
//     HealthDataType.BLOOD_GLUCOSE,
//     HealthDataType.WORKOUT,
//     HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
//     HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
//     // Uncomment this line on iOS - only available on iOS
//     // HealthDataType.AUDIOGRAM
//   ];

//   // Set up corresponding permissions
//   // READ only
//   final permissions = types.map((e) => HealthDataAccess.READ).toList();

//   // Or both READ and WRITE
//   // final permissions = types.map((e) => HealthDataAccess.READ_WRITE).toList();

//   // create a HealthFactory for use in the app
//   HealthFactory health = HealthFactory(useHealthConnectIfAvailable: true);

//   /// Authorize, i.e. get permissions to access relevant health data.
//   Future authorize() async {
//     // If we are trying to read Step Count, Workout, Sleep or other data that requires
//     // the ACTIVITY_RECOGNITION permission, we need to request the permission first.
//     // This requires a special request authorization call.
//     //
//     // The location permission is requested for Workouts using the Distance information.
//     await Permission.activityRecognition.request();
//     await Permission.location.request();

//     // Check if we have health permissions
//     bool? hasPermissions =
//         await health.hasPermissions(types, permissions: permissions);

//     // hasPermissions = false because the hasPermission cannot disclose if WRITE access exists.
//     // Hence, we have to request with WRITE as well.
//     hasPermissions = false;

//     bool authorized = false;
//     if (!hasPermissions) {
//       // requesting access to the data types before reading them
//       try {
//         authorized =
//             await health.requestAuthorization(types, permissions: permissions);
//       } catch (error) {
//         print("Exception in authorize: $error");
//       }
//     }

//     setState(() => _state =
//         (authorized) ? AppState.AUTHORIZED : AppState.AUTH_NOT_GRANTED);
//   }

//   // ... (Remaining code remains unchanged)
//   /// Fetch data points from the health plugin and show them in the app.
//   Future fetchData() async {
//     setState(() => _state = AppState.FETCHING_DATA);

//     // get data within the last 24 hours
//     final now = DateTime.now();
//     final yesterday = now.subtract(Duration(hours: 24));

//     // Clear old data points
//     _healthDataList.clear();

//     try {
//       // fetch health data
//       List<HealthDataPoint> healthData =
//           await health.getHealthDataFromTypes(yesterday, now, types);
//       // save all the new data points (only the first 100)
//       _healthDataList.addAll(
//           (healthData.length < 100) ? healthData : healthData.sublist(0, 100));
//     } catch (error) {
//       print("Exception in getHealthDataFromTypes: $error");
//     }

//     // filter out duplicates
//     _healthDataList = HealthFactory.removeDuplicates(_healthDataList);

//     // print the results
//     _healthDataList.forEach((x) => print(x));

//     // update the UI to display the results
//     setState(() {
//       _state = _healthDataList.isEmpty ? AppState.NO_DATA : AppState.DATA_READY;
//     });
//   }

//   /// Add some random health data.
//   Future addData() async {
//     final now = DateTime.now();
//     final earlier = now.subtract(Duration(minutes: 20));
//     bool success = true;
//     success &= await health.writeHealthData(
//         1.925, HealthDataType.HEIGHT, earlier, now);
//     success &=
//         await health.writeHealthData(90, HealthDataType.WEIGHT, earlier, now);
//     success &= await health.writeHealthData(
//         90, HealthDataType.HEART_RATE, earlier, now);
//     success &=
//         await health.writeHealthData(90, HealthDataType.STEPS, earlier, now);
//     success &= await health.writeHealthData(
//         200, HealthDataType.ACTIVE_ENERGY_BURNED, earlier, now);
//     success &= await health.writeHealthData(
//         70, HealthDataType.HEART_RATE, earlier, now);
//     success &= await health.writeHealthData(
//         37, HealthDataType.BODY_TEMPERATURE, earlier, now);
//     success &= await health.writeBloodOxygen(98, earlier, now, flowRate: 1.0);
//     success &= await health.writeHealthData(
//         105, HealthDataType.BLOOD_GLUCOSE, earlier, now);
//     success &=
//         await health.writeHealthData(1.8, HealthDataType.WATER, earlier, now);
//     success &= await health.writeWorkoutData(
//         HealthWorkoutActivityType.AMERICAN_FOOTBALL,
//         now.subtract(Duration(minutes: 15)),
//         now,
//         totalDistance: 2430,
//         totalEnergyBurned: 400);
//     success &= await health.writeBloodPressure(90, 80, earlier, now);
//     success &= await health.writeHealthData(
//         0.0, HealthDataType.SLEEP_DEEP, earlier, now);
//     success &= await health.writeMeal(
//         earlier, now, 1000, 50, 25, 50, "Banana", MealType.SNACK);
//     setState(() {
//       _state = success ? AppState.DATA_ADDED : AppState.DATA_NOT_ADDED;
//     });
//   }

//   /// Delete some random health data.
//   Future deleteData() async {
//     final now = DateTime.now();
//     final earlier = now.subtract(Duration(hours: 24));

//     bool success = true;
//     for (HealthDataType type in types) {
//       success &= await health.delete(type, earlier, now);
//     }

//     setState(() {
//       _state = success ? AppState.DATA_DELETED : AppState.DATA_NOT_DELETED;
//     });
//   }

//   // ... (Remaining code remains unchanged)
//   /// Fetch steps from the health plugin and show them in the app.
//   Future fetchStepData() async {
//     int? steps;

//     // get steps for today (i.e., since midnight)
//     final now = DateTime.now();
//     final midnight = DateTime(now.year, now.month, now.day);

//     bool stepsPermission =
//         await health.hasPermissions([HealthDataType.STEPS]) ?? false;
//     if (!stepsPermission) {
//       stepsPermission =
//           await health.requestAuthorization([HealthDataType.STEPS]);
//     }

//     if (stepsPermission) {
//       try {
//         steps = await health.getTotalStepsInInterval(midnight, now);
//       } catch (error) {
//         print("Caught exception in getTotalStepsInInterval: $error");
//       }

//       print('Total number of steps: $steps');

//       setState(() {
//         _nofSteps = (steps == null) ? 0 : steps;
//         _state = (steps == null) ? AppState.NO_DATA : AppState.STEPS_READY;
//       });
//     } else {
//       print("Authorization not granted - error in authorization");
//       setState(() => _state = AppState.DATA_NOT_FETCHED);
//     }
//   }

//   /// Revoke access to health data. Note, this only has an effect on Android.
//   Future revokeAccess() async {
//     try {
//       await health.revokePermissions();
//     } catch (error) {
//       print("Caught exception in revokeAccess: $error");
//     }
//   }

//   Widget _contentFetchingData() {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         Container(
//           padding: EdgeInsets.all(20),
//           child: CircularProgressIndicator(
//             color: color1,
//             strokeWidth: 5,
//           ),
//         ),
//         Text(
//           'Fetching data...',
//           style: TextStyle(color: Colors.white),
//         )
//       ],
//     );
//   }

//   Widget _contentDataReady() {
//     Map<String, int> stepsByDate = {};

//     // Aggregate steps by date
//     for (HealthDataPoint dataPoint in _healthDataList) {
//       if (dataPoint.type == HealthDataType.STEPS) {
//         String dateKey =
//             dataPoint.dateFrom.toLocal().toLocal().toString().split(' ')[0];
//         stepsByDate[dateKey] = ((stepsByDate[dateKey] ?? 0) +
//             int.parse(dataPoint.value.toString())) as int;
//       }
//     }

//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.stretch,
//       children: [
//         Container(
//           padding: EdgeInsets.all(10),
//           // color: Colors.green,
//           child: Text(
//             'Steps Aggregated by Date',
//             style: TextStyle(
//                 fontSize: 18, fontWeight: FontWeight.bold, color: color1),
//           ),
//         ),
//         if (stepsByDate.isNotEmpty)
//           Column(
//             children: stepsByDate.entries.map((entry) {
//               return Container(
//                 margin: EdgeInsets.all(50.r),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(40.r),
//                   color: const Color.fromARGB(6, 138, 138, 138),
//                   boxShadow: [
//                     BoxShadow(
//                       color: color1.withOpacity(0.5),
//                       offset: const Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child: ListTile(
//                   trailing: Icon(
//                     Icons.nordic_walking,
//                     color: color1,
//                     size: 100.r,
//                   ),
//                   title: Text(
//                     'Date: ${entry.key}',
//                     style: TextStyle(color: color1),
//                   ),
//                   subtitle: Text(
//                     'Total Steps: ${entry.value}',
//                     style: TextStyle(color: color1),
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//         if (stepsByDate.isEmpty)
//           Container(
//             padding: EdgeInsets.all(10),
//             child: Text('No steps data available.'),
//           ),
//       ],
//     );
//   }

//   // ... (Remaining code remains unchanged)
//   Widget _contentNoData() {
//     return Text('No Data to show');
//   }

//   Widget _contentNotFetched() {
//     return Column(
//       children: [
//         Text("Press 'Auth' to get permissions to access health data."),
//         Text("Press 'Fetch Dat' to get health data."),
//         Text("Press 'Add Data' to add some random health data."),
//         Text("Press 'Delete Data' to remove some random health data."),
//       ],
//       mainAxisAlignment: MainAxisAlignment.center,
//     );
//   }

//   Widget _authorized() {
//     return Text('Authorization granted!');
//   }

//   Widget _authorizationNotGranted() {
//     return Text('Authorization not given. '
//         'For Android please check your OAUTH2 client ID is correct in Google Developer Console. '
//         'For iOS check your permissions in Apple Health.');
//   }

//   Widget _dataAdded() {
//     return Text('Data points inserted successfully!');
//   }

//   Widget _dataDeleted() {
//     return Text('Data points deleted successfully!');
//   }

//   Widget _stepsFetched() {
//     return Text('Total number of steps: $_nofSteps');
//   }

//   Widget _dataNotAdded() {
//     return Text('Failed to add data');
//   }

//   Widget _dataNotDeleted() {
//     return Text('Failed to delete data');
//   }

//   Widget _content() {
//     if (_state == AppState.DATA_READY)
//       return _contentDataReady();
//     else if (_state == AppState.NO_DATA)
//       return _contentNoData();
//     else if (_state == AppState.FETCHING_DATA)
//       return _contentFetchingData();
//     else if (_state == AppState.AUTHORIZED)
//       return _authorized();
//     else if (_state == AppState.AUTH_NOT_GRANTED)
//       return _authorizationNotGranted();
//     else if (_state == AppState.DATA_ADDED)
//       return _dataAdded();
//     else if (_state == AppState.DATA_DELETED)
//       return _dataDeleted();
//     else if (_state == AppState.STEPS_READY)
//       return _stepsFetched();
//     else if (_state == AppState.DATA_NOT_ADDED)
//       return _dataNotAdded();
//     else if (_state == AppState.DATA_NOT_DELETED)
//       return _dataNotDeleted();
//     else
//       return _contentNotFetched();
//   }

//   Future<void> AuthFetch() async {
//     super.initState();
//     // Call your function here
//     await authorize();
//     await fetchData();
//   }

//   @override
//   void initState() {
//     super.initState();
//     // Call your function here
//     AuthFetch();
//   }
// // void AuthFetch(){

// //   fetchData();
// // }
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         // floatingActionButton: FloatingActionButton(onPressed: fetchData, child: Icon(Icons.refresh),backgroundColor: color2,),
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(0),
//           child: AppBar(
//             systemOverlayStyle: SystemUiOverlayStyle(
//               statusBarColor: Colors.grey[900],
//               statusBarIconBrightness: Brightness.light,
//             ),
//           ),
//         ),
//         body: Container(
//           height: MediaQuery.of(context).size.height - 35,
//           width: MediaQuery.of(context).size.width,
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               begin: Alignment.topLeft,
//               end: Alignment(0.8, 1),
//               colors: <Color>[
//                 Color.fromARGB(255, 0, 0, 0),
//                 Color.fromARGB(255, 0, 55, 67),
//                 Color.fromARGB(255, 0, 91, 111),
//               ],
//               tileMode: TileMode.mirror,
//             ),
//           ),
//           child: Column(
//             children: [
//               Wrap(
//                 spacing: 10,
//                 children: [
//                   // ListTile(
//                   //   title: Text("Press 'Auth' to get permissions to access health data."),
//                   //   // onTap: AuthFetch,
//                   // ),

//                   // TextButton(
//                   //     onPressed: authorize,
//                   //     child:
//                   //         Text("Auth", style: TextStyle(color: Colors.white)),
//                   //     style: ButtonStyle(
//                   //         backgroundColor:
//                   //             MaterialStatePropertyAll(Colors.blue))),
//                   // TextButton(
//                   //     onPressed: () async {
//                   //       await authorize();
//                   //       await fetchData();
//                   //     },
//                   // child: Icon(Icons.refresh, color: Colors.white),
//                   // style: ButtonStyle(
//                   //     backgroundColor:
//                   //         MaterialStatePropertyAll(Colors.blue))),
//                   // TextButton(
//                   //     onPressed: addData,
//                   //     child: Text("Add Data",
//                   //         style: TextStyle(color: Colors.white)),
//                   //     style: ButtonStyle(
//                   //         backgroundColor:
//                   //             MaterialStatePropertyAll(Colors.blue))),
//                   // TextButton(
//                   //     onPressed: deleteData,
//                   //     child: Text("Delete Data",
//                   //         style: TextStyle(color: Colors.white)),
//                   //     style: ButtonStyle(
//                   //         backgroundColor:
//                   //             MaterialStatePropertyAll(Colors.blue))),
//                   // TextButton(
//                   //     onPressed: fetchStepData,
//                   //     child: Text("Fetch Step Data",
//                   //         style: TextStyle(color: Colors.white)),
//                   //     style: ButtonStyle(
//                   //         backgroundColor:
//                   //             MaterialStatePropertyAll(Colors.blue))),
//                   // TextButton(
//                   // onPressed: revokeAccess,
//                   // child: Text("Revoke Access",
//                   //     style: TextStyle(color: Colors.white)),
//                   // style: ButtonStyle(
//                   //     backgroundColor:
//                   //         MaterialStatePropertyAll(Colors.blue))),
//                 ],
//               ),
//               // Divider(thickness: 3),
//               Expanded(child: Center(child: _content()))
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }






































import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:health/health.dart';
import 'package:mindcare/const/colors.dart';
import 'package:permission_handler/permission_handler.dart';

void main() => runApp(WearCare());

class WearCare extends StatefulWidget {
  @override
  _WearCareState createState() => _WearCareState();
}

enum AppState {
  DATA_NOT_FETCHED,
  FETCHING_DATA,
  DATA_READY,
  NO_DATA,
  AUTHORIZED,
  AUTH_NOT_GRANTED,
}

class _WearCareState extends State<WearCare> {
  List<HealthDataPoint> _healthDataList = [];
  AppState _state = AppState.DATA_NOT_FETCHED;
  String _debugInfo = '';

  static final types = [
    HealthDataType.STEPS,
    HealthDataType.ACTIVE_ENERGY_BURNED,
    HealthDataType.HEART_RATE,
    HealthDataType.BLOOD_OXYGEN,
    HealthDataType.BLOOD_PRESSURE_SYSTOLIC,
    HealthDataType.BLOOD_PRESSURE_DIASTOLIC,
  ];

  final permissions = types.map((e) => HealthDataAccess.READ).toList();

  HealthFactory health = HealthFactory(useHealthConnectIfAvailable: true);

  @override
  void initState() {
    super.initState();
    authorizeFetchData();
  }

  Future<void> authorizeFetchData() async {
    await authorize();
    if (_state == AppState.AUTHORIZED) {
      await fetchData();
    }
  }

  Future authorize() async {
    await Permission.activityRecognition.request();
    await Permission.location.request();

    bool authorized = await health.requestAuthorization(types, permissions: permissions);

    setState(() {
      _state = authorized ? AppState.AUTHORIZED : AppState.AUTH_NOT_GRANTED;
      _debugInfo += 'Authorization result: $authorized\n';
    });

    // Check individual permissions
    for (var type in types) {
      bool? typeAuth = await health.hasPermissions([type]);
      _debugInfo += 'Permission for $type: $typeAuth\n';
    }
  }

  Future fetchData() async {
    setState(() => _state = AppState.FETCHING_DATA);

    final now = DateTime.now();
    final yesterday = now.subtract(Duration(hours: 24));

    _healthDataList.clear();

    try {
      for (var type in types) {
        try {
          List<HealthDataPoint> typeData = await health.getHealthDataFromTypes(yesterday, now, [type]);
          _healthDataList.addAll(typeData);
          _debugInfo += 'Fetched ${typeData.length} datapoints for $type\n';
        } catch (error) {
          _debugInfo += 'Error fetching $type: $error\n';
        }
      }
    } catch (error) {
      _debugInfo += "General exception in getHealthDataFromTypes: $error\n";
    }

    _healthDataList = HealthFactory.removeDuplicates(_healthDataList);

    setState(() {
      _state = _healthDataList.isEmpty ? AppState.NO_DATA : AppState.DATA_READY;
      _debugInfo += 'Total fetched datapoints: ${_healthDataList.length}\n';
    });
  }

  Widget _contentFetchingData() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          child: CircularProgressIndicator(
            color: color1,
            strokeWidth: 5,
          ),
        ),
        Text('Fetching data...', style: TextStyle(color: Colors.white))
      ],
    );
  }

  Widget _contentDataReady() {
    Map<HealthDataType, dynamic> latestData = {};

    for (var dataPoint in _healthDataList) {
      if (!latestData.containsKey(dataPoint.type) || 
          (latestData[dataPoint.type].dateFrom.isBefore(dataPoint.dateFrom))) {
        latestData[dataPoint.type] = dataPoint;
      }
    }

    return ListView(
      children: [
        _buildMetricTile(HealthDataType.STEPS, latestData, 'Steps', Icons.directions_walk),
        _buildMetricTile(HealthDataType.ACTIVE_ENERGY_BURNED, latestData, 'Calories Burned', Icons.local_fire_department),
        _buildMetricTile(HealthDataType.HEART_RATE, latestData, 'Heart Rate', Icons.favorite),
        _buildMetricTile(HealthDataType.BLOOD_OXYGEN, latestData, 'Blood Oxygen', Icons.opacity),
        _buildBloodPressureTile(latestData),
        _buildDebugTile(),
      ],
    );
  }

  Widget _buildMetricTile(HealthDataType type, Map<HealthDataType, dynamic> data, String title, IconData icon) {
    var value = data[type]?.value ?? 'N/A';
    var unit = data[type]?.unit?.toString() ?? '';
    return Container(
      margin: EdgeInsets.all(50.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        color: const Color.fromARGB(6, 138, 138, 138),
        boxShadow: [
          BoxShadow(
            color: color1.withOpacity(0.5),
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: color1, size: 100.r),
        title: Text(title, style: TextStyle(color: color1)),
        subtitle: Text('$value $unit', style: TextStyle(color: color1)),
      ),
    );
  }

  Widget _buildBloodPressureTile(Map<HealthDataType, dynamic> data) {
    var systolic = data[HealthDataType.BLOOD_PRESSURE_SYSTOLIC]?.value ?? 'N/A';
    var diastolic = data[HealthDataType.BLOOD_PRESSURE_DIASTOLIC]?.value ?? 'N/A';
    return Container(
      margin: EdgeInsets.all(50.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        color: const Color.fromARGB(6, 138, 138, 138),
        boxShadow: [
          BoxShadow(
            color: color1.withOpacity(0.5),
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(Icons.favorite_border, color: color1, size: 100.r),
        title: Text('Blood Pressure', style: TextStyle(color: color1)),
        subtitle: Text('$systolic / $diastolic mmHg', style: TextStyle(color: color1)),
      ),
    );
  }

  Widget _buildDebugTile() {
    return Container(
      margin: EdgeInsets.all(50.r),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.r),
        color: const Color.fromARGB(6, 138, 138, 138),
        boxShadow: [
          BoxShadow(
            color: color1.withOpacity(0.5),
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        title: Text('Debug Info', style: TextStyle(color: color1)),
        subtitle: Text(_debugInfo, style: TextStyle(color: color1)),
      ),
    );
  }

  Widget _contentNoData() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('No Data to show', style: TextStyle(color: Colors.white)),
          SizedBox(height: 20),
          Text(_debugInfo, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _authorizationNotGranted() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Authorization not granted. Please check your permissions in Google Fit.',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(_debugInfo, style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _content() {
    switch (_state) {
      case AppState.DATA_READY:
        return _contentDataReady();
      case AppState.NO_DATA:
        return _contentNoData();
      case AppState.FETCHING_DATA:
        return _contentFetchingData();
      case AppState.AUTH_NOT_GRANTED:
        return _authorizationNotGranted();
      default:
        return _contentFetchingData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
          child: Column(
            children: [
              Expanded(child: _content()),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchData,
          child: Icon(Icons.refresh),
          backgroundColor: color2,
        ),
      ),
    );
  }
}