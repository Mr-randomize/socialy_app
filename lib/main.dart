import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialy_app/constants/Constantcolors.dart';
import 'package:socialy_app/screens/feed/feed_helpers.dart';
import 'package:socialy_app/screens/homescreen/homepage_helpers.dart';
import 'package:socialy_app/screens/landingscreen/landing_helpers.dart';
import 'package:socialy_app/screens/landingscreen/landing_services.dart';
import 'package:socialy_app/screens/landingscreen/landing_utils.dart';
import 'package:socialy_app/screens/profile/profile_helpers.dart';
import 'package:socialy_app/screens/splashscreen/splash_screen.dart';
import 'package:socialy_app/services/authentication.dart';
import 'package:socialy_app/services/firebase_operations.dart';
import 'package:socialy_app/utils/post_options.dart';
import 'package:socialy_app/utils/upload_post.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ConstantColors constantColors = ConstantColors();
    return MultiProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            accentColor: constantColors.blueColor,
            fontFamily: 'Poppins',
            canvasColor: Colors.transparent,
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: SplashScreen(),
        ),
        providers: [
          ChangeNotifierProvider(create: (_) => LandingHelpers()),
          ChangeNotifierProvider(create: (_) => Authentication()),
          ChangeNotifierProvider(create: (_) => LandingService()),
          ChangeNotifierProvider(create: (_) => FirebaseOperations()),
          ChangeNotifierProvider(create: (_) => LandingUtils()),
          ChangeNotifierProvider(create: (_) => HomepageHelpers()),
          ChangeNotifierProvider(create: (_) => ProfileHelpers()),
          ChangeNotifierProvider(create: (_) => UploadPost()),
          ChangeNotifierProvider(create: (_) => FeedHelpers()),
          ChangeNotifierProvider(create: (_) => PostFunctions()),
        ]);
  }
}
