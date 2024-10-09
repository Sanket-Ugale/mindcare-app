// import 'dart:async';

// import 'package:agora_rtc_engine/agora_rtc_engine.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';
// import 'package:mindcare/const/colors.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// const appId = "be5fc8ece3f94175882bc161f0db11dc";
// // const token = "";
// // const channel = "";
// // const token = "007eJxTYIi/LC9y2cVY6Nd94af2F2TNf0jrMX7prRCSSb2lfzTgt7cCQ1KqaVqyRWpyqnGapYmhuamFhVFSsqGZYZpBSpKhYUryrYXfUhsCGRn0tV8yMEIhiM/D4FhQkJ+ZV5KbmldiyMAAABGAIkY=";
// const channel = "Appointment2";

// void main() => runApp(const MaterialApp(home: AppointmentCallPage()));

// class AppointmentCallPage extends StatefulWidget {
//   const AppointmentCallPage({Key? key}) : super(key: key);

//   @override
//   State<AppointmentCallPage> createState() => _AppointmentCallPageState();
// }

// class _AppointmentCallPageState extends State<AppointmentCallPage> {
//   int? _remoteUid;
//   bool _localUserJoined = false;
//   late RtcEngine _engine;
//   bool isLocalVideoMuted = false; // Add this line
//   bool isLocalAudioMuted = false; // Add this line


//   @override
//   void initState() {
//     super.initState();
//     initAgora();
//   }

//   Future<String> getToken(int appointmentId) async {
//     final response = await http.get(
//       Uri.parse(
//           'https://mindcare-app.onrender.com/api/appointments/$appointmentId'),
//     );

//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body)['payload'];
//       if (data.isNotEmpty) {
//         return data[0]['appointment_token'];
//       }
//     }

//     throw Exception('Failed to load token');
//   }

//   Future<void> initAgora() async {
//     // retrieve permissions
//     await [Permission.microphone, Permission.camera].request();
//     // get token
//     String token = await getToken(1); // replace 1 with your appointment ID
//     print("++++++++++++++++++++++++++++++++++++++ $token");
//     //create the engine
//     _engine = createAgoraRtcEngine();
//     await _engine.initialize(const RtcEngineContext(
//       appId: appId,
//       channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
//     ));
//     _engine.registerEventHandler(
//       RtcEngineEventHandler(
//         onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
//           debugPrint("local user ${connection.localUid} joined");
//           setState(() {
//             _localUserJoined = true;
//           });
//         },
//         onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
//           debugPrint("remote user $remoteUid joined");
//           setState(() {
//             _remoteUid = remoteUid;
//           });
//         },
//         onUserOffline: (RtcConnection connection, int remoteUid,
//             UserOfflineReasonType reason) {
//           debugPrint("remote user $remoteUid left channel");
//           setState(() {
//             _remoteUid = null;
//           });
//         },
//         onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
//           debugPrint(
//               '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
//         },
//       ),
//     );

//     await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
//     await _engine.enableVideo();
//     await _engine.startPreview();

//     await _engine.joinChannel(
//       token: token,
//       channelId: channel,
//       uid: 0,
//       options: const ChannelMediaOptions(),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();

//     _dispose();
//   }

//   Future<void> _dispose() async {
//     await _engine.leaveChannel();
//     await _engine.release();
//   }

//   // Create UI with local view and remote view
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(0),
//         child: AppBar(
//           systemOverlayStyle: SystemUiOverlayStyle(
//             statusBarColor: Colors.black,
//             statusBarIconBrightness: Brightness.light,
//           ),
//         ),
//       ),
//       body: Stack(
//         children: [
//           Center(
//             child: _remoteVideo(),
//           ),
//           Align(
//             alignment: Alignment.topLeft,
//             child: Container(
//               margin: const EdgeInsets.all(20),
//               width: 120,
//               height: 180,
//               decoration: BoxDecoration(
//                 color: Color.fromARGB(69, 255, 255, 255),
//                 border: Border.all(
//                   color: Colors.white,
//                   width: 1,
//                 ),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Center(
//                 child: _localUserJoined
//                     ? AgoraVideoView(
//                         controller: VideoViewController(
//                           rtcEngine: _engine,
//                           canvas: const VideoCanvas(uid: 0),
//                         ),
//                       )
//                     : LoadingAnimationWidget.staggeredDotsWave(
//                         color: color1, size: 55),
//               ),
//             ),
//           ),
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Padding(
//               padding: const EdgeInsets.all(20.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   IconButton(
//                     icon:isLocalVideoMuted?  Icon(Icons.videocam_off, size: 30,color: color1,) :  Icon(Icons.videocam, size: 30,color: color1,),
//                     style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.all(Color.fromARGB(74, 255, 255, 255)),
//                       shadowColor: MaterialStateProperty.all(
//                         Colors.grey,
//                       ),
//                     ),
//                     onPressed: () async {
//                       // Toggle local video stream
//                       await _engine
//                           .muteLocalVideoStream(isLocalVideoMuted);
//                       setState(() {
//                         isLocalVideoMuted = !isLocalVideoMuted;
//                       });
//                     },
//                   ),
//                   IconButton(
//                     icon: const Icon(
//                       Icons.call_end,
//                       color: Colors.redAccent,
//                       size: 35,
//                     ),
//                     style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.all(Color.fromARGB(74, 255, 255, 255)),
//                       shadowColor: MaterialStateProperty.all(
//                         Colors.grey,
//                       ),
//                     ),
//                     onPressed: () async {
//                       // Leave the channel
//                       await _engine.leaveChannel();
//                       Navigator.pop(context);
//                     },
//                   ),
//                   IconButton(
//                     icon: isLocalAudioMuted? Icon(Icons.mic_off, size: 30,color: color1,) :  Icon(Icons.mic, size: 30,color: color1,),
//                     onPressed: () async {
//                       // Toggle local audio stream
//                       await _engine
//                           .muteLocalAudioStream(isLocalAudioMuted);
//                       setState(() {
//                         isLocalAudioMuted = !isLocalAudioMuted;
//                       });
//                     },
//                     style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStateProperty.all(Color.fromARGB(74, 255, 255, 255)),
//                       shadowColor: MaterialStateProperty.all(
//                         Colors.grey,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Display remote user's video
//   Widget _remoteVideo() {
//     if (_remoteUid != null) {
//       return AgoraVideoView(
//         controller: VideoViewController.remote(
//           rtcEngine: _engine,
//           canvas: VideoCanvas(uid: _remoteUid),
//           connection: const RtcConnection(channelId: channel),
//         ),
//       );
//     } else {
//       return Text(
//         'Please wait for remote user to join', style: TextStyle(color: color1),
//         textAlign: TextAlign.center,
//       );
//     }
//   }
// }
