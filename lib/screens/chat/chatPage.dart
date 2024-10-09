import 'package:flutter/material.dart';
import 'package:mindcare/const/api_Urls.dart';
import 'package:mindcare/const/colors.dart';
import 'package:mindcare/widgets/botChatContainer.dart';
import 'package:mindcare/widgets/userChatContainer.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

String formatDateTime(String dateTime) {
  DateTime parsedDateTime = DateTime.parse(dateTime).toUtc();
  final ist = tz.getLocation('Asia/Kolkata');
  final istDateTime = tz.TZDateTime.from(parsedDateTime, ist);
  return DateFormat('dd/MM/yy hh:mm a').format(istDateTime); // 'dd/MM/yy hh:mm a' for Date in DD/MM/YY and Time in Hour:Minute AM/PM format
}
class chatPage extends StatefulWidget {
  chatPage({super.key});

  @override
  State<chatPage> createState() => _chatPageState();
}

class _chatPageState extends State<chatPage> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoading = false;
  bool _isAllChatLoading = false;
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> chatMessages = [];

  Future<void> sendMessage(String message) async {
    if (message.isEmpty) {
      return;
    }

    setState(() {
      _isLoading = true;
    });

    final response = await http.post(
      Uri.parse(domain_url+'/api/chats/'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'message': message,
        'user_profile_id': 1,
      }),
    );

    if (response.statusCode == 201) {
      await getMessages();
    } else {
      throw Exception('Failed to send message.');
    }

    _controller.clear();

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> getMessages() async {
    // setState(() {
    //   _isAllChatLoading=true;
    // });
    final response = await http
        .get(Uri.parse(domain_url+'/api/chats/'));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      chatMessages = [];
      for (var item in data) {
        chatMessages.add({
          'sender': 'You',
          'message': item['message'],
          'time': item['date'],
          'isBot': false,
        });
        chatMessages.add({
          'sender': 'MindCare',
          'message': item['response'],
          'time': item['date'],
          'isBot': true,
        });
      }
      setState(() {});
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 1000),
          curve: Curves.easeOut,
          
        );
        // setState(() {
        //   _isAllChatLoading=false;
        // });
      });
    } else {
      throw Exception('Failed to load chat messages.');
    }
  }

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    getMessages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: SafeArea(
            child: Container(
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
              child: _isAllChatLoading?Center(child: CircularProgressIndicator(color: color1,))
              :Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white54,
                      child: Icon(
                        Icons.arrow_back,
                        color: color2,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: chatMessages.length * 2,
                      itemBuilder: (context, index) {
                        final messageIndex = index ~/ 2;
                        final chatMessage = chatMessages[messageIndex];
                        if (index.isEven) {
                          return chatMessage['isBot']
                              ? botChatContainer(
                                  name: chatMessage['sender'],
                                  message: chatMessage['message'],
                                  time: formatDateTime(chatMessage['time']),
                                )
                              : userChatContainer(
                                  name: chatMessage['sender'],
                                  message: chatMessage['message'],
                                  time: formatDateTime(chatMessage['time']),
                                );
                        } else {
                          return chatMessage['isBot']
                              ? Container()
                              : Container();
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      child: TextFormField(
                        controller: _controller,
                        decoration: InputDecoration(
                          fillColor: lightTextColor3,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50),
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Type a message",
                          hintStyle: const TextStyle(
                            color: Colors.black,
                          ),
                          suffixIcon: IconButton(
                            icon: _isLoading
                                ? CircularProgressIndicator(
                                    color: color1,
                                  )
                                : Icon(
                                    Icons.send,
                                    color: color2,
                                  ),
                            onPressed: _isLoading
                                ? null
                                : () => sendMessage(_controller.text),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
