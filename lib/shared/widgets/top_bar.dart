import 'package:flutter/material.dart';

import '../../core/services/device_service.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final device = DeviceService.currentDevice;

    return Container(
      height: 75,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        border: Border(
          bottom: BorderSide(
            color: Colors.white.withOpacity(0.05),
          ),
        ),
      ),
      child: Row(
        children: [
          const Spacer(),

          // Device Icon
          Icon(
            device.connected
                ? Icons.phone_android_rounded
                : Icons.portable_wifi_off,
            color: device.connected
                ? const Color(0xFF22C55E)
                : Colors.orange,
            size: 22,
          ),

          const SizedBox(width: 10),

          // Connected Text
          const Text(
            "Connected to",
            style: TextStyle(
              color: Colors.white54,
              fontSize: 13,
            ),
          ),

          const SizedBox(width: 6),

          // Device Name
          Text(
            device.connected
                ? device.name
                : "No Device Connected",
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),

          const SizedBox(width: 20),

          // Battery Icon
          Icon(
            device.charging
                ? Icons.battery_charging_full
                : Icons.battery_full,
            color: device.connected
                ? Colors.green
                : Colors.grey,
          ),

          const SizedBox(width: 5),

          // Battery Percentage
          Text(
            device.connected
                ? "${device.battery}%"
                : "--",
            style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
            ),
          ),

          const SizedBox(width: 25),

          // Settings
          IconButton(
            tooltip: "Settings",
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
          ),

          // Theme
          IconButton(
            tooltip: "Toggle Theme",
            onPressed: () {},
            icon: const Icon(
              Icons.dark_mode,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}