import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/app_page.dart';

void main() {
  runApp(const ProviderScope(child: BaseApp()));
}
