import 'package:flutter/material.dart';
import 'package:skripsi_project/data/models/response/account/account_detail_response.dart';
import 'package:skripsi_project/presentation/edit_profile/widget/edit_form_widget.dart';

import '../../common/components/custom_appbar.dart';
import '../../common/constans/colors.dart';
import '../../common/constans/navigation.dart';
import '../../common/constans/variables.dart';
import 'widget/edit_photo_widget.dart';

class EditProfilePage extends StatelessWidget {
  final AccountDetailData data;
  const EditProfilePage({
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
              title: Variables.editProfile,
              function: () {
                Navigations.popNavigation(context);
              },
            ),
            const SizedBox(height: 24),
            const EditPhotoWidget(),
            const SizedBox(height: 32),
            Expanded(
              child: EditFormWidget(data: data),
            ),
          ],
        ),
      ),
    );
  }
}
