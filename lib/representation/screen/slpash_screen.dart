import 'package:flutter/material.dart';
import 'package:sohoj_trip_app/global/global.dart';
import 'package:sohoj_trip_app/representation/screen/main_app.dart';
import 'package:sohoj_trip_app/representation/screen/search_tour.dart';
import 'package:sohoj_trip_app/representation/screen/welcome/welcome_screen.dart';
import '../../core/helpers/asset_helper.dart';
import '../../core/helpers/image_helper.dart';
import '../../core/helpers/local_storage_helper.dart';
import 'intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static String routeName = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    _routeToIntroScreen();
  }

  void _routeToIntroScreen() async {
    final ignoreIntro = LocalStorageHelper.getValue('ignoreIntro') as bool?;
    await Future.delayed(Duration(milliseconds: 800));
    if (firebaseAuth.currentUser != null) {
      Navigator.of(context).pushNamed(SearchTourPage.routeName);
    } else {
      if (ignoreIntro ?? false) {
        Navigator.of(context).pushNamed(WelcomeScreen.routeName);
      } else {
        LocalStorageHelper.setValue('ignoreIntro', true);
        Navigator.of(context).pushNamed(IntroScreen.routeName);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // Wrap with Container to set the background color
      color: Colors.white, // Set the background color to white
      child: Stack(
        children: [
          // Positioned.fill(
          //   child: ImageHelper.loadFromAsset(
          //     AssetHelper.backgroundSplash,
          //     fit: BoxFit.fitWidth,
          //   ),
          // ),
          Positioned.fill(
            child: ImageHelper.loadFromAsset(
              AssetHelper.logo,
            ),
          ),
        ],
      ),
    );
  }
}
