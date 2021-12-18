import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:mu_on/screens/favorite/boormark.dart';
import 'package:mu_on/screens/homepage/music/detailalbum.dart';
import 'package:mu_on/screens/list.dart';
import 'package:mu_on/theme.dart';
import 'package:page_transition/page_transition.dart';

List<String> savedWords = <String>[];

class Logic {
  static Future pushToFavoriteWordsRoute(BuildContext context) {
    return Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => FavoriteWordsRoute(
          lagu: savedWords,
        ),
      ),
    );
  }
}

class Artis extends StatefulWidget {
  const Artis({Key? key, this.logic}) : super(key: key);
  final Logic? logic;
  @override
  State<Artis> createState() => _ArtisState();
}

class _ArtisState extends State<Artis> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: AppBar(
        backgroundColor: backgroundColor2,
        title: const Text('Add Favorite Artist'),
        actions: <Widget>[
          Badge(
            badgeContent: Text('${savedWords.length}'),
            toAnimate: false,
            position: BadgePosition.topEnd(top: 0, end: 0),
            child: IconButton(
              icon: const Icon(Icons.bookmark),
              onPressed: () => Logic.pushToFavoriteWordsRoute(context),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: lagu.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) {
          dynamic word = lagu[index]['title'];
          bool isSaved = savedWords.contains(word);

          return GestureDetector(
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
            child: ListTile(
              leading: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: 44,
                  minHeight: 44,
                  maxWidth: 64,
                  maxHeight: 64,
                ),
                child: Image.asset(
                  lagu[index]['img'],
                  fit: BoxFit.cover,
                ),
              ),
              title: Text(
                word,
                style: textH4,
              ),
              subtitle: Text(
                lagu[index]['description'],
                style: textP4,
              ),
              trailing: Icon(
                isSaved ? Icons.favorite : Icons.favorite_border,
                color: isSaved ? Colors.red : whiteColor,
              ),
              onTap: () {
                setState(() {
                  if (isSaved) {
                    savedWords.remove(word);
                  } else {
                    savedWords.add(word);
                  }
                });
              },
            ),
          );
        },
      ),
    );
  }
}
