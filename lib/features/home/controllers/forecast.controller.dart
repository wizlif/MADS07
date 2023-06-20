import 'package:collection/collection.dart';
import 'package:nssf_interview/features/home/models/weather_forecast.dart';
import 'package:nssf_interview/features/home/repos/weather/weather_repo.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'location.controller.dart';

part 'forecast.controller.g.dart';

@Riverpod(keepAlive: true)
class ForecastController extends _$ForecastController {
  @override
  FutureOr<List<List<WeatherForecast>>> build() async {
    final location = await ref.read(locationControllerProvider.future);

    final weatherRepo = ref.read(weatherRepoProvider);

    final forecasts = await weatherRepo.getForecasts(
      longitude: location.longitude,
      latitude: location.latitude,
    );

    return forecasts
        .groupListsBy((forecast) => forecast.dt.day)
        .entries
        .map((group) => group.value)
        .toList();
  }
}
