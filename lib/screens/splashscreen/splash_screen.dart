import 'dart:async';

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:socialy_app/constants/Constantcolors.dart';
import 'package:socialy_app/screens/landingscreen/landing_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ConstantColors constantColors = ConstantColors();

  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 1),
        () => Navigator.pushReplacement(
            context,
            PageTransition(
                child: LandingScreen(), type: PageTransitionType.leftToRight)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.darkColor,
      body: Center(
        child: RichText(
          text: TextSpan(
              text: 'Social',
              style: TextStyle(
                fontFamily: 'Poppins',
                color: constantColors.blueColor,
                fontSize: 30,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Y',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    color: constantColors.redColor,
                    fontSize: 34,
                  ),
                )
              ]),
        ),
      ),
    );
  }
}
