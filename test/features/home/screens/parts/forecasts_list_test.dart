import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:nssf_interview/features/home/repos/location/location_repo.provider.dart';
import 'package:nssf_interview/features/home/repos/weather/weather_repo.provider.dart';
import 'package:nssf_interview/features/home/screens/home_page.dart';

import '../../../../test_utilities.dart';

void main() {
  late MockRepos mockRepos;

  setUpAll(() {
    mockRepos = setUpMocRepos();
  });

  testWidgets('should render all weather forecasts', (tester) async {
    await tester.pumpForecastsList(mockRepos: mockRepos);
    await tester.pumpAndSettle();
    expect(
      find.byType(ForecastTile),
      findsOneWidget,
    );
  });
}

extension WidgetTesterX on WidgetTester {
  Future<void> pumpForecastsList({
    required MockRepos mockRepos,
  }) async {
    await pumpWidget(
      ProviderScope(
        overrides: [
          locationRepoProvider.overrideWithValue(mockRepos.locationRepo),
          weatherRepoProvider.overrideWithValue(mockRepos.weatherRepo),
        ],
        child: const MaterialApp(
          home: Scaffold(
            body: CustomScrollView(
              slivers: [
                ForecastsList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
