import 'package:flutter/material.dart';

import '../constans/colors.dart';
import 'custom_font.dart';

class CustomAppbarProfile extends StatelessWidget {
  final String title;
  final double fontSize, paddingTop;
  final double? height;
  final Color bgColor, textColor;
  final FontWeight fontWeight;
  final VoidCallback function, addFunction;
  const CustomAppbarProfile({
    required this.title,
    required this.function,
    required this.addFunction,
    this.bgColor = Colors.transparent,
    this.textColor = MyColors.brandColor,
    this.paddingTop = 24,
    this.fontSize = 18,
    this.height,
    this.fontWeight = FontWeight.w600,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: height,
            color: bgColor,
            child: Center(
              child: FontPoppins(
                text: title,
                size: fontSize,
                fontWeight: fontWeight,
                color: textColor,
                alignment: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            left: 16,
            child: GestureDetector(
              onTap: function,
              child: Icon(
                Icons.arrow_back,
                color: textColor,
                size: 28,
              ),
            ),
          ),
          Positioned(
            right: 16,
            child: GestureDetector(
              onTap: addFunction,
              child: Icon(
                Icons.add,
                color: textColor,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
