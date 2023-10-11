import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mindcare/const/colors.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        shadowColor: const Color.fromARGB(62, 165, 165, 165),
        backgroundColor: Color.fromARGB(210, 38, 38, 38),
        child: ListView(
          children: [
            Stack(
              children: [
                const UserAccountsDrawerHeader(
                  decoration: BoxDecoration(color: Colors.black12),
                  accountName: Text("Sanket Ugale"),
                  accountEmail: Text("sanket.ugale@vpt.edu in"),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/sanket.png"),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 255),
                  decoration: BoxDecoration(
                    boxShadow: [
                        BoxShadow(
                        color: const Color.fromARGB(0, 255, 255, 255).withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 9,
                        spreadRadius: 0,
                      )
                      ],
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(50))),
                  width: 50,
                  child: const CloseButton(
                    color: Colors.white,
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(left: 263, top: 130),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                        color: const Color.fromARGB(0, 255, 255, 255).withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 9,
                        spreadRadius: 0,
                      )
                      ],
                        color: const Color.fromARGB(255, 0, 0, 0),                        
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            bottomLeft: Radius.circular(50),),),
                            
                    width: 40,
                    height: 30,
                    child: const Icon(
                      Icons.logout,
                      color: Colors.white,
                    ))
              ],
            ),
            ListTile(
              title: const Text(
                "Appointment's",
                style: TextStyle(fontSize: 20),
              ),
              leading: Container(
                
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: color1.withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 10,
                        spreadRadius: -3,
                      )
                    ],
                      color: const Color.fromARGB(255, 0, 0, 0),
                      borderRadius: BorderRadius.circular(50)),
                      
                  child: const Icon(Icons.schedule_outlined)),
              textColor: Colors.white,
              iconColor: Colors.white,
              trailing: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: color1.withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 10,
                        spreadRadius: -3,
                      )
                    ]
                    ,
                      color: color2,
                      borderRadius: BorderRadius.circular(50)),
                  child: const Icon(Icons.keyboard_arrow_right)),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Appointments's Clicked")));
              },
            ),
            // Divider(),
            ListTile(
              title: const Text(
                "Chat",
                style: TextStyle(fontSize: 20),
              ),
              leading: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: color1.withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 10,
                        spreadRadius: -3,
                      )
                    ],
                      color: color2,
                      borderRadius: BorderRadius.circular(50)),
                  child: const Icon(Icons.chat_bubble_outline)),
              textColor: Colors.white,
              iconColor: Colors.white,
              trailing: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: color1.withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 10,
                        spreadRadius: -3,
                      )
                    ],
                      color: color2,
                      borderRadius: BorderRadius.circular(50)),
                  child: const Icon(Icons.keyboard_arrow_right)),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Chat Clicked")));
              },
            ),
            ListTile(
              title: const Text(
                "Quiz",
                style: TextStyle(fontSize: 20),
              ),
              leading: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: color1.withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 10,
                        spreadRadius: -3,
                      )
                    ],
                      color: color2,
                      borderRadius: BorderRadius.circular(50)),
                  child: const Icon(Icons.quiz_outlined)),
              textColor: Colors.white,
              iconColor: Colors.white,
              trailing: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: color1.withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 10,
                        spreadRadius: -3,
                      )
                    ],
                      color: color2,
                      borderRadius: BorderRadius.circular(50)),
                  child: const Icon(Icons.keyboard_arrow_right)),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Quiz Clicked")));
              },
            ),
            ListTile(
              title: const Text(
                "Report's",
                style: TextStyle(fontSize: 20),
              ),
              leading: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: color1.withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 10,
                        spreadRadius: -3,
                      )
                    ],
                      color: color2,
                      borderRadius: BorderRadius.circular(50)),
                  child: const Icon(Icons.photo_album_outlined)),
              textColor: Colors.white,
              iconColor: Colors.white,
              trailing: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: color1.withOpacity(1),
                        offset: const Offset(1, 0),
                        blurRadius: 10,
                        spreadRadius: -3,
                      )
                    ],
                      color: color2,
                      borderRadius: BorderRadius.circular(50)),
                  child: const Icon(Icons.keyboard_arrow_right)),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Reports Clicked")));
              },
            ),
            // Divider(),
           ],
        ),
      ),
    );
  }
}
// class MyDrawer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: <Widget>[
//           DrawerHeader(
//             decoration: BoxDecoration(
//               color: Colors.blue,
//             ),
//             child: Text(
//               'Drawer Header',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24,
//               ),
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.home),
//             title: Text('Home'),
//             onTap: () {
//               // Handle the Home menu item tap
//               Navigator.pop(context);
//             },
//           ),
//           ListTile(
//             leading: Icon(Icons.settings),
//             title: Text('Settings'),
//             onTap: () {
//               // Handle the Settings menu item tap
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }