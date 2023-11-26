import 'package:flutter/material.dart';

import '../constans/colors.dart';

class CustomLoadingState extends StatelessWidget {
  final Color colorLoading;
  const CustomLoadingState({
    this.colorLoading = MyColors.brandColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: colorLoading,
      ),
    );
  }
}
