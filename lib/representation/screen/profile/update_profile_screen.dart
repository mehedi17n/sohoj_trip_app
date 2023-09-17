import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:sohoj_trip_app/core/constants/color_palatte.dart';
import 'package:sohoj_trip_app/core/constants/dimension_constants.dart';
import 'package:sohoj_trip_app/core/constants/text_strings.dart';
import 'package:sohoj_trip_app/core/helpers/asset_helper.dart';
import 'package:sohoj_trip_app/data/model/use_model.dart';
import 'package:sohoj_trip_app/representation/screen/login/login_screen.dart';
import 'package:sohoj_trip_app/representation/screen/profile/delate_profile.dart';
import 'package:sohoj_trip_app/representation/screen/profile/profile_controller.dart';
import 'package:sohoj_trip_app/representation/screen/profile/profile_screen.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // void _delete() async {
    //   // Add your logout logic here, e.g., Firebase sign out
    //   // For example, if you're using FirebaseAuth:
    //   await FirebaseAuth.instance.currentUser!.delete().then((value) {
    //     Navigator.push(
    //         context, MaterialPageRoute(builder: (c) => const LoginScreen()));
    //   });
    // }

    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(LineAwesomeIcons.angle_left)),
        title: Text(tEditProfile,
            style: Theme.of(context).textTheme.headlineSmall),
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
                      // -- IMAGE with ICON
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
                              child: const Icon(LineAwesomeIcons.camera,
                                  color: Colors.white, size: 20),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 50),

                      // -- Form Fields
                      Form(
                        child: Column(
                          children: [
                            TextFormField(
                              initialValue: userData.name,
                              decoration: const InputDecoration(
                                  label: Text(tFullName),
                                  prefixIcon: Icon(LineAwesomeIcons.user)),
                            ),
                            const SizedBox(height: tFormHeight - 20),
                            TextFormField(
                              initialValue: userData.email,
                              decoration: const InputDecoration(
                                  label: Text(tEmail),
                                  prefixIcon:
                                      Icon(LineAwesomeIcons.envelope_1)),
                            ),
                            const SizedBox(height: tFormHeight - 20),
                            TextFormField(
                              initialValue: userData.phone,
                              decoration: const InputDecoration(
                                  label: Text(tPhoneNo),
                                  prefixIcon: Icon(LineAwesomeIcons.phone)),
                            ),
                            const SizedBox(height: tFormHeight - 20),
                            TextFormField(
                              initialValue: userData.password,
                              obscureText: true,
                              decoration: InputDecoration(
                                label: const Text(tPassword),
                                prefixIcon: const Icon(Icons.fingerprint),
                                suffixIcon: IconButton(
                                    icon:
                                        const Icon(LineAwesomeIcons.eye_slash),
                                    onPressed: () {}),
                              ),
                            ),
                            const SizedBox(height: tFormHeight),

                            // -- Form Submit Button
                            SizedBox(
                              width: double.infinity,
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
                            const SizedBox(height: tFormHeight),

                            // -- Created Date and Delete Button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  tJoined,
                                  style: TextStyle(fontSize: 12),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      right:
                                          120.0), // Adjust the value as needed
                                  child: Text(
                                    userData.signupDate,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Handle delete button logic here
                                    // DeleteAccountForm();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        Colors.redAccent.withOpacity(0.1),
                                    elevation: 0,
                                    foregroundColor: Colors.red,
                                    shape: const StadiumBorder(),
                                    side: BorderSide.none,
                                  ),
                                  child: const Text(tDelete),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
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
          ),
        ),
      ),
    );
  }
}
