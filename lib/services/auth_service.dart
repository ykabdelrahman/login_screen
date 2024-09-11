import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/helpers/show_snack_bar.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;

  void login(BuildContext context, {required email, required password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (context.mounted) showSnackBar(context, 'Logged in Successfully');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        if (context.mounted) {
          showSnackBar(context, 'No user found for that email.');
        }
      } else if (e.code == 'wrong-password') {
        if (context.mounted) {
          showSnackBar(context, 'Wrong password provided for that user.');
        }
      } else {
        if (context.mounted) showSnackBar(context, e.message.toString());
      }
    }
  }
}
