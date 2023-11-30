import 'package:flutter/material.dart';
import 'package:skripsi_project/data/models/response/report/report_response_model.dart';
import 'package:skripsi_project/presentation/report/widgets/edit_form_widget.dart';

import '../../common/components/custom_appbar.dart';
import '../../common/constans/colors.dart';
import '../../common/constans/navigation.dart';
import '../../common/constans/variables.dart';

class EditReportPage extends StatelessWidget {
  final ReportData data;
  const EditReportPage({
    super.key,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.white,
        body: Column(
          children: [
            CustomAppbar(
              title: Variables.updateReport,
              function: () {
                Navigations.popNavigation(context);
              },
            ),
            const SizedBox(height: 32),
            Expanded(
              child: EditFormPage(
                data: data,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
