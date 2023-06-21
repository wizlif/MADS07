import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:nssf_interview/features/home/models/weather_condition.dart';
import 'package:nssf_interview/features/home/models/weather_forecast.dart';
import 'package:nssf_interview/features/home/repos/location/i_location_repo.dart';
import 'package:nssf_interview/features/home/repos/location/location_repo.provider.dart';
import 'package:nssf_interview/features/home/repos/weather/i_weather_repo.dart';
import 'package:nssf_interview/features/home/repos/weather/weather_repo.provider.dart';

import 'features/home/repos/location/location_repo.mock.dart';
import 'features/home/repos/weather/weather_repo.mock.dart';
import 'fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

// a generic Listener class, used to keep track of when a provider notifies its listeners
class Listener<T> extends Mock {
  void call(T? previous, T next);
}

/// a helper method to create a ProviderContainer that overrides the
/// repository providers
ProviderContainer makeProviderContainer({
  ILocationRepo? locationRepo,
  IWeatherRepo? weatherRepo,
  void Function(dynamic Function() callback)? addTearDown,
}) {
  final container = ProviderContainer(
    overrides: [
      if (locationRepo != null) ...[
        locationRepoProvider.overrideWithValue(
          locationRepo,
        ),
      ],
      if (weatherRepo != null) ...[
        weatherRepoProvider.overrideWithValue(
          weatherRepo,
        ),
      ],
    ],
  );

  addTearDown?.call(container.dispose);
  return container;
}

// Setup positive weather and location repo
MockRepos setUpMocRepos() {
  final weatherRepo = MockWeatherRepo();
  final locationRepo = MockLocationRepo();

  // Setup weather forecast
  final jsonForecasts =
      jsonDecode(fixture('forecast.json')) as Map<String, dynamic>;
  final weatherForecast = (jsonForecasts['list'] as List<dynamic>)
      .map((e) => WeatherForecast.fromJson(e as Map<String, dynamic>))
      .toList();

  when(
    () => weatherRepo.getForecasts(
      longitude: any(named: 'longitude'),
      latitude: any(named: 'latitude'),
    ),
  ).thenAnswer((_) async => weatherForecast);

  // Setup weather condition
  final json = jsonDecode(fixture('weather_condition.json'));
  final weatherCondition = WeatherCondition.fromJson(json);

  when(
    () => weatherRepo.getTodaysWeather(
      longitude: any(named: 'longitude'),
      latitude: any(named: 'latitude'),
    ),
  ).thenAnswer((_) async => weatherCondition);

  // Setup Location
  when(() => locationRepo.getCurrentLocation())
      .thenAnswer((_) async => mockPosition);

  return MockRepos(weatherRepo, locationRepo);
}

class MockRepos {
  final IWeatherRepo weatherRepo;
  final ILocationRepo locationRepo;

  MockRepos(this.weatherRepo, this.locationRepo);
}
