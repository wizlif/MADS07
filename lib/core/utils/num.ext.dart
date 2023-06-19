extension NumExtension on num {
  /// Convert epoch to [DateTime]
  DateTime get toDateTime =>
      DateTime.fromMillisecondsSinceEpoch(toInt() * 1000);
}
