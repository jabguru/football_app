part of 'fixtures_bloc.dart';

abstract class FixturesEvent extends Equatable {
  const FixturesEvent();

  @override
  List<Object> get props => [];
}

class GetFixtures extends FixturesEvent {}
