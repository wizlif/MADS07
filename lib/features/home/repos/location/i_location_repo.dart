import 'package:geolocator/geolocator.dart';

abstract class ILocationRepo {
  Future<Position> getCurrentLocation();
}
