import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skripsi_project/bloc/account/get_account/get_account_bloc.dart';
import 'package:skripsi_project/bloc/raja_ongkir/get_city/get_city_bloc.dart';
import 'package:skripsi_project/bloc/raja_ongkir/get_province/get_province_bloc.dart';
import 'package:skripsi_project/bloc/raja_ongkir/get_subdistrict/get_subdistrict_bloc.dart';
import 'package:skripsi_project/bloc/report/add_report/add_report_bloc.dart';
import 'package:skripsi_project/bloc/report/get_all_report/get_all_report_bloc.dart';
import 'package:skripsi_project/bloc/util/pick_report_image/pick_report_image_bloc.dart';
import 'package:skripsi_project/presentation/splash_page.dart';

import 'bloc/auth/login/login_bloc.dart';
import 'bloc/auth/register/register_bloc.dart';
import 'common/constans/colors.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: MyColors.brandColor,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        //auth
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),

        //account
        BlocProvider(
          create: (context) =>
              GetAccountBloc()..add(const GetAccountEvent.getAccount()),
        ),

        //report
        BlocProvider(
          create: (context) =>
              GetAllReportBloc()..add(const GetAllReportEvent.getAllReport()),
        ),
        BlocProvider(
          create: (context) => AddReportBloc(),
        ),

        //raja-ongkir
        BlocProvider(
          create: (context) => GetProvinceBloc(),
        ),
        BlocProvider(
          create: (context) => GetCityBloc(),
        ),
        BlocProvider(
          create: (context) => GetSubdistrictBloc(),
        ),

        //util
        BlocProvider(
          create: (context) => PickReportImageBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
