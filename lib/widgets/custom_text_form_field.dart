import 'package:flutter/material.dart';
import 'package:login_screen/helpers/constants.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hint,
    this.hideText,
    this.controller,
    this.validator,
    this.suffixIcon,
    this.prefixIcon,
    this.textStyle,
    this.radius,
    this.contentPadding,
    this.bgColor,
    this.borderSide,
    this.hintFontWeight,
    this.hintFontSize,
    this.isLastInput = false,
  });
  final String? hint;
  final bool? hideText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextStyle? textStyle;
  final EdgeInsetsGeometry? contentPadding;
  final double? radius;
  final Color? bgColor;
  final BorderSide? borderSide;
  final FontWeight? hintFontWeight;
  final double? hintFontSize;
  final bool isLastInput;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textInputAction:
          isLastInput ? TextInputAction.done : TextInputAction.next,
      controller: controller,
      validator: validator,
      obscureText: hideText ?? false,
      cursorColor: kPrimaryColor,
      style: textStyle,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        fillColor: bgColor ?? Colors.white,
        filled: true,
        contentPadding: contentPadding ??
            const EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8,
            ),
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hint,
        hintStyle: TextStyle(
          color: kTextColor.withOpacity(.5),
          fontWeight: hintFontWeight ?? FontWeight.w400,
          fontSize: hintFontSize ?? 16,
        ),
        focusedBorder: borderStyle(),
        enabledBorder: borderStyle(),
        border: borderStyle(),
      ),
    );
  }

  OutlineInputBorder borderStyle() {
    return OutlineInputBorder(
      borderSide: borderSide ??
          const BorderSide(
            color: kPrimaryColor,
            width: 2,
          ),
      borderRadius: BorderRadius.circular(radius ?? 10),
    );
  }
}
