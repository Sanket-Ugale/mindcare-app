import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mindcare/const/api_Urls.dart';
import 'package:mindcare/const/colors.dart';
class QuotesPage extends StatefulWidget {
  const QuotesPage({super.key});

  @override
  State<QuotesPage> createState() => QuotesPageState();
}

class QuotesPageState extends State<QuotesPage> {
  List quotes = [];
  bool isQuotesLoading = false;
  
  Future<void> getQuotes() async {
    setState(() {
      isQuotesLoading = true;
    });
    var response = await http.get(
      Uri.parse(domain_url+'/api/quotes/'),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        quotes.add(data);
        isQuotesLoading = false;
      });
      // print(quotes);
      quotes=quotes[0];
    } else {
      print('Request failed with status: ${response.statusCode}.');
      setState(() {
        isQuotesLoading = false;
      });
    }
  }

@override

  void initState() {
    super.initState();
    getQuotes();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: isQuotesLoading
          ? Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                        color: color1, size: 55),
                  
            )
          : quotes.isEmpty
              ? const Center(
                  child: Text('No Quotes Found'),
                )
              : 
      Scrollbar(
        // trackVisibility: true,

        child: PageView.builder(
          
          scrollDirection: Axis.vertical,
          itemCount: quotes.length,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(94, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("\"${quotes[index]["quote"]}\"", style: const TextStyle(fontSize: 15,color: Colors.white),),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("- ${quotes[index]["author"]}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}