import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nssf_interview/features/home/models/weather_forecast.dart';
import 'package:nssf_interview/features/home/screens/home_page.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  testWidgets('should render all weather forecasts', (tester) async {
    final jsonForecasts =
        jsonDecode(fixture('forecast.json')) as Map<String, dynamic>;

    final weatherForecasts = (jsonForecasts['list'] as List<dynamic>)
        .map((e) => WeatherForecast.fromJson(e as Map<String, dynamic>))
        .groupListsBy((forecast) => forecast.dt.day)
        .entries
        .map((group) => group.value)
        .toList();

    await tester.pumpForecastsList(weatherForecasts);
    await tester.pumpAndSettle();
    expect(
      find.byType(ForecastTile),
      findsNWidgets(
        weatherForecasts.length - 1,
      ),
    );
  });
}

extension WidgetTesterX on WidgetTester {
  Future<void> pumpForecastsList(
    List<List<WeatherForecast>> weatherForecasts,
  ) async {
    await pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomScrollView(
            slivers: [
              ForecastsList(
                forecasts: weatherForecasts,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
