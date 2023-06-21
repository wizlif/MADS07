import 'package:dartz/dartz.dart';
import 'package:nssf_interview/features/favorites/repos/favorites_repo.provider.dart';
import 'package:nssf_interview/features/home/models/geo_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'favorites.controller.dart';

part 'remove_from_favorites.controller.g.dart';

@riverpod
class RemoveFromFavoritesController extends _$RemoveFromFavoritesController {
  @override
  FutureOr<Option<Unit>> build() async => none();

  FutureOr<void> removeFavorite(GeoInfo info) async {
    final favoritesRepo = await ref.read(favoritesRepoProvider.future);

    await favoritesRepo.deleteFavorite(info);

    ref.read(favoritesControllerProvider.notifier).removeFavorite(info);

    state = AsyncData(some(unit));
  }
}
