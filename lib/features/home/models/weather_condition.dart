import 'package:equatable/equatable.dart';
import 'package:nssf_interview/features/home/models/clouds.dart';
import 'package:nssf_interview/features/home/models/condition_sys.dart';
import 'package:nssf_interview/features/home/models/main.dart';
import 'package:nssf_interview/features/home/models/weather.dart';
import 'package:nssf_interview/features/home/models/wind.dart';

/// {@template todays_weather}
/// TodaysWeather description
/// {@endtemplate}
class WeatherCondition extends Equatable {
  /// {@macro todays_weather}
  const WeatherCondition({
    required this.weather,
    required this.base,
    required this.main,
    required this.visibility,
    required this.wind,
    required this.clouds,
    required this.dt,
    required this.sys,
    required this.timezone,
    required this.id,
    required this.name,
    required this.cod,
  });

  /// Creates a TodaysWeather from Json map
  factory WeatherCondition.fromJson(Map<String, dynamic> json) =>
      WeatherCondition(
        weather: (json['weather'] as List<dynamic>)
            .map((dynamic e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
        base: json['base'] as String,
        main: Main.fromJson(json['main'] as Map<String, dynamic>),
        visibility: json['visibility'] as int,
        wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
        clouds: Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
        dt: json['dt'] as int,
        sys: ConditionSys.fromJson(json['sys'] as Map<String, dynamic>),
        timezone: json['timezone'] as int,
        id: json['id'] as int,
        name: json['name'] as String,
        cod: json['cod'] as int,
      );

  /// A description for weather
  final List<Weather> weather;

  /// A description for base
  final String base;

  /// A description for main
  final Main main;

  /// A description for visibility
  final int visibility;

  /// A description for wind
  final Wind wind;

  /// A description for clouds
  final Clouds clouds;

  /// A description for dt
  final int dt;

  /// A description for sys
  final ConditionSys sys;

  /// A description for timezone
  final int timezone;

  /// A description for id
  final int id;

  /// A description for name
  final String name;

  /// A description for cod
  final int cod;

  /// Creates a copy of the current TodaysWeather with property changes
  WeatherCondition copyWith({
    List<Weather>? weather,
    String? base,
    Main? main,
    int? visibility,
    Wind? wind,
    Clouds? clouds,
    int? dt,
    ConditionSys? sys,
    int? timezone,
    int? id,
    String? name,
    int? cod,
  }) {
    return WeatherCondition(
      weather: weather ?? this.weather,
      base: base ?? this.base,
      main: main ?? this.main,
      visibility: visibility ?? this.visibility,
      wind: wind ?? this.wind,
      clouds: clouds ?? this.clouds,
      dt: dt ?? this.dt,
      sys: sys ?? this.sys,
      timezone: timezone ?? this.timezone,
      id: id ?? this.id,
      name: name ?? this.name,
      cod: cod ?? this.cod,
    );
  }

  @override
  List<Object?> get props => [
        weather,
        base,
        main,
        visibility,
        wind,
        clouds,
        dt,
        sys,
        timezone,
        id,
        name,
        cod,
      ];

  /// Creates a Json map from a TodaysWeather
  Map<String, dynamic> toJson() => <String, dynamic>{
        'weather': weather.map((w) => w.toJson()).toList(),
        'base': base,
        'main': main.toJson(),
        'visibility': visibility,
        'wind': wind.toJson(),
        'clouds': clouds.toJson(),
        'dt': dt,
        'sys': sys.toJson(),
        'timezone': timezone,
        'id': id,
        'name': name,
        'cod': cod,
      };
}
