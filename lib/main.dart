import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app/app.dart';
import 'features/devices/provider/device_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DeviceProvider(autoScanOnStart: true),
        ),
      ],
      child: const AKSShareApp(),
    ),
  );
}
