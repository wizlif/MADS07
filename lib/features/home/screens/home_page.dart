import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:nssf_interview/core/controllers/color.controller.dart';
import 'package:nssf_interview/core/utils/context.ext.dart';
import 'package:nssf_interview/features/favorites/controllers/add_to_favorites.controller.dart';
import 'package:nssf_interview/features/favorites/controllers/current_geoinfo.controller.dart';
import 'package:nssf_interview/features/favorites/controllers/is_liked.controller.dart';
import 'package:nssf_interview/features/favorites/controllers/remove_from_favorites.controller.dart';
import 'package:nssf_interview/features/home/controllers/forecast.controller.dart';
import 'package:nssf_interview/features/home/controllers/geo_info.controller.dart';
import 'package:nssf_interview/features/home/controllers/weather.controller.dart';
import 'package:nssf_interview/features/home/models/weather_condition.dart';
import 'package:nssf_interview/features/home/models/weather_forecast.dart';

part 'parts/appbar_delegate.dart';
part 'parts/appbar_header.dart';
part 'parts/forecast_tile.dart';
part 'parts/forecasts_list.dart';
part 'parts/geo_info_text.dart';
part 'parts/like_button.dart';
part 'parts/weather_forecasts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const WeatherForecastsList(),
      floatingActionButton: Consumer(
        builder: (_, WidgetRef ref, __) {
          final forecastsSync = ref.watch(forecastControllerProvider);

          final color = ref.watch(colorControllerProvider);

          return forecastsSync.maybeWhen(
            data: (_) {
              return FloatingActionButton.extended(
                onPressed: () => context.push('/favorites'),
                label: const Text('View Favorites'),
                foregroundColor: color,
                backgroundColor: Colors.white,
              );
            },
            orElse: () => const SizedBox.shrink(),
          );
        },
      ),
    );
  }
}
