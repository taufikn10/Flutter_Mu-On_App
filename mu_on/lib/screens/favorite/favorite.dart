import 'package:flutter/material.dart';
import 'package:mu_on/screens/favorite/add.dart';
import 'package:mu_on/theme.dart';

class Favorite extends StatefulWidget {
  Favorite({Key? key}) : super(key: key);

  @override
  _FavoriteState createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {
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
                  "Your Favorite",
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

  getBody() {
    return Scaffold(
      backgroundColor: backgroundColor2,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Center(
            child: Expanded(
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) => Card(
                  color: backgroundColor2,
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Logic.pushToFavoriteWordsRoute(context);
                        },
                        child: ListTile(
                          leading: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 44,
                              minHeight: 44,
                              maxWidth: 64,
                              maxHeight: 64,
                            ),
                            child: Container(
                              color: Color(0xff2493F2),
                              child: Icon(
                                Icons.music_note,
                                color: whiteColor,
                              ),
                            ),
                          ),
                          title: Text(
                            'Favorite Artist',
                            style: textH4,
                          ),
                          subtitle: Text(
                            'Playlist',
                            style: textP4,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     Logic.pushToFavoriteWordsRoute(context);
                      //   },
                      //   child: ListTile(
                      //     leading: ConstrainedBox(
                      //       constraints: BoxConstraints(
                      //         minWidth: 44,
                      //         minHeight: 44,
                      //         maxWidth: 64,
                      //         maxHeight: 64,
                      //       ),
                      //       child: Container(
                      //         color: Color(0xff6E5DE7),
                      //         child: Icon(
                      //           Icons.podcasts,
                      //           color: whiteColor,
                      //         ),
                      //       ),
                      //     ),
                      //     title: Text(
                      //       'Favorite Podcasts',
                      //       style: textH4,
                      //     ),
                      //     subtitle: Text(
                      //       'Playlist',
                      //       style: textP4,
                      //     ),
                      //   ),
                      // ),
                      SizedBox(
                        height: 250,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Artis()),
                          );
                        },
                        child: ListTile(
                          leading: ConstrainedBox(
                            constraints: BoxConstraints(
                              minWidth: 44,
                              minHeight: 44,
                              maxWidth: 64,
                              maxHeight: 64,
                            ),
                            child: Container(
                              color: whiteColor,
                              child: Icon(
                                Icons.add,
                                color: Color(0xff2493F2),
                              ),
                            ),
                          ),
                          title: Text(
                            'Add Favorite Artist',
                            style: textH4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
