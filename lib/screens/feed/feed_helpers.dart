import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialy_app/constants/Constantcolors.dart';
import 'package:socialy_app/utils/upload_post.dart';

class FeedHelpers with ChangeNotifier {
  final ConstantColors constantColors = ConstantColors();

  Widget appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      actions: [
        IconButton(
            icon: Icon(
              Icons.camera_enhance_rounded,
              color: constantColors.greenColor,
            ),
            onPressed: () {
              Provider.of<UploadPost>(context, listen: false)
                  .selectPostImage(context);
            })
      ],
      backgroundColor: constantColors.darkColor.withOpacity(0.6),
      title: RichText(
        text: TextSpan(
            text: 'Social ',
            style: TextStyle(
              color: constantColors.whiteColor,
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
            ),
            children: <TextSpan>[
              TextSpan(
                text: 'Feed',
                style: TextStyle(
                  color: constantColors.whiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              )
            ]),
      ),
    );
  }

  Widget feedBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.9,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: constantColors.darkColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.0),
                topRight: Radius.circular(18.0)),
          ),
        ),
      ),
    );
  }
}
