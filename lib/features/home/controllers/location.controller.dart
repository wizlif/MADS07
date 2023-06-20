import 'package:geolocator/geolocator.dart';
import 'package:nssf_interview/features/home/repos/location/location_repo.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location.controller.g.dart';

@riverpod
class LocationController extends _$LocationController {
  @override
  FutureOr<Position> build() async {
    state = const AsyncLoading();

    final locationRepo = ref.read(locationRepoProvider);

    return locationRepo.getCurrentLocation();
  }
}
