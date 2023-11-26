import 'package:flutter/material.dart';

import '../constans/colors.dart';

class CustomButton extends StatelessWidget {
  final double height;
  final double? width;
  final Color btnColor;
  final Color? shadowColor;
  final Widget widget;
  final void Function()? function;
  final EdgeInsetsGeometry? margin;
  const CustomButton({
    required this.function,
    required this.widget,
    this.btnColor = MyColors.brandColor,    
    this.width,
    this.height = 50,
    this.shadowColor,
    this.margin,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        onPressed: function,
        style: ElevatedButton.styleFrom(
          backgroundColor: btnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadowColor: shadowColor,
        ),
        child: widget
      ),
    );
  }
}
