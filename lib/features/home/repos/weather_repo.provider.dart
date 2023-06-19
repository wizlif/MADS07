import 'package:http/http.dart' as http;
import 'package:nssf_interview/features/home/repos/weather_repo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'weather_repo.provider.g.dart';

@Riverpod(keepAlive: true)
WeatherRepo weatherRepo(WeatherRepoRef ref) {
  return WeatherRepo(httpClient: http.Client());
}
