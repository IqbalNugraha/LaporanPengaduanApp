import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skripsi_project/data/models/request/auth/login_request_model.dart';

import '../../../../bloc/auth/login/login_bloc.dart';
import '../../../../common/components/custom_button.dart';
import '../../../../common/components/custom_font.dart';
import '../../../../common/components/custom_loading_state.dart';
import '../../../../common/components/custom_text_field.dart';
import '../../../../common/constans/colors.dart';
import '../../../../common/constans/images.dart';
import '../../../../common/constans/navigation.dart';
import '../../../../common/constans/variables.dart';
import '../../../../data/datasources/local_datasources.dart';
import '../../../bottom_navigation_page.dart';
import '../../register_page.dart';
import '../component_row_widget.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _hidePassword = true;
  String? _errorText;

  @override
  void initState() {
    emailController.addListener(() {
      if (emailController.text.isEmpty && passwordController.text.isEmpty) {
        setState(() {
          _errorText = Variables.msgCantEmpty;
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              ImageAssets.logo,
              height: 250,
              width: 250,
            ),
          ),
          SizedBox(
            width: size.width,
            child: const FontPoppins(
              text: Variables.greetingLogin,
              size: 16,
              fontWeight: FontWeight.w600,
              color: MyColors.lightGrey,
              alignment: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          const ComponentRowWidget(
            icon: Icons.email,
            title: Variables.enterPassword,
          ),
          const SizedBox(height: 8),
          CustomTextField(
            controller: emailController,
            hint: Variables.hintEmail,
            errorText: _errorText,
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
          const SizedBox(height: 28),
          BlocConsumer<LoginBloc, LoginState>(
            builder: (context, state) {
              return state.maybeWhen(
                orElse: () {
                  return CustomButton(
                    width: size.width,
                    function: () {
                      final model = LoginModel(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                      context.read<LoginBloc>().add(LoginEvent.login(model));
                    },
                    widget: const FontPoppins(
                      text: Variables.btnLogin,
                      size: 16,
                      fontWeight: FontWeight.w700,
                      color: MyColors.white,
                      alignment: TextAlign.start,
                    ),
                  );
                },
                loading: () {
                  return const CustomLoadingState();
                },
              );
            },
            listener: (context, state) {
              state.maybeWhen(
                orElse: () {},
                success: (response) {
                  LocalDatasource().saveAuthData(response);
                  Navigations.pushAndRemoveNavigation(
                    context,
                    const BottomNavigationPage(),
                  );
                },
                error: (error) {
                  Fluttertoast.showToast(msg: error);
                },
              );
            },
          ),
          const SizedBox(height: 14),
          GestureDetector(
            onTap: () {
              // Navigations.pushNavigation(
              //   context,
              //   const ForgotPasswordPage(),
              // );
            },
            child: SizedBox(
              width: size.width,
              child: const FontPoppins(
                text: "${Variables.btnForgotPassword}?",
                size: 14,
                fontWeight: FontWeight.w600,
                color: MyColors.brandColor,
                alignment: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 28),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const FontPoppins(
                text: Variables.notHaveAccount,
                size: 14,
                fontWeight: FontWeight.w400,
                color: MyColors.lightGrey,
                alignment: TextAlign.center,
              ),
              const SizedBox(width: 4),
              GestureDetector(
                onTap: () {
                  Navigations.pushNavigation(
                    context,
                    const RegisterPage(),
                  );
                },
                child: const FontPoppins(
                  text: Variables.btnRegister,
                  size: 14,
                  fontWeight: FontWeight.w600,
                  color: MyColors.brandColor,
                  alignment: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
