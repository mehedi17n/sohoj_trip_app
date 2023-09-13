import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_trip_app/representation/screen/forget_password/new_password/password_created_screen.dart';

import '../../../../core/constants/dimension_constants.dart';
import '../../../../core/constants/text_strings.dart';
import '../../../../core/helpers/asset_helper.dart';
import '../forget_password_options/forget_password_header_widget.dart';

class CreatePasswordScreen extends StatelessWidget {
  const CreatePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: [
                const SizedBox(height: tDefaultSize * 2),
                ForgetPasswordHeaderWidget(
                  image: tForgetPasswordImage,
                  title: tNewPassTitle.toUpperCase(),
                  subTitle: tNewPassSubTitle,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween: 30.0,
                  textAlign: TextAlign.start,
                ),
                const SizedBox(height: tFormHeight),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text(tNewPass),
                            hintText: tNewPass,
                            prefixIcon: Icon(Icons.password)),
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text(tConNewPass),
                            hintText: tConNewPass,
                            prefixIcon: Icon(Icons.password)),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                Get.to(() => const PasswordCreatedScreen());
                              },
                              child: const Text("Reset Password"))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
