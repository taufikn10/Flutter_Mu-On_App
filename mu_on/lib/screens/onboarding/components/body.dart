import 'package:flutter/material.dart';
import 'package:mu_on/screens/portal/portal.dart';
import 'package:mu_on/theme.dart';

class Body extends StatefulWidget {
  Body({Key? key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int halamanAwal = 0;
  var onboardData = [
    {
      "judul": "Easy Access to Listening Music",
      "text": "MU-ON is now available for",
      "text2": "your phone",
      "image": "assets/images/onboard1.png"
    },
    {
      "judul": "Enjoy Everyday",
      "text": "With MU-ON you can listen",
      "text2": "music & Podcast free everyday",
      "image": "assets/images/onboard2.png"
    },
    {
      "judul": "Make The Most Of Your Day",
      "text": "Let's Get Started and enjoy",
      "text2": "play music  & Podcast with MU-ON",
      "image": "assets/images/onboard3.png"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 7,
                child: PageView.builder(
                  onPageChanged: (value) {
                    setState(() {
                      halamanAwal = value;
                    });
                  },
                  itemCount: onboardData.length,
                  itemBuilder: (context, index) => OnboardContent(
                    image: onboardData[index]["image"]!,
                    judul: onboardData[index]["judul"]!,
                    text: onboardData[index]["text"]!,
                    text2: onboardData[index]["text2"]!,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onboardData.length,
                        (index) => barData(index: index),
                      ),
                    ),
                    Spacer(),
                    // ignore: deprecated_member_use
                    RaisedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Portal(),
                          ),
                        );
                      },
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      padding: const EdgeInsets.all(0.0),
                      child: Ink(
                        decoration: const BoxDecoration(
                          gradient: baractiveColor,
                          borderRadius: BorderRadius.all(Radius.circular(15.0)),
                        ),
                        child: Container(
                          constraints: const BoxConstraints(
                              maxWidth: 200.0,
                              maxHeight:
                                  45.0), // min sizes for Material buttons
                          alignment: Alignment.center,
                          child: Text(
                            'Get Started',
                            style: textH3,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                    Spacer(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer barData({required int index}) {
    return AnimatedContainer(
      duration: durasiAnimasi,
      margin: EdgeInsets.only(right: 5),
      height: 10,
      width: halamanAwal == index ? 30 : 10,
      decoration: BoxDecoration(
        gradient: halamanAwal == index
            ? baractiveColor
            : LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xffF8F8F8), Color(0xff4F4F4F)],
              ),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    Key? key,
    required this.judul,
    required this.text,
    required this.text2,
    required this.image,
  }) : super(key: key);
  final String judul, text, text2, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Spacer(),
        Text(
          "Mu-On",
          style: textH1,
        ),
        Spacer(
          flex: 2,
        ),
        Image.asset(
          image,
          height: 276,
          width: 276,
        ),
        Spacer(),
        SizedBox(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              gradient: introColor,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(40),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  judul,
                  style: textH3,
                ),
                const SizedBox(
                  height: 35,
                ),
                Text(
                  text,
                  style: textP4,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  text2,
                  style: textP4,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
