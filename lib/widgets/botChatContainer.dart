import 'package:flutter/material.dart';

class botChatContainer extends StatefulWidget {
  var name;
  
  var time;
  
  var message;

  botChatContainer({super.key, required this.name, required this.time, required this.message});

  @override
  State<botChatContainer> createState() => _botChatContainerState();
}
class _botChatContainerState extends State<botChatContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 10, right: 80),
      padding: const EdgeInsets.all(10),
      // height: 100,
      width: MediaQuery.of(context).size.width-100,
      decoration: BoxDecoration(
        color: Colors.grey[350], // Changed color to light gray
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                backgroundColor: Colors.grey[200], // Changed color to light gray
                child: Icon(
                  Icons.ac_unit_sharp,
                  color: Colors.black, // Changed color to black
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.name.toString(),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Changed color to black
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
              color: Colors.black, // Changed color to black
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            widget.time.toString(),
            style: TextStyle(
              fontSize: 10,
              color: Colors.black, // Changed color to black
            ),
          ),
        ],
      ),
    );
  }
}