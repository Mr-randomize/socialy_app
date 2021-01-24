import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialy_app/constants/Constantcolors.dart';
import 'package:socialy_app/screens/profile/profile_helpers.dart';
import 'package:socialy_app/services/authentication.dart';

class Profile extends StatelessWidget {
  final ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            icon: Icon(
              EvaIcons.settings2Outline,
              color: constantColors.lightBlueColor,
            ),
            onPressed: () {}),
        actions: [
          IconButton(
              icon: Icon(
                EvaIcons.logOutOutline,
                color: constantColors.greenColor,
              ),
              onPressed: () {
                Provider.of<ProfileHelpers>(context, listen: false)
                    .logoutDialog(context);
              })
        ],
        backgroundColor: constantColors.blueGreyColor.withOpacity(0.4),
        title: RichText(
          text: TextSpan(
              text: 'My ',
              style: TextStyle(
                color: constantColors.whiteColor,
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Profile',
                  style: TextStyle(
                    color: constantColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                )
              ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: StreamBuilder<DocumentSnapshot>(
                stream: FirebaseFirestore.instance
                    .collection('users')
                    .doc(Provider.of<Authentication>(context, listen: false)
                        .getUserUid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return Column(
                      children: [
                        Provider.of<ProfileHelpers>(context, listen: false)
                            .headerProfile(context, snapshot.data),
                        Provider.of<ProfileHelpers>(context, listen: false)
                            .divider(),
                        Provider.of<ProfileHelpers>(context, listen: false)
                            .middleProfile(context, snapshot.data),
                        Provider.of<ProfileHelpers>(context, listen: false)
                            .footerProfile(context, snapshot.data),
                      ],
                    );
                  }
                }),
            decoration: BoxDecoration(
                color: constantColors.blueGreyColor.withOpacity(0.6),
                borderRadius: BorderRadius.circular(15.0)),
          ),
        ),
      ),
    );
  }
}
