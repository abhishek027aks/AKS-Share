import 'package:aks_share/features/devices/models/device_status.dart';
import 'package:aks_share/features/devices/services/adb_gateway.dart';
import 'package:aks_share/features/devices/services/device_connection_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DeviceConnectionService', () {
    test('returns adbMissing when ADB is unavailable', () async {
      final service = DeviceConnectionService(
        adbGateway: _FakeAdbGateway(isInstalled: false),
      );

      final result = await service.scanCurrentDevice();

      expect(result.status, DeviceStatus.adbMissing);
      expect(result.device.isConnected, isFalse);
    });

    test(
      'returns unauthorized when device needs USB debugging approval',
      () async {
        final service = DeviceConnectionService(
          adbGateway: _FakeAdbGateway(hasUnauthorized: true),
        );

        final result = await service.scanCurrentDevice();

        expect(result.status, DeviceStatus.unauthorized);
        expect(result.message, 'USB debugging permission required');
      },
    );

    test('returns disconnected when ADB has no devices', () async {
      final service = DeviceConnectionService(adbGateway: _FakeAdbGateway());

      final result = await service.scanCurrentDevice();

      expect(result.status, DeviceStatus.disconnected);
      expect(result.device.connectionStatus, 'Disconnected');
    });

    test('maps connected USB device details', () async {
      final service = DeviceConnectionService(
        adbGateway: _FakeAdbGateway(
          devices: ['device-123'],
          brand: 'Google',
          model: 'Pixel 9',
          androidVersion: '16',
          ipAddress: '192.168.1.44',
          battery: 82,
          storageInfo: {'total': 128.0, 'used': 42.5},
        ),
      );

      final result = await service.scanCurrentDevice();
      final device = result.device;

      expect(result.status, DeviceStatus.connected);
      expect(result.isConnected, isTrue);
      expect(device.id, 'device-123');
      expect(device.name, 'Google Pixel 9');
      expect(device.androidVersion, '16');
      expect(device.battery, 82);
      expect(device.totalStorage, 128.0);
      expect(device.usedStorage, 42.5);
      expect(result.message, 'USB device connected');
    });
  });
}

class _FakeAdbGateway implements AdbGateway {
  final bool isInstalled;
  final bool hasUnauthorized;
  final List<String> devices;
  final String brand;
  final String model;
  final String androidVersion;
  final String ipAddress;
  final int battery;
  final Map<String, double> storageInfo;

  const _FakeAdbGateway({
    this.isInstalled = true,
    this.hasUnauthorized = false,
    this.devices = const [],
    this.brand = '',
    this.model = '',
    this.androidVersion = '',
    this.ipAddress = '',
    this.battery = 0,
    this.storageInfo = const {'total': 0.0, 'used': 0.0},
  });

  @override
  Future<bool> isAdbInstalled() async => isInstalled;

  @override
  Future<List<String>> getConnectedDevices() async => devices;

  @override
  Future<bool> hasUnauthorizedDevice() async => hasUnauthorized;

  @override
  Future<String> getModel(String deviceId) async => model;

  @override
  Future<String> getBrand(String deviceId) async => brand;

  @override
  Future<String> getAndroidVersion(String deviceId) async => androidVersion;

  @override
  Future<String> getIpAddress(String deviceId) async => ipAddress;

  @override
  Future<int> getBattery(String deviceId) async => battery;

  @override
  Future<Map<String, double>> getStorageInfo(String deviceId) async {
    return storageInfo;
  }
}
