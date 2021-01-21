import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class LandingUtils with ChangeNotifier {
  final picker = ImagePicker();
  File userAvatar;

  File get getUserAvatar => userAvatar;
  String userAvatarUrl;

  String get getUserAvatarUrl => userAvatarUrl;

  Future pickUserAvatar(BuildContext context, ImageSource source) async {
    final pickedUserAvatar = await picker.getImage(source: source);
    pickedUserAvatar == null
        ? print('Select image')
        : userAvatar = File(pickedUserAvatar.path);
    print(userAvatar.path);
  }
}
