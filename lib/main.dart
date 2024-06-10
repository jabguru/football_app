import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:football_app/constants/colors.dart';
import 'package:football_app/constants/global_variables.dart';
import 'package:football_app/pages/base_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarBrightness: Brightness.dark,
    ));

    return MaterialApp(
      title: 'Football App',
      debugShowCheckedModeBanner: false,
      navigatorKey: GlobalVariables.navigatorKey,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: kScaffoldColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: kWhiteColor,
          ),
          titleTextStyle: TextStyle(
            color: kWhiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        fontFamily: 'Poppins',
      ),
      home: const BaseScreen(),
    );
  }
}
