import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialy_app/constants/Constantcolors.dart';
import 'file:///C:/Users/ivi.berberi/AndroidStudioProjects/socialy_app/lib/screens/altprofile/alt_profile_helper.dart';

class AltProfile extends StatelessWidget {
  final ConstantColors constantColors = ConstantColors();

  final String userUid;

  AltProfile({@required this.userUid});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          Provider.of<AltProfileHelper>(context, listen: false).appBar(context),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: constantColors.blueGreyColor.withOpacity(0.6),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.0),
                topRight: Radius.circular(12.0)),
          ),
          child: StreamBuilder<DocumentSnapshot>(
            stream: FirebaseFirestore.instance
                .collection('users')
                .doc(userUid)
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Provider.of<AltProfileHelper>(context, listen: false)
                        .headerProfile(context, snapshot, userUid),
                    Provider.of<AltProfileHelper>(context, listen: false)
                        .divider(),
                    Provider.of<AltProfileHelper>(context, listen: false)
                        .middleProfile(context, snapshot),
                    Provider.of<AltProfileHelper>(context, listen: false)
                        .footerProfile(context),
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
