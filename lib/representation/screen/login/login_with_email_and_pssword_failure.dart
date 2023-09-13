// import 'package:firebase_auth/firebase_auth.dart';

// class LogInWithEmailAndPasswordFailure {
//   final String message;

//   const LogInWithEmailAndPasswordFailure(
//       [this.message = "An Unknown error occurred."]);

//   factory LogInWithEmailAndPasswordFailure.code(String code) {
//     switch (code) {
//       case 'weak-password':
//         return const LogInWithEmailAndPasswordFailure(
//             'The password provided is too weak.');
//       case 'invalid-email':
//         return const LogInWithEmailAndPasswordFailure(
//             "The email address isn't valid.");
//       case 'email-already-in-use':
//         return const LogInWithEmailAndPasswordFailure(
//             "This Email Address already exists in the system");
//       case 'operation-not-allowed':
//         return const LogInWithEmailAndPasswordFailure(
//             'Sign up not allowed, Please contact support');
//       case 'user-disabled':
//         return const LogInWithEmailAndPasswordFailure(
//             'User disabled by admin, Please contact support');
//       default:
//         return const LogInWithEmailAndPasswordFailure();
//     }
//   }

//   static LogInWithEmailAndPasswordFailure fromCode(String code) {
//     return LogInWithEmailAndPasswordFailure.code(code);
//   }
// }
