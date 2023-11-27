import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skripsi_project/presentation/auth/widgets/login/login_form_widget.dart';

import '../../common/constans/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  DateTime _currentBackPressTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SafeArea(
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          backgroundColor: MyColors.white,
          body: SizedBox(
            width: size.width,
            height: size.height,
            child: const SingleChildScrollView(
              child: LoginFormWidget(),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (now.difference(_currentBackPressTime) >= const Duration(seconds: 1)) {
      _currentBackPressTime = now;
      var message = "Press again to exit";
      Fluttertoast.showToast(msg: message);
      return Future.value(false);
    }
    return Future.value(true);
  }
}
