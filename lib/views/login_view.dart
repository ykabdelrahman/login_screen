import 'package:flutter/material.dart';
import 'package:login_screen/widgets/dont_have_account_text.dart';
import 'package:login_screen/widgets/login_form.dart';
import 'package:login_screen/widgets/welcome_texts.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                WelcomeTexts(),
                SizedBox(height: 36),
                LoginForm(),
                SizedBox(height: 30),
                DontHaveAccountText(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
