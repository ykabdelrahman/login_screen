import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/helpers/constants.dart';

class AlreadyHaveAccountText extends StatelessWidget {
  const AlreadyHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Already have an account?',
            style: TextStyle(
              fontSize: 14,
              color: kTextColor.withOpacity(.6),
              fontWeight: FontWeight.w500,
            ),
          ),
          TextSpan(
            text: ' Login',
            style: const TextStyle(
              fontSize: 14,
              color: kPrimaryColor,
              fontWeight: FontWeight.w700,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
          ),
        ],
      ),
    );
  }
}
