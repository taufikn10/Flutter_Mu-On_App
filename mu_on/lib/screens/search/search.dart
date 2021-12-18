import 'package:flutter/material.dart';
import 'package:mu_on/screens/homepage/music/detailalbum.dart';
import 'package:mu_on/screens/list.dart';
import 'package:mu_on/theme.dart';
import 'package:page_transition/page_transition.dart';

class Search extends StatefulWidget {
  Search({Key? key, this.cariLagu}) : super(key: key);
  final dynamic cariLagu;

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  List cariLagu = [];
  @override
  initState() {
    cariLagu = lagu;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      results = lagu;
    } else {
      results = lagu
          .where((artis) => artis["title"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      cariLagu = results;
    });
  }

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
      elevation: 0,
      backgroundColor: backgroundColor2,
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Search'),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: TextField(
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                  icon: Icon(Icons.search, color: navColor),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none,
                  hintText: 'Search here',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget getBody() {
    return Scaffold(
      backgroundColor: backgroundColor2,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 20, left: 20),
          child: Center(
            child: Expanded(
              child: cariLagu.isNotEmpty
                  ? ListView.builder(
                      itemCount: cariLagu.length,
                      itemBuilder: (context, index) => Card(
                        color: Color(0xff103F70),
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                  alignment: Alignment.bottomCenter,
                                  child: DetailAlbum(
                                    lagu: cariLagu[index],
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
                                cariLagu[index]['img'],
                                fit: BoxFit.cover,
                              ),
                            ),
                            title: Text(
                              cariLagu[index]['title'],
                              style: textH4,
                            ),
                            subtitle: Text(
                              cariLagu[index]['description'],
                              style: textP4,
                            ),
                          ),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xffFFFFFFF),
                      ),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
