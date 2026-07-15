import '../models/device_model.dart';
import '../models/device_connection_type.dart';
import '../models/device_connection_result.dart';
import '../models/device_status.dart';
import 'adb_gateway.dart';

class DeviceConnectionService {
  final AdbGateway adbGateway;

  const DeviceConnectionService({
    this.adbGateway = const ProcessAdbGateway(),
  });

  Future<DeviceModel> getCurrentDevice() async {
    final result = await scanCurrentDevice();
    return result.device;
  }

  Future<DeviceConnectionResult> scanCurrentDevice() async {
    final isAdbInstalled = await adbGateway.isAdbInstalled();

    if (!isAdbInstalled) {
      return DeviceConnectionResult.empty(DeviceStatus.adbMissing);
    }

    final devices = await adbGateway.getConnectedDevices();

    if (devices.isEmpty) {
      final hasUnauthorizedDevice = await adbGateway.hasUnauthorizedDevice();
      return DeviceConnectionResult.empty(
        hasUnauthorizedDevice
            ? DeviceStatus.unauthorized
            : DeviceStatus.disconnected,
      );
    }

    final id = devices.first;

    final results = await Future.wait([
      adbGateway.getModel(id),
      adbGateway.getBrand(id),
      adbGateway.getAndroidVersion(id),
      adbGateway.getIpAddress(id),
    ]);
    final battery = await adbGateway.getBattery(id);
    final storage = await adbGateway.getStorageInfo(id);

    final model = results[0];
    final brand = results[1];
    final android = results[2];
    final ipAddress = results[3];
    final deviceName = '$brand $model'.trim();

    final device = DeviceModel(
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

    return DeviceConnectionResult.connected(device);
  }
}
