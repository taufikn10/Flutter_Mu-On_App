import 'package:flutter/material.dart';
import 'package:mu_on/screens/homepage/music/detailalbum.dart';
import 'package:mu_on/screens/list.dart';
import 'package:mu_on/theme.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: getAppBar(),
      body: getBody(),
    );
  }

  PreferredSizeWidget getAppBar() {
    return AppBar(
      toolbarHeight: 120,
      // leading: IconButton(
      //   icon: Icon(Icons.arrow_back, color: Colors.black),
      //   onPressed: () => Navigator.of(context).pop(),
      // ),
      backgroundColor: backgroundColor2,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Padding(
        padding: const EdgeInsets.only(
          left: 25,
          right: 25,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Mu_On",
                  style: textH2,
                ),
                Text(
                  "What you want hear today",
                  style: textS3,
                ),
              ],
            ),
            CircleAvatar(
              radius: 35,
              backgroundImage: AssetImage("assets/images/profile.png"),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xff7E0C08).withOpacity(0.85),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            "New Update",
                            style: textH4,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(lagu.length - 3, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      alignment: Alignment.bottomCenter,
                                      child: DetailAlbum(
                                        lagu: lagu[index],
                                      ),
                                      type: PageTransitionType.scale),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 180,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(lagu[index]['img']),
                                          fit: BoxFit.cover),
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    lagu[index]['title'],
                                    style: textH4,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: 180,
                                    child: Text(
                                      lagu[index]['description'],
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      style: textP4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xff103F70).withOpacity(0.85),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            "Music",
                            style: textH4,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(lagu.length - 5, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      alignment: Alignment.bottomCenter,
                                      child: DetailAlbum(
                                        lagu: lagu[index],
                                      ),
                                      type: PageTransitionType.scale),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 180,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(lagu[index]['img']),
                                          fit: BoxFit.cover),
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    lagu[index]['title'],
                                    style: textH4,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: 180,
                                    child: Text(
                                      lagu[index]['description'],
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      style: textP4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xff103F70).withOpacity(0.85),
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5),
                          child: Text(
                            "Podcast",
                            style: textH4,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(lagu.length - 5, (index) {
                          return Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                      alignment: Alignment.bottomCenter,
                                      child: DetailAlbum(
                                        lagu: lagu[index + 5],
                                      ),
                                      type: PageTransitionType.scale),
                                );
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 180,
                                    height: 180,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              lagu[index + 5]['img']),
                                          fit: BoxFit.cover),
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    lagu[index + 5]['title'],
                                    style: textH4,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: 180,
                                    child: Text(
                                      lagu[index + 5]['description'],
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      style: textP4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
