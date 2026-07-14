import 'package:flutter/material.dart';

import '../models/device_model.dart';

class DeviceTile extends StatelessWidget {
  final DeviceModel device;
  final VoidCallback? onRefresh;
  final bool isScanning;

  const DeviceTile({
    super.key,
    required this.device,
    this.onRefresh,
    this.isScanning = false,
  });

  @override
  Widget build(BuildContext context) {
    final isConnected = device.isConnected;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isConnected ? const Color(0xFF22C55E) : Colors.white10,
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: isConnected
                ? const Color(0xFF22C55E)
                : const Color(0xFF374151),
            child: Icon(
              isConnected ? Icons.phone_android_rounded : Icons.usb_off_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  isConnected ? device.name : 'No device connected',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  isConnected
                      ? '${device.connectionType} - ${device.connectionStatus}'
                      : device.connectionStatus,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white60, fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          OutlinedButton.icon(
            onPressed: isScanning ? null : onRefresh,
            icon: isScanning
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.refresh_rounded, size: 18),
            label: Text(isConnected ? 'Refresh' : 'Scan'),
          ),
        ],
      ),
    );
  }
}
