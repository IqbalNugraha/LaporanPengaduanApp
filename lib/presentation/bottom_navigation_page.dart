import 'package:flutter/material.dart';
import 'package:skripsi_project/presentation/home/home_page.dart';

import '../common/components/custom_circle_avatar.dart';
import '../common/constans/colors.dart';
import '../common/constans/variables.dart';
import 'user_profile/user_profile_page.dart';

class BottomNavigationPage extends StatefulWidget {
  final int selectedIndex;
  const BottomNavigationPage({
    super.key,
    this.selectedIndex = 0,
  });

  @override
  State<BottomNavigationPage> createState() => _BottomNavigationPageState();
}

class _BottomNavigationPageState extends State<BottomNavigationPage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [
    const HomePage(),
    const UserProfilePage(),
  ];

  @override
  void initState() {
    _selectedIndex = widget.selectedIndex;
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        backgroundColor: MyColors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: MyColors.white,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: MyColors.brandColor,
            ),
            label: Variables.navHome,
            activeIcon: CustomCircleAvatar(
              widget: Icon(
                Icons.home,
                color: MyColors.white,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: MyColors.brandColor,
            ),
            label: Variables.navProfile,
            activeIcon: CustomCircleAvatar(
              widget: Icon(
                Icons.person,
                color: MyColors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
