import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constans/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String? errorText;
  final Function(String value)? onChanged;
  final bool obscureText;
  final TextInputType textInputType;
  final Color borderColor, errorColor;
  final Widget? suffixIcon;
  final int? limit, limitLines;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.onChanged,
    this.obscureText = false,
    this.textInputType = TextInputType.text,
    this.borderColor = MyColors.brandColor,
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
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: borderColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: borderColor),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: errorColor),
        ),
        suffixIcon: suffixIcon,        
        counterText: "",
        isDense: true,
      ),
    );
  }
}
