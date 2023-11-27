import 'package:flutter/material.dart';

import '../../../common/components/custom_container.dart';
import '../../../common/constans/variables.dart';

class CardReport extends StatelessWidget {
  const CardReport({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      borderRadius: BorderRadius.circular(10),
      boxShadow: Variables.shadowRadius1,
      padding: const EdgeInsets.all(16),
      widget: Column(),
    );
  }
}