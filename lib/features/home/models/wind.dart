import 'package:equatable/equatable.dart';

/// {@template wind}
/// Wind description
/// {@endtemplate}
class Wind extends Equatable {
  /// {@macro wind}
  const Wind({
    required this.speed,
    required this.deg,
    required this.gust,
  });

  /// Creates a Wind from Json map
  factory Wind.fromJson(Map<String, dynamic> json) => Wind(
        speed: (json['speed'] as num).toDouble(),
        deg: (json['deg'] as num).toInt(),
        gust: (json['gust'] as num).toDouble(),
      );

  /// A description for speed
  final double speed;

  /// A description for deg
  final int deg;

  /// A description for gust
  final double gust;

  /// Creates a copy of the current Wind with property changes
  Wind copyWith({
    double? speed,
    int? deg,
    double? gust,
  }) {
    return Wind(
      speed: speed ?? this.speed,
      deg: deg ?? this.deg,
      gust: gust ?? this.gust,
    );
  }

  @override
  List<Object?> get props => [
        speed,
        deg,
        gust,
      ];

  /// Creates a Json map from a Wind
  Map<String, dynamic> toJson() => <String, dynamic>{
        'speed': speed,
        'deg': deg,
        'gust': gust,
      };
}
