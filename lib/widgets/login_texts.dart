import 'package:flutter/material.dart';
import 'package:login_screen/helpers/constants.dart';

class LoginTexts extends StatelessWidget {
  const LoginTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Welcome Back',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: kPrimaryColor,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: kTextColor,
            height: 1.8,
          ),
        ),
      ],
    );
  }
}
