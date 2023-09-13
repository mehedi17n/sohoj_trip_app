// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sohoj_trip_app/data/model/use_model.dart';
// import 'package:sohoj_trip_app/global/user_repository.dart';
// import 'package:sohoj_trip_app/representation/screen/login/login_screen.dart';
// import 'package:sohoj_trip_app/representation/screen/signup/authentication_repository.dart';

// class SignUpController extends GetxController {
//   static SignUpController get instance => Get.find();

//   //TextField Controllers to get data from TextFields
//   final email = TextEditingController();
//   final password = TextEditingController();
//   final name = TextEditingController();
//   final phone = TextEditingController();

//   //Call this Function from Design & it will do the rest
//   void registerUser(String email, String password) async {
//     String? error = await AuthenticationRepository.instance
//         .createUserWithEmailAndPassword(email, password);
//     if (error != null) {
//       Get.showSnackbar(GetSnackBar(
//         message: error.toString(),
//       ));
//     }
//   }

//   final userRepo = Get.put(UserRepository());
//   Future<void> createUser(UserModel user) async {
//     await userRepo.createUser(user);
//     SignUpController.instance.registerUser(user.email, user.password);
//     Get.to(() => const LoginScreen());
//   }
// }
