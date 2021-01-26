import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialy_app/screens/landingscreen/landing_utils.dart';
import 'package:socialy_app/services/authentication.dart';

class FirebaseOperations with ChangeNotifier {
  UploadTask imageUploadTask;
  String initUserEmail, initUserName, initUserImage;

  String get getInitUserEmail => initUserEmail;

  String get getInitUserName => initUserName;

  String get getInitUserImage => initUserImage;

  Future uploadUserAvatar(BuildContext context) async {
    final File avatarFile =
        Provider.of<LandingUtils>(context, listen: false).getUserAvatar;
    Reference imageRef = FirebaseStorage.instance
        .ref()
        .child('userProfileAvatar/${avatarFile.path}/${TimeOfDay.now()}');
    imageUploadTask = imageRef.putFile(avatarFile);
    await imageUploadTask.whenComplete(() => print('Image uploaded!'));
    imageRef.getDownloadURL().then((url) {
      Provider.of<LandingUtils>(context, listen: false).userAvatarUrl =
          url.toString();
      print('User profile avatar url => $url');
      notifyListeners();
    });
  }

  Future createUserCollection(BuildContext context, dynamic data) async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(Provider.of<Authentication>(context, listen: false).getUserUid)
        .set(data);
  }

  Future initUserData(BuildContext context) async {
    return FirebaseFirestore.instance
        .collection('users')
        .doc(Provider.of<Authentication>(context, listen: false).getUserUid)
        .get()
        .then((doc) {
      print('Fetching user data');
      initUserName = doc.data()['username'];
      initUserEmail = doc.data()['useremail'];
      initUserImage = doc.data()['userimage'];
      notifyListeners();
    });
  }

  Future uploadPostData(String postId, dynamic data) async {
    return FirebaseFirestore.instance.collection('posts').doc(postId).set(data);
  }

  Future deleteUserData(String userUid) async {
    return FirebaseFirestore.instance.collection('users').doc(userUid).delete();
  }
}
