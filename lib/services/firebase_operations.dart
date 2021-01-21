import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialy_app/screens/landingscreen/landing_utils.dart';
import 'package:socialy_app/services/authentication.dart';

class FirebaseOperations with ChangeNotifier {
  Future uploadUserAvatar(BuildContext context) async {
    UploadTask imageUploadTask;
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
}
