import 'package:nssf_interview/features/home/models/geo_info.dart';

abstract class IFavoritesRepo {
  List<GeoInfo> getWeatherFavorites();

  Future<void> addFavorite(GeoInfo info);

  Future<void> deleteFavorite(GeoInfo info);
}
