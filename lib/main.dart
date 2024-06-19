import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:football_app/constants/colors.dart';
import 'package:football_app/constants/global_variables.dart';
import 'package:football_app/features/fixtures/data/datasources/fixtures_datasource.dart';
import 'package:football_app/features/fixtures/data/repositories/fixtures_repository_impl.dart';
import 'package:football_app/features/fixtures/domain/repositories/fixtures_repository.dart';
import 'package:football_app/features/fixtures/domain/usecases/get_fixtures.dart';
import 'package:football_app/features/fixtures/domain/usecases/get_statistics.dart';
import 'package:football_app/features/fixtures/presentation/bloc/fixtures_bloc.dart';
import 'package:football_app/features/fixtures/presentation/pages/base_screen.dart';

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

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<Dio>(
          create: (context) => Dio(),
        ),
        RepositoryProvider<FixturesDatasource>(
          create: (context) => FixturesDatasourceImpl(dio: context.read()),
        ),
        RepositoryProvider<FixturesRepository>(
          create: (context) => FixturesRepositoryImpl(
            datasource: context.read(),
          ),
        ),
        RepositoryProvider<GetFixturesUsecase>(
          create: (context) => GetFixturesUsecase(context.read()),
        ),
        RepositoryProvider<GetStatisticsUsecase>(
          create: (context) => GetStatisticsUsecase(context.read()),
        ),
      ],
      child: BlocProvider(
        create: (context) => FixturesBloc(
          getFixturesUsecase: context.read(),
          getStatisticsUsecase: context.read(),
        ),
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
      ),
    );
  }
}
