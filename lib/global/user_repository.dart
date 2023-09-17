import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:sohoj_trip_app/data/model/use_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  // createUser(UserModel user) async {
  //   await _db
  //       .collection("Users")
  //       .add(user.toJson())
  //       .whenComplete(
  //         () => Get.snackbar("Success", "You account has been created.",
  //             snackPosition: SnackPosition.BOTTOM,
  //             backgroundColor: Colors.green.withOpacity(0.1),
  //             colorText: Colors.green),
  //       )
  //       .catchError((error, StackTrace) {
  //     Get.snackbar("Error", "Something went wrong. Try again.",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.redAccent.withOpacity(0.1),
  //         colorText: Colors.red);
  //     print(error.toString());
  //   });
  // }

  Future<UserModel?> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("Users").where("email", isEqualTo: email).get();

    if (snapshot.docs.isNotEmpty) {
      final userData = UserModel.fromSnapshot(snapshot.docs.first);
      return userData;
    } else {
      return null; // Return null or handle the case where no user is found
    }
  }

  Future<List<UserModel>> allUser() async {
    final snapshot = await _db.collection("Users").get();
    final userData =
        snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }
}
