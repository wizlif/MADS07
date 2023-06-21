import 'package:nssf_interview/core/controllers/color.controller.dart';
import 'package:nssf_interview/features/home/models/weather_condition.dart';
import 'package:nssf_interview/features/home/repos/weather/weather_repo.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'location.controller.dart';

part 'weather.controller.g.dart';

@Riverpod(keepAlive: true)
class WeatherController extends _$WeatherController {
  @override
  FutureOr<WeatherCondition> build() async {
    final location = await ref.read(locationControllerProvider.future);

    final weatherRepo = ref.read(weatherRepoProvider);

    final weather = await weatherRepo.getTodaysWeather(
      longitude: location.longitude,
      latitude: location.latitude,
    );

    // Set page color
    ref.read(colorControllerProvider.notifier).setColor(weather.color);

    return weather;
  }
}
