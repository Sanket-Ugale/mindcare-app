import 'package:flutter/material.dart';

class userChatContainer extends StatefulWidget {
  var name;
  
  var time;
  
  var message;

  userChatContainer({super.key, required this.name, required this.time, required this.message});

  @override
  State<userChatContainer> createState() => _userChatContainerState();
}

class _userChatContainerState extends State<userChatContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 110, right: 10),
      padding: const EdgeInsets.all(10),
      // height:100,
      width: MediaQuery.of(context).size.width-100,
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 15,
                  backgroundColor: Colors.white54,
                  child: Icon(
                    Icons.person_2_outlined,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(widget.name.toString(),
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
              ],
            ),
          const SizedBox(
            height: 5,
          ),
          Text(
           widget.message.toString(),
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.time.toString(),
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}