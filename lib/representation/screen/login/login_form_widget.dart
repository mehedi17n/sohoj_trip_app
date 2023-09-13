import 'package:email_validator/email_validator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sohoj_trip_app/global/global.dart';
import 'package:sohoj_trip_app/representation/screen/login/login_controller.dart';
import '../../../core/constants/dimension_constants.dart';
import '../../../core/constants/text_strings.dart';
import '../forget_password/forget_password_options/forget_password_bottom_sheet.dart';
import '../main_app.dart';
import '../search_tour.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);
  @override
  State<LoginForm> createState() => _LoginForm();
}

class _LoginForm extends State<LoginForm> {
  final emailTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();

  bool _passwordVisible = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submit() async {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      await firebaseAuth
          .signInWithEmailAndPassword(
              email: emailTextEditingController.text.trim(),
              password: passwordTextEditingController.text.trim())
          .then((auth) async {
        currentUser = auth.user;

        await Fluttertoast.showToast(msg: "Successfully Login");
        Get.to(() => SearchTourPage());
      }).catchError((errorMessage) {
        Fluttertoast.showToast(msg: "Invalid Email or Password"
            //"Error occurred: \n $errorMessage"
            );
      });
    } else {
      Fluttertoast.showToast(msg: "Not all fields are valid");
    }
  }

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(LoginController());
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: _formKey, // Add the key to the Form widget
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                  label: Text(tEmail), prefixIcon: Icon(Icons.email_outlined)),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return "Email can't be empty";
                }
                if (EmailValidator.validate(text) == true) {
                  return null;
                }
                if (text.length < 2) {
                  return "Please enter a valid email";
                }
                if (text.length > 50) {
                  return "Email can't be more than 50";
                }
                return null; // Return null if validation passes
              },
              onChanged: (text) => setState(() {
                emailTextEditingController.text = text;
              }),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              obscureText: !_passwordVisible,
              inputFormatters: [LengthLimitingTextInputFormatter(50)],
              decoration: InputDecoration(
                label: Text(tPassword),
                prefixIcon: Icon(Icons.fingerprint),
                suffixIcon: IconButton(
                  icon: Icon(
                    _passwordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _passwordVisible = !_passwordVisible;
                    });
                  },
                ),
              ),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return "Password can't be empty";
                }
                if (text.length < 6) {
                  return "Password length must be greater 6";
                }
                if (text.length > 20) {
                  return "Password can't be more than 20";
                }
                return null; // Return null if validation passes
              },
              onChanged: (text) => setState(() {
                passwordTextEditingController.text = text;
              }),
            ),
            const SizedBox(height: tFormHeight - 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  _submit();
                  //controller.login();
                },
                child: Text(tLogin.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
