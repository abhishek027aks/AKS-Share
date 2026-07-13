import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../features/devices/provider/device_provider.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DeviceProvider>();
    final device = provider.device;
    final isConnected = device.isConnected;

    return Container(
      height: 75,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        border: Border(
          bottom: BorderSide(color: Colors.white.withOpacity(0.05)),
        ),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final showConnectionLabel = constraints.maxWidth >= 520;
          final showBattery = constraints.maxWidth >= 420;

          return Row(
            children: [
              const Expanded(child: SizedBox()),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: showBattery ? 280 : 190),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      isConnected
                          ? Icons.phone_android_rounded
                          : Icons.portable_wifi_off,
                      color: isConnected
                          ? const Color(0xFF22C55E)
                          : Colors.orange,
                      size: 22,
                    ),
                    const SizedBox(width: 10),
                    if (showConnectionLabel) ...[
                      const Text(
                        'Connected to',
                        style: TextStyle(color: Colors.white54, fontSize: 13),
                      ),
                      const SizedBox(width: 6),
                    ],
                    Flexible(
                      child: Text(
                        isConnected ? device.name : device.connectionStatus,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (showBattery) ...[
                const SizedBox(width: 18),
                Icon(
                  Icons.battery_full,
                  color: isConnected ? Colors.green : Colors.grey,
                ),
                const SizedBox(width: 5),
                Text(
                  isConnected ? '${device.battery}%' : '--',
                  style: const TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
              const SizedBox(width: 12),
              IconButton(
                tooltip: 'Settings',
                onPressed: () {},
                icon: const Icon(Icons.settings, color: Colors.white),
              ),
              IconButton(
                tooltip: 'Toggle Theme',
                onPressed: () {},
                icon: const Icon(Icons.dark_mode, color: Colors.white),
              ),
            ],
          );
        },
      ),
    );
  }
}
