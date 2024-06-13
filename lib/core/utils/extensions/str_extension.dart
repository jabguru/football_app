import 'dart:developer' as dev;

extension StrFormat on String {
  String get firstCapital {
    List<String> values = split('');
    values[0] = values[0].toUpperCase();
    return values.join();
  }

  String get snakeToCamelTitleCase {
    List<String> values = split('_');
    List<String> newValues = [];
    for (var e in values) {
      newValues.add(e.firstCapital);
    }
    return newValues.join(' ');
  }

  void log() {
    dev.log(this);
  }
}
