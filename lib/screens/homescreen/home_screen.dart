import 'package:flutter/material.dart';
import 'package:socialy_app/constants/Constantcolors.dart';

class HomeScreen extends StatelessWidget {
  final ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.whiteColor,
    );
  }
}
