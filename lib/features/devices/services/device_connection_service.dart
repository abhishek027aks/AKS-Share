import '../models/device_model.dart';
import 'adb_service.dart';

class DeviceConnectionService {
  static Future<DeviceModel> getCurrentDevice() async {
    final devices = await AdbService.getConnectedDevices();

    if (devices.isEmpty) {
      return DeviceModel.empty();
    }

    final id = devices.first;

    final model = await AdbService.getModel(id);
    final brand = await AdbService.getBrand(id);
    final android = await AdbService.getAndroidVersion(id);
    final battery = await AdbService.getBattery(id);

    return DeviceModel(
      id: id,
      name: model,
      model: model,
      brand: brand,
      androidVersion: android,
      battery: battery,
      isConnected: true,
      isUsb: true,
      isWifi: false,
      ipAddress: "",
      totalStorage: 0,
      usedStorage: 0,
    );
  }
}