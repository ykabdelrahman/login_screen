import 'package:flutter/material.dart';
import 'package:login_screen/helpers/app_regex.dart';
import 'package:login_screen/helpers/constants.dart';
import 'package:login_screen/services/auth_service.dart';
import 'package:login_screen/widgets/custom_button.dart';
import 'package:login_screen/widgets/custom_text_form_field.dart';

class SignupForm extends StatefulWidget {
  const SignupForm({super.key});

  @override
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      child: Column(
        children: [
          CustomTextFormField(
            controller: usernameController,
            hint: 'Username',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid username';
              }
              return null;
            },
          ),
          const SizedBox(height: 18),
          CustomTextFormField(
            controller: emailController,
            hint: 'Email',
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 18),
          CustomTextFormField(
            controller: passwordController,
            hint: 'Password',
            hideText: isPasswordObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Icon(
                isPasswordObscureText ? Icons.visibility_off : Icons.visibility,
                color: kPrimaryColor,
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
              return null;
            },
          ),
          const SizedBox(height: 18),
          CustomTextFormField(
            hint: 'Confirm Pasword',
            hideText: isPasswordConfirmationObscureText,
            suffixIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Icon(
                isPasswordConfirmationObscureText
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: kPrimaryColor,
              ),
            ),
            validator: (value) {
              if (value != passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          const SizedBox(height: 50),
          CustomButton(
            text: "Create Account",
            onTap: () {
              if (_key.currentState!.validate()) {
                AuthService().signup(
                  context,
                  username: usernameController.text,
                  email: emailController.text,
                  password: passwordController.text,
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
