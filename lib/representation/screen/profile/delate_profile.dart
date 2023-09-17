// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:sohoj_trip_app/representation/screen/login/login_screen.dart';

// class DeleteAccountForm extends StatefulWidget {
//   @override
//   _DeleteAccountFormState createState() => _DeleteAccountFormState();
// }

// class _DeleteAccountFormState extends State<DeleteAccountForm> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   void dispose() {
//     emailController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }

//   void _deleteAccount() async {
//     final user = FirebaseAuth.instance.currentUser;

//     if (user == null) {
//       // User is not signed in; handle accordingly
//       return;
//     }

//     if (_formKey.currentState!.validate()) {
//       try {
//         final email = emailController.text;
//         final password = passwordController.text;

//         // Reauthenticate the user
//         final AuthCredential credential = EmailAuthProvider.credential(
//           email: email,
//           password: password,
//         );

//         await user.reauthenticateWithCredential(credential);

//         // Delete the user account after reauthentication
//         await user.delete();

//         // Navigate to the login screen after successful deletion
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => LoginScreen()),
//         );
//       } catch (e) {
//         print('Error deleting user account: $e');
//         // Handle errors as needed
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           TextFormField(
//             controller: emailController,
//             decoration: InputDecoration(labelText: 'Email'),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your email';
//               }
//               return null;
//             },
//           ),
//           TextFormField(
//             controller: passwordController,
//             obscureText: true,
//             decoration: InputDecoration(labelText: 'Password'),
//             validator: (value) {
//               if (value == null || value.isEmpty) {
//                 return 'Please enter your password';
//               }
//               return null;
//             },
//           ),
//           ElevatedButton(
//             onPressed: _deleteAccount,
//             child: Text('Delete My Account'),
//           ),
//         ],
//       ),
//     );
//   }
// }
