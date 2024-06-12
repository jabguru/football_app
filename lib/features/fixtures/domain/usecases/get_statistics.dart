import 'package:dartz/dartz.dart';
import 'package:football_app/core/error/failures.dart';
import 'package:football_app/core/usecase.dart';
import 'package:football_app/features/fixtures/domain/entities/statistics.dart';
import 'package:football_app/features/fixtures/domain/repositories/fixtures_repository.dart';

class GetStatisticsUsecase extends UseCase<Statistics, int> {
  final FixturesRepository repository;

  GetStatisticsUsecase(this.repository);

  @override
  Future<Either<Failure, Statistics?>> call(int params) async {
    return await repository.getStatistics(params);
  }
}
