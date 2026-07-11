import '../models/device_model.dart';
import 'adb_service.dart';

class DeviceConnectionService {
  // Static hata diya hai taaki Provider ke saath asani se use ho sake
  Future<DeviceModel> getCurrentDevice() async {
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
      name: "$brand $model".trim(), // Brand aur model mila kar ek proper naam (e.g. "Redmi Note 12 Pro")
      model: model,
      brand: brand,
      androidVersion: android,
      battery: battery,
      isConnected: true,
      isUsb: true, // Abhi ke liye default USB true rakha hai
      isWifi: false,
      ipAddress: "",
      totalStorage: 0, 
      usedStorage: 0,
    );
  }
}