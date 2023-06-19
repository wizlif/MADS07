import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class AppEnv {
  @EnviedField(varName: 'OWM_API_KEY', obfuscate: true)
  final String openWeatherMapApiKey = _AppEnv.openWeatherMapApiKey;

  @EnviedField(varName: 'OWM_API_URL', obfuscate: true)
  final String openWeatherMapApiUrl = _AppEnv.openWeatherMapApiUrl;
}

/// Generates a Uri for an open weather request to retrieve the forecast
/// for [count] days based on the provided longitude and latitude.
///
/// [longitude] - The longitude coordinate.
/// [latitude] - The latitude coordinate.
/// [count] - The number of days for forecast data.
///
/// returns A [Uri] representing the open weather request for the forecast.
Uri foreCastUri({
  required double longitude,
  required double latitude,
  int count = 5,
}) {
  return Uri.parse(
    '${_AppEnv.openWeatherMapApiUrl}/forecast?lat=$latitude&lon=$longitude&appid=${_AppEnv.openWeatherMapApiKey}&units=metric',
  );
}

/// Generates a Uri for an open weather request to retrieve today's weather
/// based on the provided longitude and latitude.
///
/// returns A [Uri] representing the open weather request for today's weather.
Uri weatherUri({required double longitude, required double latitude}) {
  return Uri.parse(
    '${_AppEnv.openWeatherMapApiUrl}/weather?lat=$latitude&lon=$longitude&appid=${_AppEnv.openWeatherMapApiKey}&units=metric',
  );
}
