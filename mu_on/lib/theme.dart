import 'package:flutter/material.dart';

// Color Style
Color backgroundColor = const Color(0xff09345D);
Color backgroundColor2 = const Color(0xff062A4F);
Color navColor = const Color(0xff08335B);
Color deskripsiColor = const Color(0xffBFBFBF);
Color subtleBlue = const Color(0xffCCDAFC);
Color whiteColor = const Color(0xffFFFFFF);
Color inputColor = const Color(0xff404040);

// Gradient Color Style
const introColor = LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color(0xff0C4378), Color(0xff09345D)],
);

const baractiveColor = const LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [Color(0xff2493F2), Color(0xff2D51C2)],
);

const barColor = const LinearGradient(
  begin: Alignment.centerLeft,
  end: Alignment.centerRight,
  colors: [Color(0xffF8F8F8), Color(0xff4F4F4F)],
);

const gradientBlueColor = const LinearGradient(
  begin: Alignment.topCenter,
  end: Alignment.bottomCenter,
  colors: [Color(0xff0C4378), Color(0xff09345D)],
);

// Text Style
TextStyle textH1 = TextStyle(
  fontFamily: 'Poppins',
  color: whiteColor,
  fontWeight: FontWeight.w500,
  fontSize: 30,
);

TextStyle textH2 = TextStyle(
  fontFamily: 'Poppins',
  color: whiteColor,
  fontWeight: FontWeight.w500,
  fontSize: 24,
);

TextStyle textH3 = TextStyle(
  fontFamily: 'Poppins',
  color: whiteColor,
  fontWeight: FontWeight.w500,
  fontSize: 18,
);

TextStyle textH4 = TextStyle(
  fontFamily: 'Poppins',
  color: whiteColor,
  fontWeight: FontWeight.w500,
  fontSize: 16,
);

TextStyle textDuration = TextStyle(
  fontFamily: 'Poppins',
  color: deskripsiColor,
  fontWeight: FontWeight.w500,
  fontSize: 12,
);

TextStyle textP4 = TextStyle(
  fontFamily: 'Poppins',
  color: deskripsiColor,
  fontWeight: FontWeight.w400,
  fontSize: 12,
);

TextStyle textS1 = TextStyle(
  fontFamily: 'Poppins',
  color: deskripsiColor,
  fontWeight: FontWeight.w400,
  fontSize: 16,
);

TextStyle textS3 = TextStyle(
  fontFamily: 'Poppins',
  color: deskripsiColor,
  fontWeight: FontWeight.w400,
  fontSize: 12,
);

TextStyle textTitleInput = TextStyle(
  fontFamily: 'Poppins',
  color: whiteColor,
  fontWeight: FontWeight.w500,
  fontSize: 14,
);

TextStyle textforgot = TextStyle(
  fontFamily: 'Poppins',
  color: whiteColor,
  fontWeight: FontWeight.w400,
  fontSize: 14,
);

TextStyle textInput = TextStyle(
  fontFamily: 'Poppins',
  color: inputColor,
  fontWeight: FontWeight.w400,
  fontSize: 14,
);

TextStyle textDisablestyle = TextStyle(
  fontFamily: 'Poppins',
  color: deskripsiColor,
  fontWeight: FontWeight.w400,
  fontSize: 14,
);
// End Text Style

// Animation
const durasiAnimasi = Duration(milliseconds: 200);
