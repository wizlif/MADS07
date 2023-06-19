part of 'weather_condition.dart';

extension WeatherConditionExtension on WeatherCondition {

  /// Weather icon lottie animation
  String get animatedIcon {
    final iconCode = weather.first.icon.split('.').first;
    return 'assets/animations/${iconCode.substring(0, iconCode.length - 1)}.json';
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
