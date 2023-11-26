import 'package:flutter/material.dart';
import 'package:skripsi_project/presentation/auth/widgets/register/register_form_widget.dart';

import '../../common/constans/colors.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.white,
        body: RegisterFormWidget(),
      ),
    );
  }
}
