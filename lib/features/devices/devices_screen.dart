import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../shared/widgets/app_sidebar.dart';
import '../../shared/widgets/top_bar.dart';
import 'provider/device_provider.dart';
import 'widgets/device_list.dart';

class DevicesScreen extends StatelessWidget {
  const DevicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<DeviceProvider>();
    final device = provider.device;

    return Scaffold(
      backgroundColor: const Color(0xFF0B1120),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const AppSidebar(),
          Expanded(
            child: Column(
              children: [
                const TopBar(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Device Manager',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    'Detect and manage phones connected by USB, Wi-Fi, hotspot, or internet.',
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 15,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 18),
                            ElevatedButton.icon(
                              onPressed: provider.isScanning
                                  ? null
                                  : provider.scanDevices,
                              icon: provider.isScanning
                                  ? const SizedBox(
                                      width: 16,
                                      height: 16,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Icon(Icons.usb_rounded),
                              label: Text(
                                provider.isScanning
                                    ? 'Scanning'
                                    : 'Scan Devices',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 24),
                        DeviceList(
                          device: device,
                          isScanning: provider.isScanning,
                          onScan: provider.scanDevices,
                        ),
                        const SizedBox(height: 18),
                        _DeviceInfoPanel(
                          title: 'Connection',
                          rows: [
                            _InfoRow(
                              'Status',
                              provider.isScanning
                                  ? 'Scanning'
                                  : provider.hasScanned
                                  ? provider.scanMessage
                                  : device.connectionStatus,
                            ),
                            _InfoRow('Type', device.connectionType),
                            _InfoRow(
                              'Device ID',
                              device.id.isEmpty ? '--' : device.id,
                            ),
                            _InfoRow(
                              'IP Address',
                              device.ipAddress.isEmpty
                                  ? '--'
                                  : device.ipAddress,
                            ),
                            _InfoRow(
                              'Last Scan',
                              provider.lastScannedAt == null
                                  ? '--'
                                  : _formatTime(provider.lastScannedAt!),
                            ),
                          ],
                        ),
                        const SizedBox(height: 18),
                        _DeviceInfoPanel(
                          title: 'Device Information',
                          rows: [
                            _InfoRow(
                              'Brand',
                              device.brand.isEmpty ? '--' : device.brand,
                            ),
                            _InfoRow(
                              'Model',
                              device.model.isEmpty ? '--' : device.model,
                            ),
                            _InfoRow(
                              'Android',
                              device.androidVersion.isEmpty
                                  ? '--'
                                  : device.androidVersion,
                            ),
                            _InfoRow(
                              'Battery',
                              device.isConnected ? '${device.battery}%' : '--',
                            ),
                            _InfoRow(
                              'Storage',
                              device.totalStorage > 0
                                  ? '${device.usedStorage.toStringAsFixed(1)} GB / ${device.totalStorage.toStringAsFixed(1)} GB'
                                  : '--',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour.toString().padLeft(2, '0');
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final second = dateTime.second.toString().padLeft(2, '0');
    return '$hour:$minute:$second';
  }
}

class _DeviceInfoPanel extends StatelessWidget {
  final String title;
  final List<_InfoRow> rows;

  const _DeviceInfoPanel({required this.title, required this.rows});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF111827),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.white10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w800,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(spacing: 14, runSpacing: 14, children: rows),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const _InfoRow(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 240,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white54, fontSize: 12),
          ),
          const SizedBox(height: 5),
          Text(
            value,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
