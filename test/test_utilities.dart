import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:nssf_interview/features/home/repos/location/i_location_repo.dart';
import 'package:nssf_interview/features/home/repos/location/location_repo.provider.dart';
import 'package:nssf_interview/features/home/repos/weather/i_weather_repo.dart';
import 'package:nssf_interview/features/home/repos/weather/weather_repo.provider.dart';

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
