import 'package:equatable/equatable.dart';

class Fixture extends Equatable {
  final int id;
  final Teams teams;
  final Status status;
  final String date;
  final int timestamp;
  final Goals? goals;
  const Fixture({
    required this.id,
    required this.teams,
    required this.status,
    required this.date,
    required this.timestamp,
    this.goals,
  });

  @override
  List<Object?> get props {
    return [
      id,
      teams,
      goals,
      status,
      date,
      timestamp,
    ];
  }
}

class Teams extends Equatable {
  final Home home;
  final Away away;
  const Teams({
    required this.home,
    required this.away,
  });

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

  @override
  List<Object> get props => [long, short, elapsed];
}
