import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nssf_interview/features/home/controllers/forecast.controller.dart';
import 'package:nssf_interview/features/home/models/weather_forecast.dart';
import 'package:nssf_interview/features/home/repos/location/i_location_repo.dart';
import 'package:nssf_interview/features/home/repos/weather/i_weather_repo.dart';

import '../../../fixtures/fixture_reader.dart';
import '../../../test_utilities.dart';
import '../repos/location/location_repo.mock.dart';
import '../repos/weather/weather_repo.mock.dart';

void main() {
  late IWeatherRepo weatherRepo;
  late ILocationRepo locationRepo;

  setUp(() {
    registerFallbackValue(const AsyncLoading<List<List<WeatherForecast>>>());
    registerFallbackValue(const AsyncValue.data(<List<WeatherForecast>>[]));
    weatherRepo = MockWeatherRepo();
    locationRepo = MockLocationRepo();
  });

  test(
      'should load weather forecast '
      'when initialized', () async {
    // Setup weather
    final json = jsonDecode(fixture('forecast.json')) as Map<String, dynamic>;
    final weatherForecast = (json['list'] as List<dynamic>)
        .map((e) => WeatherForecast.fromJson(e as Map<String, dynamic>))
        .toList();

    when(
      () => weatherRepo.getForecasts(
        longitude: any(named: 'longitude'),
        latitude: any(named: 'latitude'),
      ),
    ).thenAnswer((_) async => weatherForecast);

    // Setup Location
    when(() => locationRepo.getCurrentLocation())
        .thenAnswer((_) async => mockPosition);

    final container = makeProviderContainer(
      locationRepo: locationRepo,
      weatherRepo: weatherRepo,
      addTearDown: addTearDown,
    );

    // create a listener
    final listener = Listener<AsyncValue<List<List<WeatherForecast>>>>();
    // listen to the provider and call [listener] whenever its value changes
    container.listen(
      forecastControllerProvider,
      listener,
      fireImmediately: true,
    );

    await container.read(forecastControllerProvider.future);

    // verify
    verifyInOrder([
      () => listener(
            null,
            const AsyncLoading(),
          ),
      () => listener(
            any(that: isA<AsyncLoading>()),
            any(
              that: isA<AsyncData>(),
            ),
          ),
    ]);

    verify(() => locationRepo.getCurrentLocation()).called(1);
    verify(
      () => weatherRepo.getForecasts(
        longitude: any(named: 'longitude'),
        latitude: any(named: 'latitude'),
      ),
    ).called(1);

    // verify that the listener is no longer called
    verifyNoMoreInteractions(listener);
  });
}
