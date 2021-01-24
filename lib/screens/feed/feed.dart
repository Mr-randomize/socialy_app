import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialy_app/constants/Constantcolors.dart';
import 'package:socialy_app/screens/feed/feed_helpers.dart';

class Feed extends StatelessWidget {
  final ConstantColors constantColors = ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: Provider.of<FeedHelpers>(context, listen: false).appBar(context),
      body: Provider.of<FeedHelpers>(context, listen: false).feedBody(context),
    );
  }
}
