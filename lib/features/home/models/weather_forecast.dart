import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:nssf_interview/core/utils/num.ext.dart';
import 'package:nssf_interview/features/home/models/clouds.dart';
import 'package:nssf_interview/features/home/models/main.dart';
import 'package:nssf_interview/features/home/models/sys.dart';
import 'package:nssf_interview/features/home/models/weather.dart';
import 'package:nssf_interview/features/home/models/wind.dart';

/// {@template day_weather}
/// DayWeather description
/// {@endtemplate}
class WeatherForecast extends Equatable {
  /// {@macro day_weather}
  const WeatherForecast({
    required this.dt,
    required this.main,
    required this.weather,
    required this.clouds,
    required this.wind,
    required this.visibility,
    required this.pop,
    required this.sys,
    required this.dt_txt,
  });

  /// Creates a DayWeather from Json map
  factory WeatherForecast.fromJson(Map<String, dynamic> json) =>
      WeatherForecast(
        dt: (json['dt'] as int).toDateTime,
        main: Main.fromJson(json['main'] as Map<String, dynamic>),
        weather: (json['weather'] as List<dynamic>)
            .map((dynamic e) => Weather.fromJson(e as Map<String, dynamic>))
            .toList(),
        clouds: Clouds.fromJson(json['clouds'] as Map<String, dynamic>),
        wind: Wind.fromJson(json['wind'] as Map<String, dynamic>),
        visibility: (json['visibility'] as num).toInt(),
        pop: (json['pop'] as num).toDouble(),
        sys: Sys.fromJson(json['sys'] as Map<String, dynamic>),
        dt_txt: json['dt_txt'] as String,
      );

  /// A description for dt
  final DateTime dt;

  /// A description for main
  final Main main;

  /// A description for weather
  final List<Weather> weather;

  /// A description for clouds
  final Clouds clouds;

  /// A description for wind
  final Wind wind;

  /// A description for visibility
  final int visibility;

  /// A description for pop
  final double pop;

  /// A description for sys
  final Sys sys;

  /// A description for dt_txt
  final String dt_txt;

  /// Creates a copy of the current DayWeather with property changes
  WeatherForecast copyWith({
    DateTime? dt,
    Main? main,
    List<Weather>? weather,
    Clouds? clouds,
    Wind? wind,
    int? visibility,
    double? pop,
    Sys? sys,
    String? dt_txt,
  }) {
    return WeatherForecast(
      dt: dt ?? this.dt,
      main: main ?? this.main,
      weather: weather ?? this.weather,
      clouds: clouds ?? this.clouds,
      wind: wind ?? this.wind,
      visibility: visibility ?? this.visibility,
      pop: pop ?? this.pop,
      sys: sys ?? this.sys,
      dt_txt: dt_txt ?? this.dt_txt,
    );
  }

  @override
  List<Object?> get props => [
        dt,
        main,
        weather,
        clouds,
        wind,
        visibility,
        pop,
        sys,
        dt_txt,
      ];

  /// Creates a Json map from a DayWeather
  Map<String, dynamic> toJson() => <String, dynamic>{
        'dt': dt,
        'main': main.toJson(),
        'weather': weather.map((w) => w.toJson()).toList(),
        'clouds': clouds.toJson(),
        'wind': wind.toJson(),
        'visibility': visibility,
        'pop': pop,
        'sys': sys.toJson(),
        'dt_txt': dt_txt,
      };

  /// Get the weather's day of week e.g Monday
  String get dayOfWeek => DateFormat('EEEE').format(dt);
}
