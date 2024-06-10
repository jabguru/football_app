import 'dart:convert';

import 'package:equatable/equatable.dart';

class Fixture {
  final int id;
  final Teams teams;
  final Goals? goals;
  final Status status;
  final String date;
  final int timestamp;
  Fixture({
    required this.id,
    required this.teams,
    this.goals,
    required this.status,
    required this.date,
    required this.timestamp,
  });
}

class Teams extends Equatable {
  final Home home;
  final Away away;
  const Teams({
    required this.home,
    required this.away,
  });

  Teams copyWith({
    Home? home,
    Away? away,
  }) {
    return Teams(
      home: home ?? this.home,
      away: away ?? this.away,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'home': home.toMap(),
      'away': away.toMap(),
    };
  }

  factory Teams.fromMap(Map<String, dynamic> map) {
    return Teams(
      home: Home.fromMap(map['home']),
      away: Away.fromMap(map['away']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Teams.fromJson(String source) => Teams.fromMap(json.decode(source));

  @override
  String toString() => 'Teams(home: $home, away: $away)';

  @override
  List<Object> get props => [home, away];
}

class Home extends Equatable {
  final int id;
  final String name;
  final String logo;
  final bool winner;
  const Home({
    required this.id,
    required this.name,
    required this.logo,
    required this.winner,
  });

  Home copyWith({
    int? id,
    String? name,
    String? logo,
    bool? winner,
  }) {
    return Home(
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

  factory Home.fromMap(Map<String, dynamic> map) {
    return Home(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      logo: map['logo'] ?? '',
      winner: map['winner'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Home.fromJson(String source) => Home.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Home(id: $id, name: $name, logo: $logo, winner: $winner)';
  }

  @override
  List<Object> get props => [id, name, logo, winner];
}

class Away extends Equatable {
  final int id;
  final String name;
  final String logo;
  final bool winner;
  const Away({
    required this.id,
    required this.name,
    required this.logo,
    required this.winner,
  });

  Away copyWith({
    int? id,
    String? name,
    String? logo,
    bool? winner,
  }) {
    return Away(
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

  factory Away.fromMap(Map<String, dynamic> map) {
    return Away(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      logo: map['logo'] ?? '',
      winner: map['winner'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Away.fromJson(String source) => Away.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Away(id: $id, name: $name, logo: $logo, winner: $winner)';
  }

  @override
  List<Object> get props => [id, name, logo, winner];
}

class Goals extends Equatable {
  final int home;
  final int away;
  const Goals({
    required this.home,
    required this.away,
  });

  Goals copyWith({
    int? home,
    int? away,
  }) {
    return Goals(
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

  factory Goals.fromMap(Map<String, dynamic> map) {
    return Goals(
      home: map['home']?.toInt() ?? 0,
      away: map['away']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Goals.fromJson(String source) => Goals.fromMap(json.decode(source));

  @override
  String toString() => 'Goals(home: $home, away: $away)';

  @override
  List<Object> get props => [home, away];
}

class Status extends Equatable {
  final String long;
  final String short;
  final int elapsed;
  const Status({
    required this.long,
    required this.short,
    required this.elapsed,
  });

  Status copyWith({
    String? long,
    String? short,
    int? elapsed,
  }) {
    return Status(
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

  factory Status.fromMap(Map<String, dynamic> map) {
    return Status(
      long: map['long'] ?? '',
      short: map['short'] ?? '',
      elapsed: map['elapsed']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Status.fromJson(String source) => Status.fromMap(json.decode(source));

  @override
  String toString() => 'Status(long: $long, short: $short, elapsed: $elapsed)';

  @override
  List<Object> get props => [long, short, elapsed];
}
