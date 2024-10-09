import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mindcare/const/api_Urls.dart';
import 'package:mindcare/const/colors.dart';

class ArticlesPage extends StatefulWidget {
  const ArticlesPage({super.key});

  @override
  State<ArticlesPage> createState() => ArticlesPageState();
}

class ArticlesPageState extends State<ArticlesPage> {
  List articles =[];
  bool isArticlesLoading = false;

  Future getArticles() async {
    setState(() {
      isArticlesLoading = true;
    });
    var response = await http.get(
      Uri.parse(domain_url+'/api/articles/'),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        articles.add(data);
      });
      articles = articles[0];
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    print(articles);
    setState(() {
      isArticlesLoading = false;
    });
  }
  
  final PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    getArticles();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: isArticlesLoading
          ? Center(
              child: LoadingAnimationWidget.fourRotatingDots(
                        color: color1, size: 55),
                  
            )
          : articles.isEmpty
              ? const Center(
                  child: Text('No Articles Found', style: TextStyle(color: Colors.white), ),
                )
              : Scrollbar(
        child: PageView.builder(
          controller: pageController,
          scrollDirection: Axis.vertical,
          itemCount: articles.length,
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
                        child: Image.network(domain_url+articles[index]["image"]!),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        articles[index]["title"]!,
                        style: const TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        articles[index]["description"]!,
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