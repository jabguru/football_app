part of 'fixtures_bloc.dart';

abstract class FixturesState extends Equatable {
  const FixturesState();

  @override
  List<Object> get props => [];
}

class FixturesInitial extends FixturesState {}

class GetFixturesLoading extends FixturesState {}

class GetFixturesLoaded extends FixturesState {
  final List<Fixture> fixtures;
  const GetFixturesLoaded({
    required this.fixtures,
  });

  @override
  List<Object> get props => [fixtures];
}

class GetFixturesError extends FixturesState {
  final String message;
  const GetFixturesError(this.message);

  @override
  List<Object> get props => [message];
}
