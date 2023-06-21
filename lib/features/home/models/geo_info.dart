import 'package:equatable/equatable.dart';

/// {@template geo_info}
/// GeoInfo description
/// {@endtemplate}
class GeoInfo extends Equatable {
  /// {@macro geo_info}
  const GeoInfo({
    required this.name,
    required this.lat,
    required this.lon,
    required this.country,
    required this.state,
  });

  /// Creates a GeoInfo from Json map
  factory GeoInfo.fromJson(Map<String, dynamic> json) => GeoInfo(
        name: json['name'] as String,
        lat: json['lat'] as double,
        lon: json['lon'] as double,
        country: json['country'] as String,
        state: json['state'] as String,
      );

  /// A description for name
  final String name;

  /// A description for lat
  final double lat;

  /// A description for lon
  final double lon;

  /// A description for country
  final String country;

  /// A description for state
  final String state;

  /// Creates a copy of the current GeoInfo with property changes
  GeoInfo copyWith({
    String? name,
    double? lat,
    double? lon,
    String? country,
    String? state,
  }) {
    return GeoInfo(
      name: name ?? this.name,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      country: country ?? this.country,
      state: state ?? this.state,
    );
  }

  @override
  List<Object?> get props => [
        name,
        lat,
        lon,
        country,
        state,
      ];

  /// Creates a Json map from a GeoInfo
  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'lat': lat,
        'lon': lon,
        'country': country,
        'state': state,
      };
}
