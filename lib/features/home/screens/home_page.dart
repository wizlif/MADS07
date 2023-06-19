import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:nssf_interview/core/utils/context.ext.dart';
import 'package:nssf_interview/features/home/controllers/forecast.controller.dart';
import 'package:nssf_interview/features/home/controllers/weather.controller.dart';
import 'package:nssf_interview/features/home/models/weather_condition.dart';

part 'parts/appbar_delegate.dart';
part 'parts/appbar_header.dart';
part 'parts/weather_forecasts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: WeatherForrecastsList(),
    );
  }
}
