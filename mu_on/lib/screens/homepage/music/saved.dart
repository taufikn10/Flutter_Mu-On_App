import 'package:flutter/material.dart';
import 'package:mu_on/screens/list.dart';
import 'package:mu_on/theme.dart';

class FavoriteMusic extends StatefulWidget {
  final dynamic lagu;

  const FavoriteMusic({Key? key, required this.lagu}) : super(key: key);

  @override
  State<FavoriteMusic> createState() => _FavoriteMusicState();
}

class _FavoriteMusicState extends State<FavoriteMusic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: appBar(),
      body: getBody(),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: const Text('Favorites Songs'),
      backgroundColor: backgroundColor2,
    );
  }

  Widget getBody() {
    return Scaffold(
      body: ListView.separated(
        itemCount: lagu.length,
        separatorBuilder: (BuildContext context, int index) => const Divider(),
        itemBuilder: (BuildContext context, int index) => ListTile(
          title: Text(lagu[index]['title']),
        ),
      ),
    );
  }
}


// class FavoriteMusic extends StatefulWidget {
//   final dynamic lagu;
//   FavoriteMusic({
//     Key? key,
//     this.lagu,
//   }) : super(key: key);

//   @override
//   _FavoriteMusicState createState() => _FavoriteMusicState();
// }

// class _FavoriteMusicState extends State<FavoriteMusic> {
//   @override
//   Widget build(BuildContext context) {
//     List album = widget.lagu['songs'];
//     return Scaffold(
//       backgroundColor: backgroundColor2,
//       appBar: AppBar(
//         backgroundColor: backgroundColor2,
//         title: Text('Favorites Music'),
//       ),
//       body: Column(
//         children: List.generate(
//           album.length,
//           (index) => Row(
//             children: [
//               Container(
//                 child: Text(
//                   "${index + 1}   " + album[index]['title'],
//                   style: textH4,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//     //   body: ListView.separated(
//     //     itemCount: lagu.length,
//     //     separatorBuilder: (BuildContext context, int index) => const Divider(),
//     //     itemBuilder: (BuildContext context, int index) => ListTile(
//     //       title: Text(
//     //         "${index + 1}   " + lagu[index]['title'],
//     //       ),
//     //     ),
//     //   ),
//     // );
//   }
// }

// class Logic {
//   static Future pushToFavoriteMusic(BuildContext context) {
//     return Navigator.of(context).push(
//       MaterialPageRoute(
//         builder: (BuildContext context) {
//           final tiles = savedMusic.map((event) => ListTile(
//                 title: Text(
//                   lagu[index]['title'],
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
