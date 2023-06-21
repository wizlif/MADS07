import 'package:dartz/dartz.dart';
import 'package:nssf_interview/features/favorites/repos/favorites_repo.provider.dart';
import 'package:nssf_interview/features/home/controllers/geo_info.controller.dart';
import 'package:nssf_interview/features/home/models/geo_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'favorites.controller.dart';

part 'add_to_favorites.controller.g.dart';

@riverpod
class AddToFavoritesController extends _$AddToFavoritesController {
  @override
  FutureOr<Option<Unit>> build() async => none();

  FutureOr<void> markAsFavorite(GeoInfo info) async {
    final favoritesRepo = await ref.read(favoritesRepoProvider.future);
    await favoritesRepo.addFavorite(info);

    ref.read(favoritesControllerProvider.notifier).addFavorite(info);

    state = AsyncData(some(unit));
  }
}
