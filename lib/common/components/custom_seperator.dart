import 'package:flutter/material.dart';

import '../constans/colors.dart';

class CustomSeperator extends StatelessWidget {
  final double width, height;
  final Color colorSeperator;
  const CustomSeperator({
    this.height = 1,
    this.width = double.infinity,
    this.colorSeperator = MyColors.seperator,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      color: colorSeperator,
    );
  }
}
