import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nssf_interview/features/home/models/weather_condition.dart';
import 'package:nssf_interview/features/home/models/weather_forecast.dart';
import 'package:nssf_interview/features/home/repos/weather/i_weather_repo.dart';
import 'package:nssf_interview/features/home/repos/weather/weather_repo.dart';

import '../../../../fixtures/fixture_reader.dart';
import '../../../../test_utilities.dart';

void main() {
  late IWeatherRepo weatherRepo;
  late final MockHttpClient client;

  setUpAll(() {
    registerFallbackValue(Uri());

    client = MockHttpClient();
    weatherRepo = WeatherRepo(httpClient: client);
  });

  group('[getForecasts]', () {
    test(
        'should throw an exception '
        'when the http request status code is not 200', () async {
      // arrange
      when(() => client.get(any()))
          .thenAnswer((invocation) => Future.value(Response('', 400)));

      // act
      await expectLater(
        weatherRepo.getForecasts(
          longitude: 0,
          latitude: 0,
        ),
        throwsA(isA<Exception>()),
      );

      verify(() => client.get(any())).called(1);
      verifyNoMoreInteractions(client);
    });

    test(
        'should return a list of forecasts '
        'when the http request status code is 200', () async {
      final forecastJson = fixture('forecast.json');
      // arrange
      when(() => client.get(any())).thenAnswer(
        (invocation) => Future.value(Response(forecastJson, 200)),
      );

      // act
      final forecasts = await weatherRepo.getForecasts(
        longitude: 0,
        latitude: 0,
      );

      expect(forecasts.length, 5);
      expect(forecasts.first, isA<WeatherForecast>());

      verify(() => client.get(any())).called(1);
      verifyNoMoreInteractions(client);
    });
  });

  group('[getTodaysWeather]', () {
    test(
        'should throw an exception '
        'when the http request status code is not 200', () async {
      // arrange
      when(() => client.get(any()))
          .thenAnswer((invocation) => Future.value(Response('', 400)));

      // act
      await expectLater(
        () async => weatherRepo.getTodaysWeather(
          longitude: 0,
          latitude: 0,
        ),
        throwsA(isA<Exception>()),
      );

      verify(() => client.get(any())).called(1);
      verifyNoMoreInteractions(client);
    });

    test(
        "should return today's weather "
        'when the http request status code is 200', () async {
      final weatherConditionJson = fixture('weather_condition.json');
      // arrange
      when(() => client.get(any())).thenAnswer(
        (invocation) => Future.value(Response(weatherConditionJson, 200)),
      );

      // act
      final weatherCondition = await weatherRepo.getTodaysWeather(
        longitude: 0,
        latitude: 0,
      );

      await expectLater(weatherCondition, isA<WeatherCondition>());

      verify(() => client.get(any())).called(1);
      verifyNoMoreInteractions(client);
    });
  });
}
