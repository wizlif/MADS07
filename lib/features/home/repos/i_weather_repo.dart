import 'package:nssf_interview/features/home/models/weather_condition.dart';
import 'package:nssf_interview/features/home/models/weather_forecast.dart';

abstract class IWeatherRepo {
  Future<List<WeatherForecast>> getForecasts({
    required double longitude,
    required double latitude,
  });

  Future<WeatherCondition> getTodaysWeather({
    required double longitude,
    required double latitude,
  });
}
