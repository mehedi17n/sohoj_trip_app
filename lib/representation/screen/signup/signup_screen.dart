import 'package:flutter/material.dart';
import 'package:sohoj_trip_app/representation/screen/signup/signup_footer_widget.dart';
import 'package:sohoj_trip_app/representation/screen/signup/signup_form_widget.dart';
import '../../../core/constants/dimension_constants.dart';
import '../../../core/constants/text_strings.dart';
import '../../../core/helpers/asset_helper.dart';
import 'form_header_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDefaultSize),
            child: Column(
              children: const [
                FormHeaderWidget(
                  image: tSignupPic,
                  title: tSignUpTitle,
                  subTitle: tSignUpSubTitle,
                  imageHeight: 0.12,
                ),
                SignUpFormWidget(),
                SignUpFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
