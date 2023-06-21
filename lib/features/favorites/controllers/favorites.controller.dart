import 'package:nssf_interview/features/favorites/repos/favorites_repo.provider.dart';
import 'package:nssf_interview/features/home/models/geo_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites.controller.g.dart';

@Riverpod(keepAlive: true)
class FavoritesController extends _$FavoritesController {
  @override
  FutureOr<List<GeoInfo>> build() async {
    final favoritesRepo = await ref.read(favoritesRepoProvider.future);

    return favoritesRepo.getWeatherFavorites();
  }

  FutureOr<void> addFavorite(GeoInfo info) async {
    final favs = state.value ?? [];
    final index = favs.indexWhere((element) => element.key == info.key);

    if (index == -1) {
      favs.add(info);

      state = AsyncData(List.from(favs));
    }
  }

  FutureOr<void> removeFavorite(GeoInfo info) async {
    final favs = state.value ?? [];
    final index = favs.indexWhere((element) => element.key == info.key);

    if (index != -1) {
      favs.removeAt(index);

      state = AsyncData(List.from(favs));
    }
  }
}
