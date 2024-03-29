import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sohoj_trip_app/core/constants/color_palatte.dart';
import 'package:sohoj_trip_app/core/constants/dimension_constants.dart';
import 'package:sohoj_trip_app/core/constants/text_strings.dart';
import 'package:sohoj_trip_app/core/helpers/asset_helper.dart';
import 'package:sohoj_trip_app/data/model/use_model.dart';
import 'package:sohoj_trip_app/representation/screen/login/login_screen.dart';
import 'package:sohoj_trip_app/representation/screen/profile/profile_controller.dart';
import 'package:sohoj_trip_app/representation/screen/profile/profile_menu.dart';
import 'package:sohoj_trip_app/representation/screen/profile/update_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<ProfileScreen> createState() => _ProfileScreen();
}

class _ProfileScreen extends State<ProfileScreen> {
  void _logout() async {
    // Add your logout logic here, e.g., Firebase sign out
    // For example, if you're using FirebaseAuth:
    await FirebaseAuth.instance.signOut().then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (c) => const LoginScreen()));
    });
  }

  final controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title:
            Text("Profile", style: Theme.of(context).textTheme.headlineSmall),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(isDark ? LineAwesomeIcons.sun : LineAwesomeIcons.moon))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: FutureBuilder(
              future: controller.getUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    UserModel userData = snapshot.data as UserModel;
                    return Column(
                      children: [
                        /// -- IMAGE
                        Stack(
                          children: [
                            SizedBox(
                              width: 120,
                              height: 120,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: const Image(
                                      image: AssetImage(tProfileImage))),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: tPrimaryColor),
                                child: const Icon(
                                  LineAwesomeIcons.alternate_pencil,
                                  color: Colors.white,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(userData.name,
                            style: Theme.of(context).textTheme.headlineSmall),
                        Text(userData.email,
                            style: Theme.of(context).textTheme.bodySmall),
                        const SizedBox(height: 20),

                        /// -- BUTTON
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () =>
                                Get.to(() => const UpdateProfileScreen()),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: tPrimaryColor,
                                side: BorderSide.none,
                                shape: const StadiumBorder()),
                            child: const Text(tEditProfile,
                                style: TextStyle(color: tWhiteColor)),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Divider(),
                        const SizedBox(height: 10),

                        /// -- MENU
                        ProfileMenuWidget(
                            title: "Settings",
                            icon: LineAwesomeIcons.cog,
                            onPress: () {}),
                        ProfileMenuWidget(
                            title: "Billing Details",
                            icon: LineAwesomeIcons.wallet,
                            onPress: () {}),
                        ProfileMenuWidget(
                            title: "User Management",
                            icon: LineAwesomeIcons.user_check,
                            onPress: () {}),
                        const Divider(),
                        const SizedBox(height: 10),
                        ProfileMenuWidget(
                            title: "Information",
                            icon: LineAwesomeIcons.info,
                            onPress: () {}),
                        ProfileMenuWidget(
                            title: "Logout",
                            icon: LineAwesomeIcons.alternate_sign_out,
                            textColor: Colors.red,
                            endIcon: false,
                            onPress: () {
                              Get.defaultDialog(
                                title: "LOGOUT",
                                titleStyle: const TextStyle(fontSize: 20),
                                content: const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 15.0),
                                  child:
                                      Text("Are you sure, you want to Logout?"),
                                ),
                                confirm: Expanded(
                                  child: ElevatedButton(
                                    onPressed: () {
                                      _logout();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.redAccent,
                                        side: BorderSide.none),
                                    child: const Text("Yes"),
                                  ),
                                ),
                                cancel: OutlinedButton(
                                    onPressed: () => Get.back(),
                                    child: const Text("No")),
                              );
                            }),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return const Center(child: Text('Something went wrong'));
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            )),
      ),
    );
  }
}
