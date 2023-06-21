import 'package:nssf_interview/features/favorites/controllers/current_geoinfo.controller.dart';
import 'package:nssf_interview/features/home/controllers/location.controller.dart';
import 'package:nssf_interview/features/home/models/geo_info.dart';
import 'package:nssf_interview/features/home/repos/weather/weather_repo.provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'geo_info.controller.g.dart';

@riverpod
class GeoInfoController extends _$GeoInfoController {
  @override
  FutureOr<GeoInfo> build() async {
    state = const AsyncLoading();

    final location = await ref.watch(locationControllerProvider.future);

    final weatherRepo = ref.read(weatherRepoProvider);

    final info = await weatherRepo.getCoordinateInfo(
      longitude: location.longitude,
      latitude: location.latitude,
    );

    ref.read(currentGeoInfoControllerProvider.notifier).setPosition(info);

    return info;
  }
}
