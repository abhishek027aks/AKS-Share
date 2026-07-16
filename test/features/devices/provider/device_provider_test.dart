import 'package:aks_share/features/devices/models/device_status.dart';
import 'package:aks_share/features/devices/provider/device_provider.dart';
import 'package:aks_share/features/devices/services/adb_gateway.dart';
import 'package:aks_share/features/devices/services/device_connection_service.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DeviceProvider', () {
    test('starts with a not-scanned disconnected state', () {
      final provider = DeviceProvider();

      expect(provider.hasScanned, isFalse);
      expect(provider.isScanning, isFalse);
      expect(provider.isConnected, isFalse);
      expect(provider.scanMessage, 'Not scanned yet');
      expect(provider.device.status, DeviceStatus.disconnected);
    });

    test('updates device and scan metadata after successful scan', () async {
      final provider = DeviceProvider(
        service: DeviceConnectionService(
          adbGateway: _FakeAdbGateway(
            devices: ['phone-1'],
            brand: 'Samsung',
            model: 'Galaxy S26',
            androidVersion: '16',
            battery: 91,
          ),
        ),
      );

      await provider.scanDevices();

      expect(provider.hasScanned, isTrue);
      expect(provider.isScanning, isFalse);
      expect(provider.isConnected, isTrue);
      expect(provider.lastScannedAt, isNotNull);
      expect(provider.scanMessage, 'USB device connected');
      expect(provider.device.name, 'Samsung Galaxy S26');
      expect(provider.device.battery, 91);
    });

    test('sets user-facing error when scan throws', () async {
      final provider = DeviceProvider(
        service: DeviceConnectionService(adbGateway: _ThrowingAdbGateway()),
      );

      await provider.scanDevices();

      expect(provider.hasScanned, isTrue);
      expect(provider.isScanning, isFalse);
      expect(provider.isConnected, isFalse);
      expect(provider.lastScannedAt, isNotNull);
      expect(provider.scanMessage, 'Unable to scan devices');
      expect(provider.errorMessage, contains('Unable to scan devices'));
    });
  });
}

class _FakeAdbGateway implements AdbGateway {
  final List<String> devices;
  final String brand;
  final String model;
  final String androidVersion;
  final int battery;

  const _FakeAdbGateway({
    this.devices = const [],
    this.brand = '',
    this.model = '',
    this.androidVersion = '',
    this.battery = 0,
  });

  @override
  Future<bool> isAdbInstalled() async => true;

  @override
  Future<List<String>> getConnectedDevices() async => devices;

  @override
  Future<bool> hasUnauthorizedDevice() async => false;

  @override
  Future<String> getModel(String deviceId) async => model;

  @override
  Future<String> getBrand(String deviceId) async => brand;

  @override
  Future<String> getAndroidVersion(String deviceId) async => androidVersion;

  @override
  Future<String> getIpAddress(String deviceId) async => '';

  @override
  Future<int> getBattery(String deviceId) async => battery;

  @override
  Future<Map<String, double>> getStorageInfo(String deviceId) async {
    return const {'total': 0.0, 'used': 0.0};
  }
}

class _ThrowingAdbGateway implements AdbGateway {
  @override
  Future<bool> isAdbInstalled() {
    throw StateError('scan failed');
  }

  @override
  Future<List<String>> getConnectedDevices() async => const [];

  @override
  Future<bool> hasUnauthorizedDevice() async => false;

  @override
  Future<String> getModel(String deviceId) async => '';

  @override
  Future<String> getBrand(String deviceId) async => '';

  @override
  Future<String> getAndroidVersion(String deviceId) async => '';

  @override
  Future<String> getIpAddress(String deviceId) async => '';

  @override
  Future<int> getBattery(String deviceId) async => 0;

  @override
  Future<Map<String, double>> getStorageInfo(String deviceId) async {
    return const {'total': 0.0, 'used': 0.0};
  }
}
