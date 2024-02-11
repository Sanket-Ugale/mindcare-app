import 'dart:math';

import 'package:flutter/material.dart';
import 'package:emoji_rating_bar/emoji_rating_bar.dart';
import 'package:mindcare/const/colors.dart';

class quizRadioButton extends StatefulWidget {
  var questions;

  var questionsNum;

  var result;

  quizRadioButton(
      {super.key,
      required this.questions,
      required this.questionsNum,
      required this.result, required Null Function(dynamic result) onResultChange});

  @override
  State<quizRadioButton> createState() => _quizRadioButtonState();
}

class _quizRadioButtonState extends State<quizRadioButton> {
  Color radioButtonSelectColor = Color.fromARGB(255, 0, 255, 26);
  int? _groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
          decoration: BoxDecoration(
            color: lightTextColor3,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          widget.questionsNum.toString() +
                              ". " +
                              widget.questions.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  EmojiRatingBar(
                    rating: 3,
                    onRateChange: (rating) {
                      WidgetsBinding.instance!.addPostFrameCallback((_) {
                        setState(() {
                          widget.result = rating;
                        });
                      });
                      print(rating);
                    },
                    isReadOnly: false,
                    spacing: 10,
                    size: 40,
                    selectedSize: 45,
                    isShowTitle: true,
                    // isShowDivider: true,
                    titleStyle: TextStyle(
                      color: Colors.white70,
                      fontSize: 8,
                    ),
                    selectedTitleStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 8,
                    ),
                    animationDuration: Duration(milliseconds: 300),
                    animationCurve: Curves.easeInOut,
                    ratingBarType: RatingBarType.mood,
                    applyColorFilter: true,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
