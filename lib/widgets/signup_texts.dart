import 'package:flutter/material.dart';
import 'package:login_screen/helpers/constants.dart';

class SignUpTexts extends StatelessWidget {
  const SignUpTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create Account',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: kPrimaryColor,
          ),
        ),
        SizedBox(height: 8),
        Text(
          'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
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
