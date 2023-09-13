import 'package:firebase_auth/firebase_auth.dart';

class SignUpWithEmailAndPasswordFailure {
  final String message;

  const SignUpWithEmailAndPasswordFailure(
      [this.message = "An Unknown error occurred."]);

  factory SignUpWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'weak-password':
        return const SignUpWithEmailAndPasswordFailure(
            'The password provided is too weak.');
      case 'invalid-email':
        return const SignUpWithEmailAndPasswordFailure(
            "The email address isn't valid.");
      case 'email-already-in-use':
        return const SignUpWithEmailAndPasswordFailure(
            "This Email Address already exists in the system");
      case 'operation-not-allowed':
        return const SignUpWithEmailAndPasswordFailure(
            'Sign up not allowed, Please contact support');
      case 'user-disabled':
        return const SignUpWithEmailAndPasswordFailure(
            'User disabled by admin, Please contact support');
      default:
        return const SignUpWithEmailAndPasswordFailure();
    }
  }
}
