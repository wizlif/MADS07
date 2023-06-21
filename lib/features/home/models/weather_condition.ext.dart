part of 'weather_condition.dart';

extension WeatherConditionExtension on WeatherCondition {
  /// Weather icon lottie animation
  // String get animatedIcon {
  //   return 'assets/animations/$iconCode.json';
  // }

  /// Weather background
  String get background {
    return 'assets/images/sea_${state.value}.png';
  }

  /// Weather icon
  Color get color {
    switch (state) {
      case WeatherState.SUNNY:
        return const Color(0xFF47AB2F);
      case WeatherState.CLOUDY:
        return const Color(0xFF54717A);
      case WeatherState.RAINY:
        return const Color(0xFF57575D);
    }
  }
}

enum WeatherState {
  SUNNY('sunny'),
  CLOUDY('cloudy'),
  RAINY('rainy');

  final String value;
  const WeatherState(this.value);
}

extension WeatherExtension on WeatherState {
  Color get color {
    switch (this) {
      case WeatherState.SUNNY:
        return const Color(0xFF4A90E2);
      case WeatherState.CLOUDY:
        return const Color(0xFF628593);
      case WeatherState.RAINY:
        return const Color(0xFF57575C);
    }
  }
}

extension ConditionListExtension on List<Weather> {
  WeatherState get weatherState {
    final c = first.icon.split('.').first;
    final code = c.substring(0, c.length - 1);

    if (code == '01') {
      return WeatherState.SUNNY;
    } else if (['02', '03', '04'].contains(code)) {
      return WeatherState.CLOUDY;
    }

    return WeatherState.RAINY;
  }
}
