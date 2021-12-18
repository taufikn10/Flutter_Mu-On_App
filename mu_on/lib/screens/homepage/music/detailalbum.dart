import 'package:flutter/material.dart';
import 'package:mu_on/screens/homepage/music/musicdetail.dart';
import 'package:mu_on/theme.dart';
import 'package:page_transition/page_transition.dart';

class DetailAlbum extends StatefulWidget {
  final dynamic lagu;
  DetailAlbum({Key? key, this.lagu}) : super(key: key);

  @override
  _DetailAlbumState createState() => _DetailAlbumState();
}

class _DetailAlbumState extends State<DetailAlbum> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor2,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    List album = widget.lagu['songs'];
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              Container(
                width: size.width,
                height: 220,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.lagu['img']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xff08335B).withOpacity(0.85),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    children: [
                      Text(
                        widget.lagu['title'],
                        style: textH3,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: List.generate(
                    album.length,
                    (index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 30,
                          right: 30,
                          bottom: 30,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              PageTransition(
                                  alignment: Alignment.bottomCenter,
                                  child: MusicDetail(
                                    judul: widget.lagu['title'],
                                    deskripsi: album[index]['title'],
                                    img: widget.lagu['img'],
                                    songUrl: album[index]['song_url'],
                                  ),
                                  type: PageTransitionType.scale),
                            );
                          },
                          child: Row(
                            children: [
                              Container(
                                width: (size.width - 60) * 0.8,
                                child: Text(
                                  "${index + 1}   " + album[index]['title'],
                                  style: textH4,
                                ),
                              ),
                              Container(
                                width: (size.width - 60) * 0.23,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      album[index]['duration'],
                                      style: textP4,
                                    ),
                                    Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: baractiveColor,
                                      ),
                                      child: Center(
                                        child: Icon(
                                          Icons.play_arrow,
                                          color: Color(0xff082A4D),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xffBFBFBF).withOpacity(0.85),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: whiteColor)),
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: whiteColor,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
