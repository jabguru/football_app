import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/constants/colors.dart';
import 'package:football_app/constants/global_variables.dart';
import 'package:football_app/features/fixtures/presentation/bloc/fixtures_bloc.dart';
import 'package:football_app/features/fixtures/presentation/pages/base_screen.dart';
import 'package:football_app/injection_container.dart';

void main() {
  setupLocator();
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

    return BlocProvider(
      create: (context) => sl<FixturesBloc>(),
      child: MaterialApp(
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
      ),
    );
  }
}
