import 'package:equatable/equatable.dart';

/// {@template main}
/// Main description
/// {@endtemplate}
class Main extends Equatable {
  /// {@macro main}
  const Main({
    required this.temp,
    required this.feels_like,
    required this.temp_min,
    required this.temp_max,
    required this.pressure,
    required this.sea_level,
    required this.grnd_level,
    required this.humidity,
    this.temp_kf,
  });

  /// Creates a Main from Json map
  factory Main.fromJson(Map<String, dynamic> json) => Main(
        temp: (json['temp'] as num).toDouble(),
        feels_like: (json['feels_like'] as num?)?.toDouble(),
        temp_min: (json['temp_min'] as num).toDouble(),
        temp_max: (json['temp_max'] as num).toDouble(),
        pressure: (json['pressure'] as num?)?.toInt(),
        sea_level: (json['sea_level'] as num?)?.toInt(),
        grnd_level: (json['grnd_level'] as num?)?.toInt(),
        humidity: (json['humidity'] as num?)?.toInt(),
        temp_kf: (json['temp_kf'] as num?)?.toDouble(),
      );

  /// A description for temp
  final double temp;

  /// A description for feels_like
  final double? feels_like;

  /// A description for temp_min
  final double temp_min;

  /// A description for temp_max
  final double temp_max;

  /// A description for pressure
  final int? pressure;

  /// A description for sea_level
  final int? sea_level;

  /// A description for grnd_level
  final int? grnd_level;

  /// A description for humidity
  final int? humidity;

  /// A description for temp_kf
  final double? temp_kf;

  /// Creates a copy of the current Main with property changes
  Main copyWith({
    double? temp,
    double? feels_like,
    double? temp_min,
    double? temp_max,
    int? pressure,
    int? sea_level,
    int? grnd_level,
    int? humidity,
    double? Function()? temp_kf,
  }) {
    return Main(
      temp: temp ?? this.temp,
      feels_like: feels_like ?? this.feels_like,
      temp_min: temp_min ?? this.temp_min,
      temp_max: temp_max ?? this.temp_max,
      pressure: pressure ?? this.pressure,
      sea_level: sea_level ?? this.sea_level,
      grnd_level: grnd_level ?? this.grnd_level,
      humidity: humidity ?? this.humidity,
      temp_kf: temp_kf != null ? temp_kf() : this.temp_kf,
    );
  }

  @override
  List<Object?> get props => [
        temp,
        feels_like,
        temp_min,
        temp_max,
        pressure,
        sea_level,
        grnd_level,
        humidity,
        temp_kf,
      ];

  /// Creates a Json map from a Main
  Map<String, dynamic> toJson() => <String, dynamic>{
        'temp': temp,
        'feels_like': feels_like,
        'temp_min': temp_min,
        'temp_max': temp_max,
        'pressure': pressure,
        'sea_level': sea_level,
        'grnd_level': grnd_level,
        'humidity': humidity,
        'temp_kf': temp_kf,
      };
}
