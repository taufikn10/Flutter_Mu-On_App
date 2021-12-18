import 'package:flutter/material.dart';
import 'package:mu_on/screens/onboarding/onboarding_screen.dart';
import 'screens/aksesmasuk/route.dart';

void main() {
  runApp(const MuOn());
}

class MuOn extends StatelessWidget {
  const MuOn({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mu - ON',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
      ),
      // NAVIGASI
      home: const OnboardingScreen(),
      routes: {
        'Login': (context) => Login(),
        'Register': (context) => Register(),
      },
    );
  }
}
