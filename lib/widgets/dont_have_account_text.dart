import 'package:flutter/material.dart';
import 'package:login_screen/helpers/constants.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Don\'t have an account?',
            style: TextStyle(
              fontSize: 14,
              color: kTextColor.withOpacity(.6),
              fontWeight: FontWeight.w500,
            ),
          ),
          const TextSpan(
            text: ' Sign Up',
            style: TextStyle(
              fontSize: 14,
              color: kPrimaryColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
