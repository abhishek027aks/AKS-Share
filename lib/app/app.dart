import 'package:flutter/material.dart';

import 'routes.dart';
import 'theme/app_theme.dart';

class AKSShareApp extends StatelessWidget {
  const AKSShareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AKS Share',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      initialRoute: AppRoutes.home,
      routes: AppRoutes.routes,
    );
  }
}