import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:football_app/core/error/exceptions.dart';
import 'package:football_app/core/error/failures.dart';
import 'package:football_app/features/fixtures/data/datasources/fixtures_datasource.dart';
import 'package:football_app/features/fixtures/domain/entities/fixture.dart';
import 'package:football_app/features/fixtures/domain/repositories/fixtures_repository.dart';

class FixturesRepositoryImpl implements FixturesRepository {
  final FixturesDatasource datasource;
  FixturesRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<Fixture>>> getFixtures() async {
    try {
      final result = await datasource.getFixtures();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    } on TimeoutException {
      return Left(ServerFailure());
    } on SocketException {
      return Left(NetworkFailure());
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError ||
          e.type == DioExceptionType.connectionTimeout) {
        return Left(NetworkFailure());
      }
      return Left(ServerFailure());
    }
  }
}
