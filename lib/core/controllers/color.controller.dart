import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'color.controller.g.dart';

@Riverpod(keepAlive: true)
class ColorController extends _$ColorController {
  @override
  Color? build() => null;

  // ignore: use_setters_to_change_properties
  void setColor(Color color) => state = color;
}
