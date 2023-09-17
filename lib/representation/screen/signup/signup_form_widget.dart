import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_sorted_list.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sohoj_trip_app/data/model/use_model.dart';
import 'package:sohoj_trip_app/global/global.dart';
import 'package:sohoj_trip_app/representation/screen/login/login_screen.dart';
import 'package:sohoj_trip_app/representation/screen/signup/signup_controller.dart';
import '../../../core/constants/dimension_constants.dart';
import '../../../core/constants/text_strings.dart';

class SignUpFormWidget extends StatefulWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);
  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidget();
}

class _SignUpFormWidget extends State<SignUpFormWidget> {
  final nameTextEditingController = TextEditingController();
  final emailTextEditingController = TextEditingController();
  final phoneTextEditingController = TextEditingController();
  final passwordTextEditingController = TextEditingController();
  final confirmTextEditingController = TextEditingController();

  bool _passwordVisible = false;

  //final controller = Get.put(SignUpController());

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // void _submit() async {
  //   if (_formKey.currentState != null && _formKey.currentState!.validate()) {
  //     await firebaseAuth
  //         .createUserWithEmailAndPassword(
  //             email: emailTextEditingController.text.trim(),
  //             password: passwordTextEditingController.text.trim())
  //         .then((auth) async {
  //       currentUser = auth.user;

  //       if (currentUser != null) {
  //         Map userMap = {
  //           "id": currentUser!.uid,
  //           "name": nameTextEditingController.text.trim(),
  //           "email": emailTextEditingController.text.trim(),
  //           "phone": phoneTextEditingController.text.trim(),
  //           "password": passwordTextEditingController.text.trim(),
  //         };

  //         DatabaseReference userRef =
  //             FirebaseDatabase.instance.ref().child("users");
  //         userRef.child(currentUser!.uid).set(userMap);
  //       }
  //       await Fluttertoast.showToast(msg: "Successfully SignUp");
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (c) => const LoginScreen()));
  //     }).catchError((errorMessage) {
  //       Fluttertoast.showToast(msg: "Error occurred: \n $errorMessage");
  //     });
  //   } else {
  //     Fluttertoast.showToast(msg: "Not all fields are valid");
  //   }
  // }

  void authenticateUser() async {
    User? currentUser;
    //final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

    await firebaseAuth
        .createUserWithEmailAndPassword(
      email: emailTextEditingController.text.trim(),
      password: passwordTextEditingController.text.trim(),
    )
        .then((auth) {
      currentUser = auth.user;
    });
    //.catchError((error) {
    // Navigator.pop(context);
    // showDialog(
    //     context: context,
    //     builder: (c) {
    //       return ErrorDialog(
    //         message: error.message.toString(),
    //       );
    //     });

    if (currentUser != null) {
      saveDataToFirestore(currentUser!).then((value) async {
        await Fluttertoast.showToast(msg: "Successfully SignUp");
        // Route newRoute = MaterialPageRoute(builder: (c) => const LoginScreen());
        Navigator.push(
            context, MaterialPageRoute(builder: (c) => const LoginScreen()));
      });
    }
  }

  Future saveDataToFirestore(User currentUser) async {
    final signUpDate = DateTime.now();
    final formattedDate = DateFormat('dd MMMM yyyy').format(signUpDate);
    FirebaseFirestore.instance.collection("Users").doc(currentUser.uid).set({
      "id": currentUser.uid,
      "name": nameTextEditingController.text.trim(),
      //"profile": 0.0,
      "email": currentUser.email,
      "phone": phoneTextEditingController.text.trim(),
      "password": passwordTextEditingController.text.trim(),
      "signupDate": formattedDate,
    });

    //save data locally
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
      child: Form(
        key: formKey, // Add the key to the Form widget
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              //controller: controller.name,
              decoration: const InputDecoration(
                  label: Text(tFullName),
                  prefixIcon: Icon(Icons.person_outline_rounded)),
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return "Name can't be empty";
                }
                if (text.length < 2) {
                  return "Please enter a valid name";
                }
                if (text.length > 49) {
                  return "Name can't be more than 49";
                }
                return null; // Return null if validation passes
              },
              onChanged: (text) => setState(() {
                nameTextEditingController.text = text;
              }),
            ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              //controller: controller.email,
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
            IntlPhoneField(
              //controller: controller.phone,
              showCountryFlag: true,
              dropdownIcon: Icon(
                Icons.arrow_drop_down,
              ),
              decoration: const InputDecoration(
                  label: Text(tPhoneNo),
                  prefixIcon: Icon(Icons.phone_android_outlined)),
              initialCountryCode: 'BD',
              onChanged: (text) => setState(() {
                phoneTextEditingController.text = text.completeNumber;
              }),
            ),
            // TextFormField(
            //   decoration: const InputDecoration(
            //       label: Text(tPhoneNo),
            //       prefixIcon: Icon(Icons.phone_android_outlined)),
            // ),
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              //controller: controller.password,
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
            const SizedBox(height: tFormHeight - 20),
            TextFormField(
              obscureText: !_passwordVisible,
              inputFormatters: [LengthLimitingTextInputFormatter(50)],
              decoration: InputDecoration(
                label: Text(tConPassword),
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
                  return "Confirm Password can't be empty";
                }
                if (text != passwordTextEditingController.text) {
                  return "Passwords do not match";
                }
                return null; // Return null if validation passes
              },
              onChanged: (text) => setState(() {
                confirmTextEditingController.text = text;
              }),
            ),
            const SizedBox(height: tFormHeight - 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  authenticateUser();
                  //_submit();
                  // if (formKey.currentState!.validate()) {
                  //   final user = UserModel(
                  //     name: controller.name.text.trim(),
                  //     email: controller.email.text.trim(),
                  //     phone: controller.phone.text.trim(),
                  //     password: controller.password.text.trim(),
                  //   );
                  //   SignUpController.instance.createUser(user);
                  // }
                },
                child: Text(tSignup.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}


// class SignUpFormWidget extends StatelessWidget {
//   const SignUpFormWidget({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final controller = Get.put(SignUpController());
//     final _formKey = GlobalKey<FormState>();

//     return Container(
//       padding: const EdgeInsets.symmetric(vertical: tFormHeight - 10),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextFormField(
//               controller: controller.fullName,
//               decoration: const InputDecoration(
//                   label: Text(tFullName),
//                   prefixIcon: Icon(Icons.person_outline_rounded)),
//             ),
//             const SizedBox(height: tFormHeight - 20),
//             TextFormField(
//               controller: controller.email,
//               decoration: const InputDecoration(
//                   label: Text(tEmail), prefixIcon: Icon(Icons.email_outlined)),
//             ),
//             const SizedBox(height: tFormHeight - 20),
//             TextFormField(
//               controller: controller.phoneNo,
//               decoration: const InputDecoration(
//                   label: Text(tPhoneNo), prefixIcon: Icon(Icons.numbers)),
//             ),
//             const SizedBox(height: tFormHeight - 20),
//             TextFormField(
//               controller: controller.password,
//               decoration: const InputDecoration(
//                   label: Text(tPassword), prefixIcon: Icon(Icons.fingerprint)),
//             ),
//             const SizedBox(height: tFormHeight - 10),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     SignUpController.instance.registerUser(
//                         controller.email.text.trim(),
//                         controller.password.text.trim());
//                   }
//                 },
//                 child: Text(tSignup.toUpperCase()),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
