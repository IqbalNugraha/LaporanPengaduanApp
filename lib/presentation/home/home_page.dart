import 'package:flutter/material.dart';
import 'package:skripsi_project/presentation/home/widgets/home_appbar_widget.dart';

import '../../common/constans/colors.dart';
import '../report/report_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: MyColors.white,
        body: Column(
          children: [
            SizedBox(height: 42),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: HomeAppbarWidget(),
            ),
            SizedBox(height: 32),
            Expanded(
              child: ReportPage(),
            ),
          ],
        ),
      ),
    );
  }
}
