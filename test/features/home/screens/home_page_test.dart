import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:nssf_interview/features/home/repos/location/i_location_repo.dart';
import 'package:nssf_interview/features/home/repos/location/location_repo.provider.dart';
import 'package:nssf_interview/features/home/repos/weather/i_weather_repo.dart';
import 'package:nssf_interview/features/home/repos/weather/weather_repo.provider.dart';
import 'package:nssf_interview/features/home/screens/home_page.dart';

import '../../../test_utilities.dart';

void main() {
  Hive.init(Directory.current.path);

  late MockRepos mockRepos;

  setUp(() {
    mockRepos = setUpMocRepos();
  });

  testWidgets('should render home page', (tester) async {
    await tester.pumpHomePage(
      locationRepo: mockRepos.locationRepo,
      weatherRepo: mockRepos.weatherRepo,
    );

    await tester.pumpAndSettle();

    expect(find.byType(WeatherForecastsList), findsOneWidget);
  });
}

extension WidgetTesterX on WidgetTester {
  Future<void> pumpHomePage({
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
            body: HomePage(),
          ),
        ),
      ),
    );
  }
}
