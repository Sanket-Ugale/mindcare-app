import 'package:flutter/material.dart';

class StoriesPage extends StatefulWidget {
  const StoriesPage({super.key});

  @override
  State<StoriesPage> createState() => StoriesPageState();
}

class StoriesPageState extends State<StoriesPage> {
  List stories = [
    {
      "title": "Story Title 1",
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
      "image": "https://source.unsplash.com/featured/300x203",
    },
    {
      "title": "Story Title 2",
      "description": "Story Description",
      "image": "https://source.unsplash.com/featured/300x203",
    },
    {
      "title": "Story Title 3",
      "description": "Story Description",
      "image": "https://source.unsplash.com/featured/300x203",
    },
    {
      "title": "Story Title 4",
      "description": "Story Description",
      "image": "https://source.unsplash.com/featured/300x203",
    },
    {
      "title": "Story Title 5",
      "description": "Story Description",
      "image": "https://source.unsplash.com/featured/300x203",
    },
    {
      "title": "Story Title",
      "description": "Story Description",
      "image": "https://source.unsplash.com/featured/300x203",
    },
    {
      "title": "Story Title",
      "description": "Story Description",
      "image": "https://source.unsplash.com/featured/300x203",
    },
    {
      "title": "Story Title",
      "description": "Story Description",
      "image": "https://source.unsplash.com/featured/300x203",
    },
    {
      "title": "Story Title",
      "description": "Story Description",
      "image": "https://source.unsplash.com/featured/300x203",
    },
    {
      "title": "Story Title",
      "description": "Story Description",
      "image": "https://source.unsplash.com/featured/300x203",
    }
  ];
  
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
      ),
      child: Scrollbar(
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
                        child: Image.network(stories[index]["image"]),
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