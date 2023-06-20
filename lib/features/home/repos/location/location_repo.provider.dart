import 'package:nssf_interview/features/home/repos/location/i_location_repo.dart';
import 'package:nssf_interview/features/home/repos/location/location_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'location_repo.provider.g.dart';

@Riverpod(keepAlive: true)
ILocationRepo locationRepo(LocationRepoRef ref) {
  return LocationRepo();
}
