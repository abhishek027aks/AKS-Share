import 'package:flutter/material.dart';

import '../models/device_model.dart';
import 'device_tile.dart';

class DeviceList extends StatelessWidget {
  final DeviceModel device;
  final bool isScanning;
  final VoidCallback onScan;

  const DeviceList({
    super.key,
    required this.device,
    required this.isScanning,
    required this.onScan,
  });

  @override
  Widget build(BuildContext context) {
    return DeviceTile(
      device: device,
      isScanning: isScanning,
      onRefresh: onScan,
    );
  }
}
