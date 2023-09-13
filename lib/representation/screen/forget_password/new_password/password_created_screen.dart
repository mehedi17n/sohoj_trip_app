import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sohoj_trip_app/core/helpers/asset_helper.dart';
import '../../../../core/constants/dimension_constants.dart';
import '../../login/login_screen.dart';

class PasswordCreatedScreen extends StatelessWidget {
  const PasswordCreatedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.all(tDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(tNewPasswordImage),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Text(
                "Password Changed!",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: Text(
                "Your password has been changed successfully.",
                style: TextStyle(
                  color: Color(0xFF8391A1),
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      Get.to(() => const LoginScreen());
                    },
                    child: const Text("Back to Login"))),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
