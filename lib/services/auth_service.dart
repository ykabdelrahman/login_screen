import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/helpers/show_snack_bar.dart';

class AuthService {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  void login(BuildContext context, {required email, required password}) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (context.mounted) {
        showSnackBar(context, 'Logged in Successfully');
      }
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

  void signup(BuildContext context,
      {required username, required email, required password}) async {
    try {
      final newUser = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _firestore.collection('users').doc(newUser.user!.uid).set({
        'uid': newUser.user!.uid,
        'email': email,
        'username': username,
      });

      if (context.mounted) {
        Navigator.pop(context);
        showSnackBar(context, 'Account created successfully.');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        if (context.mounted) {
          showSnackBar(context, 'The password provided is too weak.');
        }
      } else if (e.code == 'email-already-in-use') {
        if (context.mounted) {
          showSnackBar(context, 'The account already exists for that email.');
        }
      } else {
        if (context.mounted) showSnackBar(context, e.message.toString());
      }
    }
  }
}
