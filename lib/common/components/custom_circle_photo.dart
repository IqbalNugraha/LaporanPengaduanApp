import 'dart:convert';
import 'dart:typed_data';

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
    Uint8List bytes = base64Decode(imageProfile);
    return Container(
      decoration: const BoxDecoration(
        color: MyColors.bgImage,
        shape: BoxShape.circle,
        boxShadow: Variables.shadowRadius1,
      ),
      child: ClipOval(
        child: Image.memory(
          bytes,
          height: height,
          width: width,
          errorBuilder: (context, exception, stackTrace) {
            return Image.asset(
              ImageAssets.logo,
              width: width,
              height: height,
            );
          },          
        ),
      ),
    );
  }
}
