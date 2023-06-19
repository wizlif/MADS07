import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class AppEnv {
  @EnviedField(varName: 'OWM_API_KEY')
  static const String openWeatherMapApiKey = _AppEnv.openWeatherMapApiKey;
}
