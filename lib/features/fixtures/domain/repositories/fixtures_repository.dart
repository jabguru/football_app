import 'package:dartz/dartz.dart';
import 'package:football_app/core/error/failures.dart';
import 'package:football_app/features/fixtures/domain/entities/fixture.dart';
import 'package:football_app/features/fixtures/domain/entities/statistics.dart';

abstract class FixturesRepository {
  Future<Either<Failure, List<Fixture>>> getFixtures();
  Future<Either<Failure, Statistics?>> getStatistics(int fixtureId);
}
