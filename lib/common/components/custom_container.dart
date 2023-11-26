import 'package:flutter/material.dart';

import '../constans/colors.dart';

class CustomContainer extends StatelessWidget {
  final Widget widget;
  final Color bgColor;
  final EdgeInsetsGeometry? margin, padding;
  final BorderRadiusGeometry? borderRadius;
  final double? height, width;
  final List<BoxShadow>? boxShadow;
  final BoxBorder? border;
  const CustomContainer({
    required this.widget,
    this.bgColor = MyColors.white,
    this.borderRadius,
    this.margin,
    this.padding,
    this.height,
    this.width,
    this.border,
    this.boxShadow,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
        border: border,
      ),
      margin: margin,
      padding: padding,
      child: widget,
    );
  }
}
