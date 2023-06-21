part of 'weather_forecast.dart';

extension WeatherForecastListExtension on List<List<WeatherForecast>> {
  Color get color {
    if (isEmpty) return WeatherState.SUNNY.color;

    if (first.isEmpty) return WeatherState.SUNNY.color;

    return first.first.state.color;
  }
}
