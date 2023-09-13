import 'package:firebase_database/firebase_database.dart';

class UserModel {
  final String? id;
  final String name;
  final String email;
  final String phone;
  final String password;

  const UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
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
      "Name": name,
      "Email": email,
      "Phone": phone,
      "Password": password,
    };
  }
}
