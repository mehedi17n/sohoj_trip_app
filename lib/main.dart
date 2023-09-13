import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:sohoj_trip_app/representation/screen/signup/authentication_repository.dart';
import 'package:sohoj_trip_app/representation/screen/slpash_screen.dart';
import 'package:sohoj_trip_app/representation/widgets/theme/theme.dart';
import 'package:sohoj_trip_app/routes.dart';
import 'core/helpers/local_storage_helper.dart';
import 'core/helpers/size_config.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await LocalStorageHelper.initLocalStorageHelper();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Firebase.initializeApp().then((value) => Get.put(AuthenticationRepository()));

  runApp(const SohojTrip());
}

class SohojTrip extends StatelessWidget {
  const SohojTrip({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'SohojTrip',
      themeMode: ThemeMode.system,
      theme: TAppTheme.lightTheme,
      darkTheme: TAppTheme.darkTheme,
      // theme: ThemeData(
      //   primaryColor: ColorPalette.primaryColor,
      //   scaffoldBackgroundColor: ColorPalette.backgroundScaffoldColor,
      //   backgroundColor: ColorPalette.backgroundScaffoldColor,
      // ),
      routes: routes,
      debugShowCheckedModeBanner: false,
      onGenerateRoute: generateRoutes,
      home: Builder(
        builder: (context) {
          SizeConfig.init(context);
          return SplashScreen();
        },
      ),
    );
  }
}
