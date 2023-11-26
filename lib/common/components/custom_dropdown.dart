import 'package:flutter/material.dart';

import '../constans/colors.dart';
import 'custom_font.dart';

class CustomDropdown<T> extends StatelessWidget {
  final T value;
  final List<T> items;
  final Function(T?)? onChanged;
  final double radius, textSize, menuMaxHeight;
  final Color textColor, borderColor;
  const CustomDropdown({
    required this.items,
    required this.onChanged,
    required this.value,
    this.radius = 20,
    this.textSize = 14,
    this.menuMaxHeight = 100,
    this.textColor = MyColors.brandColor,
    this.borderColor = MyColors.brandColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      value: value,
      onChanged: onChanged,
      menuMaxHeight: 150,
      isExpanded: true,
      items: items.map((T item) {
        return DropdownMenuItem<T>(
          value: item,
          child: FontPoppins(
            text: item.toString(),
            size: textSize,
            fontWeight: FontWeight.w400,
            color: textColor,
            alignment: TextAlign.start,
          ),
        );
      }).toList(),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(radius),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
