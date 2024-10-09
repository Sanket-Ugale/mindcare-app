import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mindcare/community/Stories/StoriesPage.dart';
import 'package:mindcare/community/articles/ArticlesPage.dart';
import 'package:mindcare/community/music/MusicPage.dart';
import 'package:mindcare/community/quotes/QuotesPage.dart';
import 'package:mindcare/const/colors.dart';

class CommunityPage extends StatefulWidget {
  const CommunityPage({Key? key}) : super(key: key);

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final List<Widget> tabPages = [const ArticlesPage(), const MusicPage(), const StoriesPage(), const QuotesPage()];
  final List<String> tabNames = ["Articles", "Music", "Stories", "Quotes"];

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabNames.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(0),
        child: AppBar(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black,
            statusBarIconBrightness: Brightness.light,
          ),
        ),
      ),
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: CircleAvatar(
                        radius: 25,
                        backgroundColor: Colors.white54,
                        child: Icon(
                          Icons.arrow_back,
                          color: color1,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      width: 70,
                    ),
                    ValueListenableBuilder(
                      valueListenable: tabController.animation!,
                      builder: (context, value, child) {
                        return Text(
                          tabNames[tabController.index],
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                  ],
                ),
                TabBar(
                  indicatorColor: color1,
                  labelColor: color1,
                  dividerColor: Colors.transparent,
                  unselectedLabelColor: Colors.white70,
                  controller: tabController,
                  tabs: tabNames.map((name) => Tab(text: name)).toList(),
                ),
                Expanded(
                  child: TabBarView(
                    controller: tabController,
                    children: tabPages,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}