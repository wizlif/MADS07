import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nssf_interview/features/home/repos/location/i_location_repo.dart';
import 'package:nssf_interview/features/home/repos/location/location_repo.dart';

import 'location_repo.mock.dart';

void main() {
  late GeolocatorPlatform geolocator;
  late ILocationRepo locationRepo;

  setUp(() {
    geolocator = MockGeolocatorPlatform();
    GeolocatorPlatform.instance = geolocator;

    locationRepo = LocationRepo();
  });

  test(
      'should return an error '
      'when location service is disabled', () async {
    when(() => geolocator.isLocationServiceEnabled())
        .thenAnswer((_) async => false);

    await expectLater(
      locationRepo.getCurrentLocation(),
      throwsA('Location services are disabled.'),
    );

    verify(() => geolocator.isLocationServiceEnabled()).called(1);
    verifyNoMoreInteractions(geolocator);
  });

  test(
      'should request for location permissions '
      'when location service is enabled '
      'and location permission is currently denied '
      'then return an error '
      'when location permission request is denied again', () async {
    when(() => geolocator.isLocationServiceEnabled())
        .thenAnswer((_) async => true);

    when(() => geolocator.checkPermission())
        .thenAnswer((_) async => LocationPermission.denied);

    when(() => geolocator.requestPermission())
        .thenAnswer((_) async => LocationPermission.denied);

    await expectLater(
      locationRepo.getCurrentLocation(),
      throwsA('Location permissions are denied'),
    );

    verify(() => geolocator.isLocationServiceEnabled()).called(1);
    verify(() => geolocator.checkPermission()).called(1);
    verify(() => geolocator.requestPermission()).called(1);
    verifyNoMoreInteractions(geolocator);
  });

  test(
      'should return an error '
      'when location service is denied by user forever', () async {
    when(() => geolocator.isLocationServiceEnabled())
        .thenAnswer((_) async => true);

    when(() => geolocator.checkPermission())
        .thenAnswer((_) async => LocationPermission.deniedForever);

    await expectLater(
      locationRepo.getCurrentLocation(),
      throwsA(
        'Location permissions are permanently denied, we cannot request permissions.',
      ),
    );

    verify(() => geolocator.isLocationServiceEnabled()).called(1);
    verify(() => geolocator.checkPermission()).called(1);
    verifyNoMoreInteractions(geolocator);
  });

  test(
      'should return a location position '
      'when successful', () async {
    when(() => geolocator.isLocationServiceEnabled())
        .thenAnswer((_) async => true);

    when(() => geolocator.checkPermission())
        .thenAnswer((_) async => LocationPermission.whileInUse);

    when(
      () {
        return geolocator.getCurrentPosition(
          locationSettings: any(named: 'locationSettings'),
        );
      },
    ).thenAnswer((_) async => mockPosition);

    final position = await locationRepo.getCurrentLocation();

    await expectLater(position, mockPosition);

    verify(() {
      return geolocator.getCurrentPosition(
        locationSettings: any(named: 'locationSettings'),
      );
    }).called(1);

    verify(() => geolocator.isLocationServiceEnabled()).called(1);
    verify(() => geolocator.checkPermission()).called(1);
    verifyNoMoreInteractions(geolocator);
  });
}
