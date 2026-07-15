import 'adb_service.dart';

abstract class AdbGateway {
  Future<bool> isAdbInstalled();

  Future<List<String>> getConnectedDevices();

  Future<bool> hasUnauthorizedDevice();

  Future<String> getModel(String deviceId);

  Future<String> getBrand(String deviceId);

  Future<String> getAndroidVersion(String deviceId);

  Future<String> getIpAddress(String deviceId);

  Future<int> getBattery(String deviceId);

  Future<Map<String, double>> getStorageInfo(String deviceId);
}

class ProcessAdbGateway implements AdbGateway {
  const ProcessAdbGateway();

  @override
  Future<bool> isAdbInstalled() {
    return AdbService.isAdbInstalled();
  }

  @override
  Future<List<String>> getConnectedDevices() {
    return AdbService.getConnectedDevices();
  }

  @override
  Future<bool> hasUnauthorizedDevice() {
    return AdbService.hasUnauthorizedDevice();
  }

  @override
  Future<String> getModel(String deviceId) {
    return AdbService.getModel(deviceId);
  }

  @override
  Future<String> getBrand(String deviceId) {
    return AdbService.getBrand(deviceId);
  }

  @override
  Future<String> getAndroidVersion(String deviceId) {
    return AdbService.getAndroidVersion(deviceId);
  }

  @override
  Future<String> getIpAddress(String deviceId) {
    return AdbService.getIpAddress(deviceId);
  }

  @override
  Future<int> getBattery(String deviceId) {
    return AdbService.getBattery(deviceId);
  }

  @override
  Future<Map<String, double>> getStorageInfo(String deviceId) {
    return AdbService.getStorageInfo(deviceId);
  }
}
