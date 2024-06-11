import 'package:dio/dio.dart';
import 'package:football_app/features/fixtures/data/datasources/fixtures_datasource.dart';
import 'package:football_app/features/fixtures/data/repositories/fixtures_repository_impl.dart';
import 'package:football_app/features/fixtures/domain/repositories/fixtures_repository.dart';
import 'package:football_app/features/fixtures/domain/usecases/get_fixtures.dart';
import 'package:football_app/features/fixtures/presentation/bloc/fixtures_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setupLocator() {
// ! EXTERNALS
  sl.registerSingleton(Dio());

  // ! FEATURE - FIXTURES
  // ? DATASOURCE
  sl.registerSingleton<FixturesDatasource>(
    FixturesDatasourceImpl(dio: sl()),
  );

  // ? REPOSITORY
  sl.registerSingleton<FixturesRepository>(
    FixturesRepositoryImpl(datasource: sl()),
  );

  // ? USE CASES
  sl.registerSingleton(GetFixturesUsecase(sl()));

  // ? BLOC
  sl.registerFactory(
    () => FixturesBloc(
      getFixturesUsecase: sl(),
    ),
  );
}
