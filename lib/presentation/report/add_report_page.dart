import 'package:flutter/material.dart';
import 'package:skripsi_project/presentation/report/widgets/add_form_widget.dart';

import '../../common/components/custom_appbar.dart';
import '../../common/constans/colors.dart';
import '../../common/constans/variables.dart';

class AddReportPage extends StatelessWidget {
  const AddReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.white,
        body: Column(
          children: [
            CustomAppbar(
              title: Variables.updateReport,
              function: () {},
            ),
            const SizedBox(height: 32),
            const Expanded(
              child: AddFormWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
