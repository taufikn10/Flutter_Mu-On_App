import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mu_on/screens/onboarding/components/body.dart';
import 'package:mu_on/theme.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Body(),
    );
  }
}
