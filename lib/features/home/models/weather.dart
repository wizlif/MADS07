import 'package:equatable/equatable.dart';

/// {@template weather}
/// Weather description
/// {@endtemplate}
class Weather extends Equatable {
  /// {@macro weather}
  const Weather({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });

  /// Creates a Weather from Json map
  factory Weather.fromJson(Map<String, dynamic> json) => Weather(
        id: json['id'] as int,
        main: json['main'] as String,
        description: json['description'] as String,
        icon: json['icon'] as String,
      );

  /// A description for id
  final int id;

  /// A description for main
  final String main;

  /// A description for description
  final String description;

  /// A description for icon
  final String icon;

  /// Creates a copy of the current Weather with property changes
  Weather copyWith({
    int? id,
    String? main,
    String? description,
    String? icon,
  }) {
    return Weather(
      id: id ?? this.id,
      main: main ?? this.main,
      description: description ?? this.description,
      icon: icon ?? this.icon,
    );
  }

  @override
  List<Object?> get props => [
        id,
        main,
        description,
        icon,
      ];

  /// Creates a Json map from a Weather
  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'main': main,
        'description': description,
        'icon': icon,
      };
}
