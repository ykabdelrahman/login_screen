import 'package:flutter/material.dart';
import 'package:login_screen/widgets/already_have_account.dart';
import 'package:login_screen/widgets/signup_form.dart';
import 'package:login_screen/widgets/signup_texts.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SignUpTexts(),
                SizedBox(height: 36),
                SignupForm(),
                SizedBox(height: 30),
                AlreadyHaveAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
