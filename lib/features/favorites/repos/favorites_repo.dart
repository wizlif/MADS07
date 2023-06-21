import 'package:hive/hive.dart';
import 'package:nssf_interview/features/favorites/repos/i_favorites_repo.dart';
import 'package:nssf_interview/features/home/models/geo_info.dart';

class FavoritesRepo implements IFavoritesRepo {
  final Box<GeoInfo> favoritesBox;

  FavoritesRepo(this.favoritesBox);

  @override
  List<GeoInfo> getWeatherFavorites() {
    return favoritesBox.values.toList();
  }

  @override
  Future<void> addFavorite(GeoInfo info) => favoritesBox.put(info.key, info);

  @override
  Future<void> deleteFavorite(GeoInfo info) => favoritesBox.delete(info.key);
}
