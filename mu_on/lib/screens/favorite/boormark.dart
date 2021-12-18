import 'package:flutter/material.dart';
import 'package:mu_on/theme.dart';

class FavoriteWordsRoute extends StatelessWidget {
  final dynamic lagu;

  const FavoriteWordsRoute({Key? key, required this.lagu}) : super(key: key);
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
      backgroundColor: backgroundColor2,
      title: const Text('Favorites Artist'),
    );
  }

  Widget getBody() {
    return Scaffold(
      backgroundColor: backgroundColor2,
      body: SafeArea(
        child: ListView.separated(
            itemCount: lagu.length,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                // onTap: () {
                //   Navigator.push(
                //     context,
                //     PageTransition(
                //         alignment: Alignment.bottomCenter,
                //         child: DetailAlbum(
                //           lagu: lagu[index],
                //         ),
                //         type: PageTransitionType.scale),
                //   );
                // },
                child: ListTile(
                  title: Text(
                    "${index + 1}   " + lagu[index],
                    style: textH4,
                  ),
                ),
              );
            }),
      ),
    );
  }
}
