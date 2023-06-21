import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nssf_interview/features/home/models/weather_condition.dart';
import 'package:nssf_interview/features/home/models/weather_forecast.dart';
import 'package:nssf_interview/features/home/repos/location/i_location_repo.dart';
import 'package:nssf_interview/features/home/repos/location/location_repo.provider.dart';
import 'package:nssf_interview/features/home/repos/weather/i_weather_repo.dart';
import 'package:nssf_interview/features/home/repos/weather/weather_repo.provider.dart';
import 'package:nssf_interview/features/home/screens/home_page.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../repos/location/location_repo.mock.dart';
import '../../repos/weather/weather_repo.mock.dart';

void main() {
  late IWeatherRepo weatherRepo;
  late ILocationRepo locationRepo;

  setUp(() {
    weatherRepo = MockWeatherRepo();
    locationRepo = MockLocationRepo();

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
  });

  testWidgets('should display current weather and forecats', (tester) async {
    await tester.pumpWeatherForecastsList(
      locationRepo: locationRepo,
      weatherRepo: weatherRepo,
    );

    await tester.pumpAndSettle();
    expect(find.byType(SliverPersistentHeader), findsOneWidget);
    expect(find.byType(AppbarHeader), findsOneWidget);
    expect(find.byType(ForecastsList), findsOneWidget);
  });

  testWidgets(
      'should display error '
      'when an exception occurs loading weather', (tester) async {
    final exception = Exception('Some error occured');

    when(
      () => weatherRepo.getForecasts(
        longitude: any(named: 'longitude'),
        latitude: any(named: 'latitude'),
      ),
    ).thenThrow(exception);

    await tester.pumpWeatherForecastsList(
      locationRepo: locationRepo,
      weatherRepo: weatherRepo,
    );

    await tester.pumpAndSettle();
    expect(find.byType(SliverPersistentHeader), findsNothing);
    expect(find.byType(AppbarHeader), findsNothing);
    expect(find.byType(ForecastsList), findsNothing);
    expect(find.text(exception.toString()), findsOneWidget);
  });
}

extension WidgetTesterX on WidgetTester {
  Future<void> pumpWeatherForecastsList({
    required ILocationRepo locationRepo,
    required IWeatherRepo weatherRepo,
  }) async {
    await pumpWidget(
      ProviderScope(
        overrides: [
          locationRepoProvider.overrideWithValue(locationRepo),
          weatherRepoProvider.overrideWithValue(weatherRepo)
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: WeatherForecastsList(),
          ),
        ),
      ),
    );
  }
}
