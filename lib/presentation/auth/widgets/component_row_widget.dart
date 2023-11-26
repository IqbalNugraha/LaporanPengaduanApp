import 'package:flutter/material.dart';

import '../../../common/components/custom_font.dart';
import '../../../common/constans/colors.dart';

class ComponentRowWidget extends StatelessWidget {
  final String title;
  final IconData icon;
  const ComponentRowWidget({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: MyColors.brandColor,
        ),
        const SizedBox(width: 8),
        FontPoppins(
          text: title,
          size: 14,
          fontWeight: FontWeight.w400,
          color: MyColors.brandColor,
          alignment: TextAlign.start,
        ),
      ],
    );
  }
}
