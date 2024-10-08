import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:login_screen/helpers/constants.dart';
import 'package:login_screen/views/signup_view.dart';

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
          TextSpan(
            text: ' Sign Up',
            style: const TextStyle(
              fontSize: 14,
              color: kPrimaryColor,
              fontWeight: FontWeight.w700,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignUpView(),
                  ),
                );
              },
          ),
        ],
      ),
    );
  }
}
