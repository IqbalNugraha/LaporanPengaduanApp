import 'package:flutter/material.dart';

import '../constans/colors.dart';
import '../constans/images.dart';
import '../constans/variables.dart';

class CustomCirclePhoto extends StatelessWidget {
  final String imageProfile;
  final double height, width;
  const CustomCirclePhoto({
    required this.imageProfile,
    this.height = 70,
    this.width = 70,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        color: MyColors.bgImage,
        shape: BoxShape.circle,
        boxShadow: Variables.shadowRadius1,
      ),
      child: ClipOval(
        child: Image.network(
          imageProfile,
          fit: BoxFit.cover,
          errorBuilder: (context, exception, stackTrace) {
            return Image.asset(
              ImageAssets.logo,
              fit: BoxFit.cover,
            );
          },
        ),
      ),
    );
  }
}
