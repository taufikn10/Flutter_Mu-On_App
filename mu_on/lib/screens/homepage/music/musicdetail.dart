import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:badges/badges.dart';
import 'package:mu_on/screens/favorite/add.dart';
import 'package:mu_on/theme.dart';

class MusicDetail extends StatefulWidget {
  MusicDetail({
    Key? key,
    required this.judul,
    required this.deskripsi,
    required this.img,
    required this.songUrl,
    this.logic,
  }) : super(key: key);
  final String judul;
  final String deskripsi;
  final String img;
  final String songUrl;
  final Logic? logic;

  @override
  _MusicDetailState createState() => _MusicDetailState();
}

class _MusicDetailState extends State<MusicDetail> {
  // lagu
  late AudioPlayer audioPlayer;
  late AudioCache audioCache;
  bool isPlaying = true;
  String durasi = "0";
  Duration slider = new Duration();
  Duration maxSlider = new Duration();
  int item = 0;
  Set savedMusic = Set();
  // final _loop = Set();
  bool isRepeat = true;
  Color color = whiteColor;

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  initPlayer() {
    audioPlayer = new AudioPlayer();
    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        durasi = event.toString();
      });
    });
    audioPlayer.onDurationChanged.listen((event) {
      setState(() {
        slider = event;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((event) {
      setState(() {
        maxSlider = event;
      });
    });
    audioCache = new AudioCache(fixedPlayer: audioPlayer);
    playSound(widget.songUrl);
  }

  playSound(localPath) async {
    await audioCache.play(
      localPath,
      mode: PlayerMode.LOW_LATENCY,
    );
  }

  foward(localPath) {
    audioPlayer.setPlaybackRate(1.5);
  }

  backward(localPath) {
    audioPlayer.setPlaybackRate(0.5);
  }

  // stopSound(localPath) async {
  //   Uri audioFile = await audioCache.load(localPath);
  //   await audioPlayer.setUrl(audioFile.path);
  //   await audioPlayer.stop();
  // }

  stopSound(localPath) async {
    await audioPlayer.stop();
  }

  @override
  void dispose() {
    super.dispose();
    stopSound(widget.songUrl);
  }

  void seekSound(int sec) {
    Duration newPos = Duration(seconds: sec);
    audioPlayer.seek(newPos);
  }

  loopSound(locaPath) async {
    final file = await audioCache.loadAsFile(widget.songUrl);
    final bytes = await file.readAsBytes();
    audioCache.playBytes(bytes, loop: true);
  }

  repeatSound(locaPath) {
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);
  }

  relaseSound(locaPath) {
    audioPlayer.setReleaseMode(ReleaseMode.RELEASE);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: getAppbar(),
      body: getBody(),
    );
  }

  PreferredSizeWidget getAppbar() {
    final alreadySaved = savedMusic.contains(context);
    return AppBar(
      backgroundColor: backgroundColor2,
      elevation: 0,
      toolbarHeight: 80,
      centerTitle: true,
      leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context, null);
          }),
      title: Text(
        "Now Playing",
        style: textH3,
      ),
      actions: [
        Badge(
          child: Container(
            child: IconButton(
              icon: Icon(
                alreadySaved ? Icons.favorite : Icons.favorite_border,
                color: alreadySaved ? Color(0xff4DA9FF) : null,
              ),
              onPressed: () {
                setState(() {
                  if (alreadySaved) {
                    savedMusic.remove(context);
                  } else {
                    savedMusic.add(context);
                  }
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 60, right: 60, top: 30),
                child: Container(
                  width: size.width - 120,
                  height: size.width - 120,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(widget.img),
                      fit: BoxFit.cover,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              width: size.width - 80,
              height: 70,
              child: Column(
                children: [
                  Text(
                    widget.judul,
                    style: textH4,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          widget.deskripsi,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff3BA8EC),
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40, left: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${maxSlider.inMinutes}: ${maxSlider.inSeconds.remainder(60)}",
                  style: textDuration,
                ),
                Text(
                  "${slider.inMinutes}: ${slider.inSeconds.remainder(60)}",
                  style: textDuration,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Slider.adaptive(
                value: maxSlider.inSeconds.toDouble(),
                min: 0,
                max: slider.inSeconds.toDouble(),
                onChanged: (value) {
                  seekSound(value.toInt());
                }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Badge(
                  badgeContent: Text('${savedMusic.length}'),
                  toAnimate: false,
                  position: BadgePosition.topEnd(top: 0, end: 0),
                  child: IconButton(
                    icon: Icon(
                      Icons.list,
                      color: whiteColor,
                      size: 30,
                    ),
                    onPressed: () => pushSaved(),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.skip_previous,
                    color: whiteColor,
                    size: 30,
                  ),
                  onPressed: () {
                    backward(widget.songUrl);
                  },
                ),
                IconButton(
                  iconSize: 50,
                  icon: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: baractiveColor,
                    ),
                    child: Center(
                      child: Icon(
                        isPlaying ? Icons.stop : Icons.play_arrow,
                        color: Color(0xff082A4D),
                        size: 30,
                      ),
                    ),
                  ),
                  onPressed: () {
                    if (isPlaying) {
                      stopSound(widget.songUrl);
                      setState(() {
                        isPlaying = false;
                      });
                    } else {
                      playSound(widget.songUrl);
                      setState(() {
                        isPlaying = true;
                      });
                    }
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.skip_next,
                    color: whiteColor,
                    size: 30,
                  ),
                  onPressed: () {
                    foward(widget.songUrl);
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.repeat,
                    color: color,
                  ),
                  onPressed: () {
                    if (isRepeat == false) {
                      repeatSound(widget.songUrl);
                      setState(() {
                        isRepeat = true;
                        color = Color(0xff4DA9FF);
                      });
                    } else if (isRepeat == true) {
                      relaseSound(widget.songUrl);
                      setState(() {
                        isRepeat = false;
                        color = Colors.white;
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void pushSaved() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          final tiles = savedMusic.map((event) => ListTile(
                title: Text(
                  widget.deskripsi,
                  style: textH4,
                ),
              ));
          final devided = ListTile.divideTiles(
            tiles: tiles,
            context: context,
          ).toList();
          return Scaffold(
            backgroundColor: backgroundColor2,
            appBar: AppBar(
              backgroundColor: backgroundColor2,
              title: Text('Favorite'),
            ),
            body: ListView(
              children: devided,
            ),
          );
        },
      ),
    );
  }
}

// class Logic {
//   static Future pushToFavoriteMusic(BuildContext context) {
//     return Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (BuildContext context) {
//           final tiles = savedMusic.map((event) => ListTile(
//                 title: Text(
//                   Widget.deskripsi,
//                   style: textH4,
//                 ),
//               ));
//           final devided = ListTile.divideTiles(
//             tiles: tiles,
//             context: context,
//           ).toList();
//           return Scaffold(
//             backgroundColor: backgroundColor2,
//             appBar: AppBar(
//               backgroundColor: backgroundColor2,
//               title: Text('Favorite'),
//             ),
//             body: ListView(
//               children: devided,
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// class Logic {
//   static Future pushToFavoriteMusic(BuildContext context) {
//     return Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (BuildContext context) => FavoriteMusic(
//           lagu: savedMusic,
//         ),
//       ),
//     );
//   }
// }
