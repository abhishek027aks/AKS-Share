import 'device_model.dart';
import 'device_status.dart';

class DeviceConnectionResult {
  final DeviceModel device;
  final DeviceStatus status;
  final String message;
  final DateTime scannedAt;

  const DeviceConnectionResult({
    required this.device,
    required this.status,
    required this.message,
    required this.scannedAt,
  });

  bool get isConnected => status == DeviceStatus.connected;

  factory DeviceConnectionResult.connected(DeviceModel device) {
    return DeviceConnectionResult(
      device: device,
      status: DeviceStatus.connected,
      message: '${device.connectionType} device connected',
      scannedAt: DateTime.now(),
    );
  }

  factory DeviceConnectionResult.empty(DeviceStatus status) {
    return DeviceConnectionResult(
      device: DeviceModel.empty(status: status),
      status: status,
      message: status.label,
      scannedAt: DateTime.now(),
    );
  }

  factory DeviceConnectionResult.failed(String message) {
    return DeviceConnectionResult(
      device: const DeviceModel.empty(status: DeviceStatus.error),
      status: DeviceStatus.error,
      message: message,
      scannedAt: DateTime.now(),
    );
  }
}
