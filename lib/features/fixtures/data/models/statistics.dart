import 'dart:convert';

import 'package:football_app/features/fixtures/domain/entities/statistics.dart';

class StatisticsModel extends Statistics {
  const StatisticsModel({
    required super.team1,
    required super.team2,
  });

  @override
  List<Object> get props => [team1, team2];

  StatisticsModel copyWith({
    TeamStatisticsModel? team1,
    TeamStatisticsModel? team2,
  }) {
    return StatisticsModel(
      team1: team1 ?? this.team1,
      team2: team2 ?? this.team2,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'team1': (team1 as TeamStatisticsModel).toMap(),
      'team2': (team2 as TeamStatisticsModel).toMap(),
    };
  }

  factory StatisticsModel.fromMap(Map<String, dynamic> map) {
    return StatisticsModel(
      team1: TeamStatisticsModel.fromMap(map['team1']),
      team2: TeamStatisticsModel.fromMap(map['team2']),
    );
  }

  String toJson() => json.encode(toMap());

  factory StatisticsModel.fromJson(String source) =>
      StatisticsModel.fromMap(json.decode(source));

  @override
  String toString() => 'Statistics(team1: $team1, team2: $team2)';
}

class TeamStatisticsModel extends TeamStatistics {
  const TeamStatisticsModel({
    required super.team,
    required super.statistics,
  });

  TeamStatisticsModel copyWith({
    TeamModel? team,
    List<StatisticModel>? statistics,
  }) {
    return TeamStatisticsModel(
      team: team ?? this.team,
      statistics: statistics ?? this.statistics,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'team': (team as TeamModel).toMap(),
      'statistics':
          statistics.map((x) => (x as StatisticModel).toMap()).toList(),
    };
  }

  factory TeamStatisticsModel.fromMap(Map<String, dynamic> map) {
    return TeamStatisticsModel(
      team: TeamModel.fromMap(map['team']),
      statistics: List<StatisticModel>.from(
          map['statistics']?.map((x) => StatisticModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory TeamStatisticsModel.fromJson(String source) =>
      TeamStatisticsModel.fromMap(json.decode(source));

  @override
  String toString() => 'Statistics(team: $team, statistics: $statistics)';

  @override
  List<Object> get props => [team, statistics];
}

class TeamModel extends Team {
  const TeamModel({
    required super.id,
    required super.name,
    required super.logo,
  });

  TeamModel copyWith({
    int? id,
    String? name,
    String? logo,
  }) {
    return TeamModel(
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

  factory TeamModel.fromMap(Map<String, dynamic> map) {
    return TeamModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      logo: map['logo'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TeamModel.fromJson(String source) =>
      TeamModel.fromMap(json.decode(source));

  @override
  String toString() => 'Team(id: $id, name: $name, logo: $logo)';

  @override
  List<Object> get props => [id, name, logo];
}

class StatisticModel extends Statistic {
  const StatisticModel({
    required super.type,
    required super.value,
  });

  @override
  StatisticModel copyWith({
    String? type,
    String? value,
  }) {
    return StatisticModel(
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

  factory StatisticModel.fromMap(Map<String, dynamic> map) {
    return StatisticModel(
      type: map['type'] ?? '',
      value:
          map['value'] is int ? map['value'].toString() : (map['value'] ?? ''),
    );
  }

  String toJson() => json.encode(toMap());

  factory StatisticModel.fromJson(String source) =>
      StatisticModel.fromMap(json.decode(source));

  @override
  String toString() => 'Statistic(type: $type, value: $value)';

  @override
  List<Object> get props => [type, value];
}
