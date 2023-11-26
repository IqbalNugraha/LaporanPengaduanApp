import 'package:flutter/material.dart';
import 'package:skripsi_project/common/constans/colors.dart';

class Variables {
  //login
  static const String greetingLogin = "Hello there, login to continue";
  static const String enterEmail = "Enter Email";
  static const String enterPassword = "Password";
  static const String notHaveAccount = "Doesn't have an account yet?";

  //register
  static const String greetingRegister = "Register to create an account";
  static const String enterFullname = "Fullname";
  static const String enterRePassword = "Retype Password";
  static const String enterRepassword = "Retype Password";

  //bottom-navigation
  static const String navHome = "Home";
  static const String navProfile = "Profile";

  //profile
  static const String profile = "Profile";
  static const String editProfile = "Edit Profile";
  static const String aboutUs = "About Us";
  static const String logout = "Log Out";

  //hint
  static const String hintEmail = "Input your email";
  static const String hintPassword = "Input your password";
  static const String hintFullname = "Input your fullname";
  static const String hintRePassword = "Input your retype password";
  static const String hintPhone = "ex: 08xx";

  //message
  static const String msgSuccess = "Success";
  static const String msgCantEmpty = "Can't empty";
  static const String msgLogout = "Are u sure want to Log Out?";
  static const String msgHttp408 = "Request Time Out";
  static const String msgHttp500 = "Internal Service Error";
  static const String msgPasswordNotSame = "Password not same";
  static const String msgPasswordLenght =
      "Password must have at least 8 characters \n with a mix of uppercase, lowercase, \n symbols, and numbers.";

  //button
  static const String btnLogin = "Login";
  static const String btnRegister = "Register";
  static const String btnForgotPassword = "Forgot Password";
  static const String btnSubmit = "Submit";
  static const String btnSeeAll = "See All";
  static const String btnLogout = "Logout";
  static const String btnYes = "Yes";
  static const String btnNo = "No";

  // shadow
  static const List<BoxShadow> shadowRadius1 = [
    BoxShadow(
      color: MyColors.shadow,
      blurRadius: 1,
      spreadRadius: 1,
    ),
  ];

  static const List<BoxShadow> shadowRadius8 = [
    BoxShadow(
      color: MyColors.shadow,
      blurRadius: 8,
      spreadRadius: 1,
    ),
  ];
}
