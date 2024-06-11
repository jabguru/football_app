import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:football_app/features/fixtures/domain/entities/fixture.dart';

class FixtureModel extends Fixture {
  const FixtureModel({
    required super.id,
    required super.teams,
    required super.status,
    required super.date,
    required super.timestamp,
    super.goals,
  });

  FixtureModel copyWith({
    int? id,
    Teams? teams,
    ValueGetter<GoalsModel?>? goals,
    Status? status,
    String? date,
    int? timestamp,
  }) {
    return FixtureModel(
      id: id ?? this.id,
      teams: teams ?? this.teams,
      goals: goals != null ? goals() : this.goals,
      status: status ?? this.status,
      date: date ?? this.date,
      timestamp: timestamp ?? this.timestamp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'teams': (teams as TeamsModel).toMap(),
      'goals': (goals as GoalsModel?)?.toMap(),
      'status': (status as StatusModel).toMap(),
      'date': date,
      'timestamp': timestamp,
    };
  }

  factory FixtureModel.fromMap(Map<String, dynamic> map) {
    return FixtureModel(
      id: map['fixture']['id']?.toInt() ?? 0,
      teams: TeamsModel.fromMap(map['teams']),
      goals: map['goals'] != null ? GoalsModel.fromMap(map['goals']) : null,
      status: StatusModel.fromMap(map['fixture']['status']),
      date: map['fixture']['date'] ?? '',
      timestamp: map['fixture']['timestamp']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory FixtureModel.fromJson(String source) =>
      FixtureModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Fixture(id: $id, teams: $teams, goals: $goals, status: $status, date: $date, timestamp: $timestamp)';
  }
}

class TeamsModel extends Teams {
  const TeamsModel({
    required super.home,
    required super.away,
  });

  TeamsModel copyWith({
    HomeModel? home,
    AwayModel? away,
  }) {
    return TeamsModel(
      home: home ?? this.home,
      away: away ?? this.away,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'home': (home as HomeModel).toMap(),
      'away': (away as AwayModel).toMap(),
    };
  }

  factory TeamsModel.fromMap(Map<String, dynamic> map) {
    return TeamsModel(
      home: HomeModel.fromMap(map['home']),
      away: AwayModel.fromMap(map['away']),
    );
  }

  String toJson() => json.encode(toMap());

  factory TeamsModel.fromJson(String source) =>
      TeamsModel.fromMap(json.decode(source));

  @override
  String toString() => 'Teams(home: $home, away: $away)';
}

class HomeModel extends Home {
  const HomeModel({
    required super.id,
    required super.name,
    required super.logo,
    required super.winner,
  });

  HomeModel copyWith({
    int? id,
    String? name,
    String? logo,
    bool? winner,
  }) {
    return HomeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      winner: winner ?? this.winner,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
      'winner': winner,
    };
  }

  factory HomeModel.fromMap(Map<String, dynamic> map) {
    return HomeModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      logo: map['logo'] ?? '',
      winner: map['winner'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory HomeModel.fromJson(String source) =>
      HomeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Home(id: $id, name: $name, logo: $logo, winner: $winner)';
  }
}

class AwayModel extends Away {
  const AwayModel({
    required super.id,
    required super.name,
    required super.logo,
    required super.winner,
  });

  AwayModel copyWith({
    int? id,
    String? name,
    String? logo,
    bool? winner,
  }) {
    return AwayModel(
      id: id ?? this.id,
      name: name ?? this.name,
      logo: logo ?? this.logo,
      winner: winner ?? this.winner,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'logo': logo,
      'winner': winner,
    };
  }

  factory AwayModel.fromMap(Map<String, dynamic> map) {
    return AwayModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      logo: map['logo'] ?? '',
      winner: map['winner'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AwayModel.fromJson(String source) =>
      AwayModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Away(id: $id, name: $name, logo: $logo, winner: $winner)';
  }
}

class GoalsModel extends Goals {
  const GoalsModel({
    required super.home,
    required super.away,
  });

  GoalsModel copyWith({
    int? home,
    int? away,
  }) {
    return GoalsModel(
      home: home ?? this.home,
      away: away ?? this.away,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'home': home,
      'away': away,
    };
  }

  factory GoalsModel.fromMap(Map<String, dynamic> map) {
    return GoalsModel(
      home: map['home']?.toInt() ?? 0,
      away: map['away']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory GoalsModel.fromJson(String source) =>
      GoalsModel.fromMap(json.decode(source));

  @override
  String toString() => 'Goals(home: $home, away: $away)';
}

class StatusModel extends Status {
  const StatusModel({
    required super.long,
    required super.short,
    required super.elapsed,
  });

  StatusModel copyWith({
    String? long,
    String? short,
    int? elapsed,
  }) {
    return StatusModel(
      long: long ?? this.long,
      short: short ?? this.short,
      elapsed: elapsed ?? this.elapsed,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'long': long,
      'short': short,
      'elapsed': elapsed,
    };
  }

  factory StatusModel.fromMap(Map<String, dynamic> map) {
    return StatusModel(
      long: map['long'] ?? '',
      short: map['short'] ?? '',
      elapsed: map['elapsed']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory StatusModel.fromJson(String source) =>
      StatusModel.fromMap(json.decode(source));

  @override
  String toString() => 'Status(long: $long, short: $short, elapsed: $elapsed)';

  @override
  List<Object> get props => [long, short, elapsed];
}
