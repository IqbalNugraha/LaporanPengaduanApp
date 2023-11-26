import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skripsi_project/presentation/user_profile/widgets/profile_feature_widget.dart';

import '../../common/components/custom_circle_avatar.dart';
import '../../common/components/custom_font.dart';
import '../../common/constans/colors.dart';
import '../../common/constans/images.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  DateTime _currentBackPressTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
          backgroundColor: MyColors.white,
          body: Column(
            children: [
              const SizedBox(height: 32),
              Align(
                alignment: Alignment.center,
                child: CustomCircleAvatar(
                  sizeRadius: 70,
                  widget: Image.asset(
                    ImageAssets.logo,
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const FontPoppins(
                text: "User 1",
                size: 18,
                fontWeight: FontWeight.w500,
                color: MyColors.blackFont,
                alignment: TextAlign.center,
              ),
              const SizedBox(height: 28),
              const Expanded(
                child: ProfileFeatureWidget(),
              ),
            ],
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
