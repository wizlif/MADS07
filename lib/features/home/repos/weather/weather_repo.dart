import 'dart:convert';
import 'dart:isolate';

import 'package:http/http.dart' as http;
import 'package:nssf_interview/env.dart';
import 'package:nssf_interview/features/home/models/geo_info.dart';
import 'package:nssf_interview/features/home/models/weather_condition.dart';
import 'package:nssf_interview/features/home/models/weather_forecast.dart';

import 'i_weather_repo.dart';

/// A repository class for retrieving weather information
/// from the OpenWeather API.
class WeatherRepo implements IWeatherRepo {
  final http.Client httpClient;

  WeatherRepo({required this.httpClient});

  @override
  Future<List<WeatherForecast>> getForecasts({
    required double longitude,
    required double latitude,
  }) async {
    final response = await httpClient.get(
      foreCastUri(
        longitude: longitude,
        latitude: latitude,
      ),
    );

    // Exit if response is not successful
    if (response.statusCode != 200) {
      throw Exception('Error retrieving forecase.');
    }

    // Parse and return weather forecasts
    return Isolate.run(() {
      final json = jsonDecode(response.body) as Map<String, dynamic>;
      final weathersJson = json['list'] as List<dynamic>;

      return weathersJson.map((weatherItem) {
        return WeatherForecast.fromJson(weatherItem as Map<String, dynamic>);
      }).toList();
    });
  }

  @override
  Future<WeatherCondition> getTodaysWeather({
    required double longitude,
    required double latitude,
  }) async {
    final response = await httpClient.get(
      weatherUri(
        longitude: longitude,
        latitude: latitude,
      ),
    );

    // Exit if response is not successful
    if (response.statusCode != 200) {
      throw Exception('Error retrieving weather.');
    }

    // Parse and return today's weather
    return Isolate.run(() {
      final json = jsonDecode(response.body) as Map<String, dynamic>;

      return WeatherCondition.fromJson(json);
    });
  }

  @override
  Future<GeoInfo> getCoordinateInfo(
      {required double longitude, required double latitude}) async {
    final response = await httpClient.get(
      reverseGeoCodeUri(
        longitude: longitude,
        latitude: latitude,
      ),
    );

    // Exit if response is not successful
    if (response.statusCode != 200) {
      return Future.error('Error retrieving location info.');
    }

    // Parse and return today's weather
    return Isolate.run(() {
      final json = jsonDecode(response.body) as List<dynamic>;
      if (json.isEmpty) return Future.error('No locatio info');

      return GeoInfo.fromJson(json.first);
    });
  }
}
