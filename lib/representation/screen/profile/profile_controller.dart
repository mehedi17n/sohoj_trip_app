import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:sohoj_trip_app/global/user_repository.dart';
import 'package:sohoj_trip_app/representation/screen/signup/authentication_repository.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  // final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  getUserData() {
    final user = FirebaseAuth.instance.currentUser;
    // final email = _authRepo.firebaseUser.value?.email;
    final email = user?.email;

    if (email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      Get.snackbar("Error", "Login to continue");
    }
  }
}
