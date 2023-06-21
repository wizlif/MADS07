import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hive/hive.dart';

part 'geo_info.g.dart';

/// {@template geo_info}
/// GeoInfo description
/// {@endtemplate}
@HiveType(typeId: 1)
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
  @HiveField(0)
  final String name;

  /// A description for lat
  @HiveField(1)
  final double lat;

  /// A description for lon
  @HiveField(2)
  final double lon;

  /// A description for country
  @HiveField(3)
  final String country;

  /// A description for state
  @HiveField(4)
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

  // Hive key
  String get key => '$lat-$lon';

  factory GeoInfo.fromPosition(Position position) {
    return GeoInfo(
      name: '',
      lat: position.latitude,
      lon: position.longitude,
      country: '',
      state: '',
    );
  }
}
