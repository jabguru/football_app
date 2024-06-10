import 'package:equatable/equatable.dart';

class Statistics extends Equatable {
  final TeamStatistics team1;
  final TeamStatistics team2;
  const Statistics({
    required this.team1,
    required this.team2,
  });

  @override
  List<Object?> get props => [team1, team2];
}

class TeamStatistics extends Equatable {
  final Team team;
  final List<Statistic> statistics;
  const TeamStatistics({
    required this.team,
    required this.statistics,
  });

  @override
  List<Object> get props => [team, statistics];
}

class Team extends Equatable {
  final int id;
  final String name;
  final String logo;
  const Team({
    required this.id,
    required this.name,
    required this.logo,
  });

  @override
  List<Object> get props => [id, name, logo];
}

class Statistic extends Equatable {
  final String type;
  final int value;
  const Statistic({
    required this.type,
    required this.value,
  });

  Statistic copyWith({
    String? type,
    int? value,
  }) {
    return Statistic(
      type: type ?? this.type,
      value: value ?? this.value,
    );
  }

  @override
  List<Object> get props => [type, value];
}
