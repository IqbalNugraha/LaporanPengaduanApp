import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constans/colors.dart';


class CustomTextFieldNoBorder extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String? errorText;
  final Function(String value)? onChanged;
  final bool obscureText;
  final TextInputType textInputType;
  final Color underlineColor, errorColor;
  final Widget? suffixIcon;
  final int? limit, limitLines;

  const CustomTextFieldNoBorder({
    super.key,
    required this.controller,
    required this.hint,
    this.onChanged,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.underlineColor = MyColors.brandColor,
    this.errorColor = MyColors.red,
    this.suffixIcon,
    this.errorText,
    this.limit,
    this.limitLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      obscureText: obscureText,
      keyboardType: textInputType,
      maxLength: limit,
      maxLines: limitLines,
      style: GoogleFonts.poppins(
        color: MyColors.blackFont,
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
      decoration: InputDecoration(
        hintText: hint,
        errorText: errorText,
        hintStyle: GoogleFonts.poppins(
          color: MyColors.grey,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        errorStyle: GoogleFonts.poppins(
          color: errorColor,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(color: underlineColor),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: underlineColor),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: errorColor),
        ),
        suffixIcon: suffixIcon,
        counterText: "",
        isDense: true,
      ),
    );
  }
}
