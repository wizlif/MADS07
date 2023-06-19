import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:nssf_interview/core/router.dart';

class BaseApp extends StatelessWidget {
  const BaseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      theme: FlexThemeData.light(
        scheme: FlexScheme.flutterDash,
      ).copyWith(
        textTheme: ThemeData.light().textTheme.apply(
              bodyColor: Colors.white,
              displayColor: Colors.white,
            ),
      ),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.flutterDash),
      themeMode: ThemeMode.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
