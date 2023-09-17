import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';

class UserModel {
  final String? id;
  final String name;
  final String email;
  final String phone;
  final String password;
  final String signupDate;

  const UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.signupDate,
  });

  // UserModel.fromSnapShot(DataSnapshot snap) {
  //   id = snap.key;
  //   name = (snap.value as dynamic)["name"];
  //   email = (snap.value as dynamic)["email"];
  //   phone = (snap.value as dynamic)["phone"];
  //   password = (snap.value as dynamic)["password"];
  // }
  toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "password": password,
      "signupDate": signupDate,
    };
  }

  //fatch data
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return UserModel(
      id: document.id,
      name: data["name"],
      email: data["email"],
      phone: data["phone"],
      password: data["password"],
      signupDate: data["signupDate"],
    );
  }
}
