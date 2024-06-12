part of 'fixtures_bloc.dart';

abstract class FixturesEvent extends Equatable {
  const FixturesEvent();

  @override
  List<Object> get props => [];
}

class GetFixtures extends FixturesEvent {}

class GetStatistics extends FixturesEvent {
  final int fixtureId;
  const GetStatistics({
    required this.fixtureId,
  });

  @override
  List<Object> get props => [fixtureId];
}
