part of 'weather_forecast.dart';

extension WeatherForecastExtension on WeatherForecast {
  /// Get the weather's day of week e.g Monday
  String get dayOfWeek => DateFormat('EEEE').format(dt);

  /// Weather icon lottie animation
  String get animatedIcon {
    final iconCode = weather.first.icon.split('.').first;
    return 'assets/animations/${iconCode.substring(0, iconCode.length - 1)}.json';
  }

  /// Weather icon
  IconData get icon {
    String iconCode = weather.first.icon.split('.').first;
    iconCode = iconCode.substring(0, iconCode.length - 1);

    switch (iconCode) {
      case '02':
        return WeatherIcons.two;
      case '03':
        return WeatherIcons.three;
      case '04':
        return WeatherIcons.four;
      case '09':
        return WeatherIcons.nine;
      case '10':
        return WeatherIcons.ten;
      case '11':
        return WeatherIcons.eleven;
      case '13':
        return WeatherIcons.thirteen;
      case '50':
        return WeatherIcons.fifty;
      default:
        return WeatherIcons.one;
    }
  }

  /// Weather icon
  Color get color {
    String iconCode = weather.first.icon.split('.').first;
    iconCode = iconCode.substring(0, iconCode.length - 1);

    switch (iconCode) {
      case '02':
        return const Color(0xFF87CBDE);
      case '03':
        return const Color(0xFFd0cccc);
      case '04':
        return const Color(0xFFDAD3E1);
      case '09':
        return const Color(0xFFF0EDDE);
      case '10':
        return const Color(0xFFbad3dd);
      case '11':
        return const Color(0xFFd1d1e3);
      case '13':
        return const Color(0xFFc2cda3);
      case '50':
        return const Color(0xFFc7e1e4);
      default:
        return const Color(0xFFfdcc6c);
    }
  }
}
