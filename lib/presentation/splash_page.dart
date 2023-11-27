import 'package:flutter/material.dart';

import '../common/constans/colors.dart';
import '../common/constans/navigation.dart';
import '../data/datasources/local_datasources.dart';
import 'auth/login_page.dart';
import 'bottom_navigation_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    _checkAuth();
    super.initState();
  }

  void _checkAuth() async {
    final auth = await LocalDatasource().isLogin();
    if (auth == true) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigations.pushAndRemoveNavigation(
          context,
          const BottomNavigationPage(),
        );
      });
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Navigations.pushAndRemoveNavigation(
          context,
          const LoginPage(),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.brokenWhite,
      body: Center(
        child: Image.asset(
          "assets/png/logo.png",
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
