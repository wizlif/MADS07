import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nssf_interview/features/home/controllers/weather.controller.dart';
import 'package:nssf_interview/features/home/models/weather_condition.dart';
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
    weatherRepo = MockWeatherRepo();
    locationRepo = MockLocationRepo();
  });

  test(
      'should load weather conditions '
      'when initialized', () async {
    // Setup weather
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

    final container = makeProviderContainer(
      locationRepo: locationRepo,
      weatherRepo: weatherRepo,
      addTearDown: addTearDown,
    );

    // create a listener
    final listener = Listener<AsyncValue<WeatherCondition>>();
    // listen to the provider and call [listener] whenever its value changes
    container.listen(
      weatherControllerProvider,
      listener,
      fireImmediately: true,
    );

    await container.read(weatherControllerProvider.future);

    // verify
    verifyInOrder([
      () => listener(null, const AsyncLoading<WeatherCondition>()),
      () => listener(
            const AsyncLoading<WeatherCondition>(),
            AsyncData<WeatherCondition>(weatherCondition),
          ),
    ]);

    verify(() => locationRepo.getCurrentLocation()).called(1);
    verify(
      () => weatherRepo.getTodaysWeather(
        longitude: any(named: 'longitude'),
        latitude: any(named: 'latitude'),
      ),
    ).called(1);

    // verify that the listener is no longer called
    verifyNoMoreInteractions(listener);
  });
}
