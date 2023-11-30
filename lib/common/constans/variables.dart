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

  //detail profile
  static const String name = "Name";
  static const String phoneNumber = "Phone Number";
  static const String birthDate = "Birth Date";
  static const String gender = "Gender";
  static const String address = "Address";
  static const String email = "Email";
  static const String noIdentity = "No Identity";

  //edit profile
  static const String pickDate = "Pick Date";
  static const String choosePhoto = "Choose Photo";
  static const String takePhoto = "Take Photo";
  static const String removePhoto = "Remove Photo";

  //report
  static const String city = "City";
  static const String province = "Province";
  static const String subdistrict = "Subdistrict";
  static const String descReport = "Description Report";
  static const String noKip = "No KIP";
  static const String noKks = "No KKS";
  static const String noBpjs = "No BPJS";
  static const String reportEmpty = "List Report's Empty";
  static const String addReport = "Add Report";
  static const String updateReport = "Update Report";
  static const String additional = "Additional";

  //hint
  static const String hintEmail = "Input your email";
  static const String hintPassword = "Input your password";
  static const String hintFullname = "Input your fullname";
  static const String hintRePassword = "Input your retype password";
  static const String hintPhone = "ex: 08xx";
  static const String hintIdIdentity = "ex: 327";
  static const String hintAddress = "Input your address location";
  static const String hintReportDesc = "Input your Report Description";

  //message
  static const String loading = "Loading...";
  static const String msgSuccess = "Success";
  static const String msgSuccessDelete = "Success Delete";
  static const String msgCantEmpty = "Can't empty";
  static const String msgLogout = "Are u sure want to Log Out?";
  static const String msgHttp408 = "Request Time Out";
  static const String msgHttp500 = "Internal Service Error";
  static const String msgPasswordNotSame = "Password not same";
  static const String msgPasswordLenght =
      "Password must have at least 8 characters \n with a mix of uppercase, lowercase, \n symbols, and numbers.";
  static const String msgRemovePhoto = "Are u sure want to remove this photo";
  static const String msgRemoveReport =
      "Are u sure want to remove this report";

  //button
  static const String btnLogin = "Login";
  static const String btnRegister = "Register";
  static const String btnForgotPassword = "Forgot Password";
  static const String btnSubmit = "Submit";
  static const String btnSeeAll = "See All";
  static const String btnLogout = "Logout";
  static const String btnYes = "Yes";
  static const String btnNo = "No";
  static const String btnOkay = "Okay";
  static const String btnUpload = "Upload";

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
