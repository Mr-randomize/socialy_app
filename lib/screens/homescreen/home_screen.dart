import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialy_app/constants/Constantcolors.dart';
import 'package:socialy_app/screens/chatroom/chatroom.dart';
import 'package:socialy_app/screens/feed/feed.dart';
import 'package:socialy_app/screens/homescreen/homepage_helpers.dart';
import 'package:socialy_app/screens/profile/profile.dart';
import 'package:socialy_app/services/firebase_operations.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ConstantColors constantColors = ConstantColors();
  final PageController homepageController = PageController();
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    Provider.of<FirebaseOperations>(context, listen: false)
        .initUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.darkColor,
      body: PageView(
        controller: homepageController,
        children: [
          Feed(),
          ChatRoom(),
          Profile(),
        ],
        physics: NeverScrollableScrollPhysics(),
        onPageChanged: (page) {
          setState(() {
            pageIndex = page;
          });
        },
      ),
      bottomNavigationBar: Provider.of<HomepageHelpers>(context, listen: false)
          .bottomNavBar(context, pageIndex, homepageController),
    );
  }
}
