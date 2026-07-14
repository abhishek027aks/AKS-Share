import 'package:flutter/material.dart';

import '../features/devices/devices_screen.dart';
import '../features/home/home_screen.dart';

class AppRoutes {
  AppRoutes._();

  static const String home = '/';
  static const String devices = '/devices';

  static final Map<String, WidgetBuilder> routes = {
    home: (_) => const HomeScreen(),
    devices: (_) => const DevicesScreen(),
  };
}
