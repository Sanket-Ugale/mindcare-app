import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:mindcare/screens/error/maintainance.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({Key? key}) : super(key: key);

  @override
  _MusicPageState createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  List music = [
    {
      "title": "Audio 1",
      "description": "",
      "audioUrl": "https://xternz.github.io/test/for-when-it-rains-112785.mp3",
      "image": "https://source.unsplash.com/featured/300x203"
    },
    {
      "title": "Audio 2",
      "description": "",
      "audioUrl": "https://xternz.github.io/test/for-when-it-rains-112785.mp3",
      "image": "https://source.unsplash.com/featured/300x203"
    },
    {
      "title": "Audio 3",
      "description": "",
      "audioUrl": "https://xternz.github.io/test/for-when-it-rains-112785.mp3",
      "image": "https://source.unsplash.com/featured/300x203"
    },
    {
      "title": "Audio 4",
      "description": "",
      "audioUrl": "https://xternz.github.io/test/for-when-it-rains-112785.mp3",
      "image": "https://source.unsplash.com/featured/300x203"
    },
    {
      "title": "Audio 5",
      "description": "",
      "audioUrl": "https://xternz.github.io/test/for-when-it-rains-112785.mp3",
      "image": "https://source.unsplash.com/featured/300x203"
    },
    {
      "title": "Audio 6",
      "description": "",
      "audioUrl": "https://xternz.github.io/test/for-when-it-rains-112785.mp3",
      "image": "https://source.unsplash.com/featured/300x203"
    },
    {
      "title": "Audio 7",
      "description": "",
      "audioUrl": "https://xternz.github.io/test/for-when-it-rains-112785.mp3",
      "image": "https://source.unsplash.com/featured/300x203"
    },
    {
      "title": "Audio 8",
      "description": "",
      "audioUrl": "https://xternz.github.io/test/for-when-it-rains-112785.mp3",
      "image": "https://source.unsplash.com/featured/300x203"
    },
    {
      "title": "Audio 9",
      "description": "",
      "audioUrl": "https://xternz.github.io/test/for-when-it-rains-112785.mp3",
      "image": "https://source.unsplash.com/featured/300x203"
    },
  ];

  late PageController pageController;
  late List<AudioPlayer> audioPlayers;
  List<Duration> totalDurations = [];
  List<Duration> currentPositions = [];
  List<bool> isAudioPlaying = [];
  List imageList = [];
  List<bool> isLiked = [];
  List<bool> isDisliked = [];
  int currentPage = 0;

  void _goToNextPage() {
    if (currentPage < music.length - 1) {
      currentPage++;
      pageController.animateToPage(
        currentPage,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    pageController = PageController();
    audioPlayers = music.map((_) => AudioPlayer()).toList();
    totalDurations = List.filled(music.length, Duration());
    currentPositions = List.filled(music.length, Duration());
    isAudioPlaying = List.filled(music.length, false);
    imageList = List.filled(music.length, imageList);
    isLiked = List.filled(music.length, false);
    isDisliked = List.filled(music.length, false);

    for (int i = 0; i < music.length; i++) {
      audioPlayers[i].setUrl(music[i]["audioUrl"]).then((_) {
        audioPlayers[i].durationStream.listen((duration) {
          setState(() {
            totalDurations[i] = duration ?? Duration();
          });
        });
        audioPlayers[i].positionStream.listen((position) {
          setState(() {
            currentPositions[i] = position;
          });
        });
        audioPlayers[i].processingStateStream.listen((state) {
          if (state == ProcessingState.completed) {
            _goToNextPage();
          }
        });
      });
    }
  }

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
          itemCount: music.length,
          onPageChanged: (index) async {
            await audioPlayers[currentPage].pause();
            setState(() {
              isAudioPlaying[currentPage] = false;
            });
            currentPage = index;
            await audioPlayers[currentPage]
                .setUrl(music[currentPage]["audioUrl"]);
            await audioPlayers[currentPage].play();
            setState(() {
              isAudioPlaying[currentPage] = true;
            });
          },
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Color.fromARGB(94, 255, 255, 255),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image(
                      image: NetworkImage(music[index]["image"]),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    music[index]["title"],
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  Text(
                    music[index]["description"],
                    style: const TextStyle(color: Colors.white),
                  ),
                  Slider(
                    activeColor: Colors.white,
                    inactiveColor: Color.fromARGB(136, 0, 55, 67),
                    value: currentPositions[index].inSeconds.toDouble(),
                    min: 0.0,
                    max: totalDurations[index].inSeconds.toDouble(),
                    onChanged: (value) {
                      audioPlayers[index]
                          .seek(Duration(seconds: value.toInt()));
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${currentPositions[index].toString().split('.').first}',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        '${totalDurations[index].toString().split('.').first}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          isLiked[index]
                              ? Icons.thumb_up
                              : Icons.thumb_up_alt_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            isLiked[index] = !isLiked[index];
                            if (isDisliked[index]) isDisliked[index] = false;
                          });
                        },
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          onPrimary: Color.fromARGB(197, 0, 55, 67),
                        ),
                        child: isAudioPlaying[index]
                            ? const Icon(Icons.pause)
                            : const Icon(Icons.play_arrow),
                        onPressed: () async {
                          setState(() {
                            isAudioPlaying[index] = !isAudioPlaying[index];
                          });
                          if (!isAudioPlaying[index]) {
                            await audioPlayers[index].pause();
                          } else {
                            await audioPlayers[index]
                                .setUrl(music[index]["audioUrl"]);
                            await audioPlayers[index].play();
                          }
                        },
                      ),
                      IconButton(
                        icon: Icon(
                          isDisliked[index]
                              ? Icons.thumb_down
                              : Icons.thumb_down_alt_outlined,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            isDisliked[index] = !isDisliked[index];
                            if (isLiked[index]) isLiked[index] = false;
                          });
                        },
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

  @override
  void dispose() {
    for (var player in audioPlayers) {
      player.dispose();
    }
    pageController.dispose();
    super.dispose();
  }
}
