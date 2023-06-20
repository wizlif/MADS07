import 'package:equatable/equatable.dart';

/// {@template todays_sys}
/// TodaysSys description
/// {@endtemplate}
class ConditionSys extends Equatable {
  /// {@macro todays_sys}
  const ConditionSys({
    required this.type,
    required this.id,
    required this.country,
    required this.sunrise,
    required this.sunset,
  });

  /// Creates a TodaysSys from Json map
  factory ConditionSys.fromJson(Map<String, dynamic> json) => ConditionSys(
        type: (json['type'] as num?)?.toInt(),
        id: (json['id'] as num?)?.toInt(),
        country: json['country'] as String,
        sunrise: (json['sunrise'] as num).toInt(),
        sunset: (json['sunset'] as num).toInt(),
      );

  /// A description for type
  final int? type;

  /// A description for id
  final int? id;

  /// A description for country
  final String country;

  /// A description for sunrise
  final int sunrise;

  /// A description for sunset
  final int sunset;

  /// Creates a copy of the current TodaysSys with property changes
  ConditionSys copyWith({
    int? type,
    int? id,
    String? country,
    int? sunrise,
    int? sunset,
  }) {
    return ConditionSys(
      type: type ?? this.type,
      id: id ?? this.id,
      country: country ?? this.country,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
    );
  }

  @override
  List<Object?> get props => [
        type,
        id,
        country,
        sunrise,
        sunset,
      ];

  /// Creates a Json map from a TodaysSys
  Map<String, dynamic> toJson() => <String, dynamic>{
        'type': type,
        'id': id,
        'country': country,
        'sunrise': sunrise,
        'sunset': sunset,
      };
}
