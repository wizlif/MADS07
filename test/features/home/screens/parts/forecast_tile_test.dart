import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nssf_interview/features/home/models/weather_forecast.dart';
import 'package:nssf_interview/features/home/screens/home_page.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  testWidgets('should display respective weather info', (tester) async {
    final forecast = WeatherForecast.fromJson(
      jsonDecode(
        fixture('weather_forecast.json'),
      ),
    );

    await tester.pumpForecastTile(forecast);

    expect(find.text(forecast.dayOfWeek), findsOneWidget);
    expect(find.byIcon(forecast.icon), findsOneWidget);
    expect(find.text('${forecast.main.temp_max.toInt()}°'), findsOneWidget);
  });
}

extension WidgetTesterX on WidgetTester {
  Future<void> pumpForecastTile(WeatherForecast forecast) async {
    await pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: ForecastTile(forecast: forecast),
        ),
      ),
    );
  }
}
