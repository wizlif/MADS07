import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nssf_interview/features/home/models/geo_info.dart';

import 'current_geoinfo.controller.dart';
import 'favorites.controller.dart';

final isLikedProvider = Provider((ref) {
  final favorites = ref.watch(favoritesControllerProvider);
  final info = ref.watch(currentGeoInfoControllerProvider);

  final favList = favorites.maybeWhen(
    data: (data) => data,
    orElse: () => <GeoInfo>[],
  );

  final geoInfo = info.fold(() => null, (a) => a);

  return favList.indexWhere((f) => f.key == geoInfo?.key) != -1;
});
