import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mindcare/const/api_Urls.dart';
import 'package:mindcare/const/colors.dart';
import 'package:http/http.dart' as http;


class StoriesPage extends StatefulWidget {
  const StoriesPage({super.key});

  @override
  State<StoriesPage> createState() => StoriesPageState();
}

class StoriesPageState extends State<StoriesPage> {
  List stories = [];
  bool isStoriesLoading = false;
  
  // get http => null;

  Future<void> getStories() async {
    setState(() {
      isStoriesLoading = true;
    });
    var response = await http.get(
      Uri.parse(domain_url+'/api/storie/'),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        stories.add(data);
      });
      stories = stories[0];
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    print(stories);
    setState(() {
      isStoriesLoading = false;
    });
  }
  
  final PageController pageController = PageController();

  void initState() {
    super.initState();
    getStories();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: isStoriesLoading
          ? Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                        color: color1, size: 55),
                  
            )
          : stories.isEmpty
              ? const Center(
                  child: Text('No Quotes Found', style: TextStyle(color: Colors.white), ),
                )
              : Scrollbar(
        child: PageView.builder(
          controller: pageController,
          scrollDirection: Axis.vertical,
          itemCount: stories.length,
          itemBuilder: (context, index) {
            return NotificationListener<ScrollNotification>(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollEndNotification) {
                  final metrics = scrollNotification.metrics;
                  if (metrics.atEdge && metrics.pixels != 0) {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.ease,
                    );
                  }
                }
                return true;
              },
              child: Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(94, 255, 255, 255),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(domain_url+stories[index]["image"]),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        stories[index]["title"],
                        style: const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        stories[index]["description"],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}