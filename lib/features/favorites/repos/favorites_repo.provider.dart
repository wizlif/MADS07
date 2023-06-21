import 'package:hive/hive.dart';
import 'package:nssf_interview/features/favorites/repos/favorites_repo.dart';
import 'package:nssf_interview/features/favorites/repos/i_favorites_repo.dart';
import 'package:nssf_interview/features/home/models/geo_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'favorites_repo.provider.g.dart';

@riverpod
Future<IFavoritesRepo> favoritesRepo(FavoritesRepoRef ref) async {
  final box = await Hive.openBox<GeoInfo>('favorites');
  return FavoritesRepo(box);
}
