import 'package:dartz/dartz.dart';
import 'package:football_app/core/error/failures.dart';

abstract class UseCase<Type> {
  Future<Either<Failure, Type>> call();
}
