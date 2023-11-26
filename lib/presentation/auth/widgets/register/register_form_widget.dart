import 'package:flutter/material.dart';
import 'package:skripsi_project/common/components/custom_font.dart';

import '../../../../common/components/custom_button.dart';
import '../../../../common/components/custom_text_field.dart';
import '../../../../common/constans/colors.dart';
import '../../../../common/constans/variables.dart';
import '../component_row_widget.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({super.key});

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  var fullnameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var rePasswordController = TextEditingController();
  bool _hidePassword = true;
  bool _hideRePassword = true;
  String? _errorText;

  @override
  void initState() {
    passwordController.addListener(() {
      if (passwordController.text.isEmpty &&
          rePasswordController.text.isEmpty) {
        setState(() {
          _errorText = Variables.msgCantEmpty;
        });
      } else if (passwordController.text.length <= 8) {
        setState(() {
          _errorText = Variables.msgPasswordLenght;
        });
      } else if (!RegExp(
              r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]+$')
          .hasMatch(passwordController.text)) {
        setState(() {
          _errorText = Variables.msgPasswordLenght;
        });
      } else {
        setState(() {
          _errorText = null;
        });
      }
    });
    rePasswordController.addListener(() {
      if (rePasswordController.value != passwordController.value) {
        setState(() {
          _errorText = Variables.msgPasswordNotSame;
        });
      } else if (rePasswordController.text.length <= 8) {
        setState(() {
          _errorText = Variables.msgPasswordLenght;
        });
      } else if (!RegExp(
              r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]+$')
          .hasMatch(rePasswordController.text)) {
        setState(() {
          _errorText = Variables.msgPasswordLenght;
        });
      } else {
        setState(() {
          _errorText = null;
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      children: [
        const SizedBox(height: 48),
        SizedBox(
          width: size.width,
          child: const FontPoppins(
            text: Variables.greetingRegister,
            size: 16,
            fontWeight: FontWeight.w600,
            color: MyColors.lightGrey,
            alignment: TextAlign.center,
          ),
        ),
        const SizedBox(height: 28),
        const ComponentRowWidget(
          icon: Icons.person,
          title: Variables.enterFullname,
        ),
        const SizedBox(height: 8),
        CustomTextField(
          controller: fullnameController,
          hint: Variables.hintFullname,
        ),
        const SizedBox(height: 16),
        const ComponentRowWidget(
          icon: Icons.email,
          title: Variables.enterEmail,
        ),
        const SizedBox(height: 8),
        CustomTextField(
          controller: emailController,
          hint: Variables.hintEmail,
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 16),
        const ComponentRowWidget(
          icon: Icons.lock_rounded,
          title: Variables.enterPassword,
        ),
        const SizedBox(height: 8),
        CustomTextField(
          controller: passwordController,
          hint: Variables.hintPassword,
          errorText: _errorText,
          obscureText: _hidePassword,
          limitLines: 1,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _hidePassword = !_hidePassword;
              });
            },
            child: Icon(
              _hidePassword ? Icons.visibility_off : Icons.visibility_rounded,
              color: MyColors.brandColor,
            ),
          ),
        ),
        const SizedBox(height: 16),
        const ComponentRowWidget(
          icon: Icons.lock_rounded,
          title: Variables.enterRePassword,
        ),
        const SizedBox(height: 8),
        CustomTextField(
          controller: rePasswordController,
          hint: Variables.hintRePassword,
          errorText: _errorText,
          obscureText: _hideRePassword,
          limitLines: 1,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _hideRePassword = !_hideRePassword;
              });
            },
            child: Icon(
              _hideRePassword ? Icons.visibility_off : Icons.visibility_rounded,
              color: MyColors.brandColor,
            ),
          ),
        ),
        const SizedBox(height: 32),
        CustomButton(
          function: () {},
          widget: const FontPoppins(
            text: Variables.btnRegister,
            size: 16,
            fontWeight: FontWeight.w700,
            color: MyColors.white,
            alignment: TextAlign.center,
          ),
        )
      ],
    );
  }
}
