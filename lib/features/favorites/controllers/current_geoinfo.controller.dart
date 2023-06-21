import 'package:dartz/dartz.dart';
import 'package:nssf_interview/features/home/models/geo_info.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_geoinfo.controller.g.dart';

@Riverpod(keepAlive: true)
class CurrentGeoInfoController extends _$CurrentGeoInfoController {
  @override
  Option<GeoInfo> build() => none();

  void setPosition(GeoInfo info) {
    state = some(info);
  }
}
