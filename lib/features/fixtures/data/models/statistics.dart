import 'dart:convert';

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

  TeamStatistics copyWith({
    Team? team,
    List<Statistic>? statistics,
  }) {
    return TeamStatistics(
      team: team ?? this.team,
      statistics: statistics ?? this.statistics,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'team': team.toMap(),
      'statistics': statistics.map((x) => x.toMap()).toList(),
    };
  }

  factory TeamStatistics.fromMap(Map<String, dynamic> map) {
    return TeamStatistics(
      team: Team.fromMap(map['team']),
      statistics: List<Statistic>.from(
          map['statistics']?.map((x) => Statistic.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory TeamStatistics.fromJson(String source) =>
      TeamStatistics.fromMap(json.decode(source));

  @override
  String toString() => 'Statistics(team: $team, statistics: $statistics)';

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

  Team copyWith({
    int? id,
    String? name,
    String? logo,
  }) {
    return Team(
      id: id ?? this.id,
      name: name ?? this.name,
      logo: logo ?? this.logo,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
    };
  }

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      logo: map['logo'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Team.fromJson(String source) => Team.fromMap(json.decode(source));

  @override
  String toString() => 'Team(id: $id, name: $name, logo: $logo)';

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

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'value': value,
    };
  }

  factory Statistic.fromMap(Map<String, dynamic> map) {
    return Statistic(
      type: map['type'] ?? '',
      value: map['value']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Statistic.fromJson(String source) =>
      Statistic.fromMap(json.decode(source));

  @override
  String toString() => 'Statistic(type: $type, value: $value)';

  @override
  List<Object> get props => [type, value];
}
