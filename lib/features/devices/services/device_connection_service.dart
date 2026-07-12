import '../models/device_model.dart';
import '../models/device_connection_type.dart';
import '../models/device_status.dart';
import 'adb_service.dart';

class DeviceConnectionService {
  Future<DeviceModel> getCurrentDevice() async {
    final isAdbInstalled = await AdbService.isAdbInstalled();

    if (!isAdbInstalled) {
      return const DeviceModel.empty(status: DeviceStatus.adbMissing);
    }

    final devices = await AdbService.getConnectedDevices();

    if (devices.isEmpty) {
      final hasUnauthorizedDevice = await AdbService.hasUnauthorizedDevice();
      return DeviceModel.empty(
        status: hasUnauthorizedDevice
            ? DeviceStatus.unauthorized
            : DeviceStatus.disconnected,
      );
    }

    final id = devices.first;

    final results = await Future.wait([
      AdbService.getModel(id),
      AdbService.getBrand(id),
      AdbService.getAndroidVersion(id),
      AdbService.getIpAddress(id),
    ]);
    final battery = await AdbService.getBattery(id);
    final storage = await AdbService.getStorageInfo(id);

    final model = results[0];
    final brand = results[1];
    final android = results[2];
    final ipAddress = results[3];
    final deviceName = '$brand $model'.trim();

    return DeviceModel(
      id: id,
      name: deviceName.isEmpty ? id : deviceName,
      model: model,
      brand: brand,
      androidVersion: android,
      status: DeviceStatus.connected,
      connectionTypeValue: DeviceConnectionType.usb,
      battery: battery,
      ipAddress: ipAddress == 'Unknown' ? '' : ipAddress,
      totalStorage: storage['total'] ?? 0.0,
      usedStorage: storage['used'] ?? 0.0,
    );
  }
}
