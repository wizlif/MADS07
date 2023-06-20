import 'package:geolocator/geolocator.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nssf_interview/features/home/repos/location/i_location_repo.dart';

// ignore: depend_on_referenced_packages
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

// LocationRepo mock
class MockLocationRepo extends Mock implements ILocationRepo {}

// GeolocatorPlatform mock
class MockGeolocatorPlatform extends Mock
    with MockPlatformInterfaceMixin
    implements GeolocatorPlatform {}

Position get mockPosition => Position(
      latitude: 52.561270,
      longitude: 5.639382,
      timestamp: DateTime.fromMillisecondsSinceEpoch(
        500,
        isUtc: true,
      ),
      altitude: 3000.0,
      accuracy: 0.0,
      heading: 0.0,
      speed: 0.0,
      speedAccuracy: 0.0,
    );
