import 'package:dartz/dartz.dart';
import 'package:football_app/core/error/failures.dart';
import 'package:football_app/core/usecase.dart';
import 'package:football_app/features/fixtures/domain/entities/fixture.dart';
import 'package:football_app/features/fixtures/domain/repositories/fixtures_repository.dart';

class GetFixturesUsecase extends UseCase<List<Fixture>> {
  final FixturesRepository repository;

  GetFixturesUsecase(this.repository);

  @override
  Future<Either<Failure, List<Fixture>>> call() async {
    return await repository.getFixtures();
  }
}
