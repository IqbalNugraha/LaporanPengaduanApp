import 'package:flutter/material.dart';
import 'package:skripsi_project/data/models/response/account/account_detail_response.dart';

import '../../common/components/custom_appbar.dart';
import '../../common/constans/colors.dart';
import '../../common/constans/navigation.dart';
import '../../common/constans/variables.dart';

class DetailProfilePage extends StatelessWidget {
  final AccountDetailData data;
  const DetailProfilePage({
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
              title: Variables.profile,
              function: () {
                Navigations.popNavigation(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
