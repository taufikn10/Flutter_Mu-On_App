import 'package:flutter/material.dart';
import 'package:mu_on/screens/aksesmasuk/route.dart';
import 'package:mu_on/screens/favorite/favorite.dart';
import 'package:mu_on/screens/homepage/homepage.dart';
import 'package:mu_on/screens/search/search.dart';
import 'package:mu_on/screens/settings/settings.dart';
import 'package:mu_on/theme.dart';

class Navbar extends StatefulWidget {
  Navbar({
    Key? key,
    required this.nama,
  }) : super(key: key);
  final String nama;

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int activeNav = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

// NAVIGATION CONTROLLER
  Widget getBody() {
    return IndexedStack(
      index: activeNav,
      children: [
        HomePage(),
        Search(),
        Favorite(),
        Settings(
          nama: nama,
        ),
      ],
    );
  }

// ICON CONTROLLER
  Widget getFooter() {
    List items = [
      Icons.home_filled,
      Icons.search,
      Icons.favorite,
      Icons.settings,
    ];
    return Container(
      height: 85,
      decoration: BoxDecoration(
        color: navColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(25),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 40, right: 40),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: List.generate(items.length, (index) {
            return IconButton(
              icon: Icon(
                items[index],
                color: activeNav == index ? Colors.blue : subtleBlue,
              ),
              onPressed: () {
                setState(() {
                  activeNav = index;
                });
              },
            );
          }),
        ),
      ),
    );
  }
}
