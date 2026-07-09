import 'package:flutter/material.dart';

import '../features/home/home_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String home = '/';

  static final Map<String, WidgetBuilder> routes = {
    home: (_) => const HomeScreen(),
  };
}