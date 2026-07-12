import 'device_connection_type.dart';
import 'device_status.dart';

class DeviceModel {
  final String id;
  final String name;
  final String brand;
  final String model;
  final String androidVersion;
  final DeviceStatus status;
  final DeviceConnectionType connectionTypeValue;
  final String ipAddress;

  final int battery;
  final double totalStorage;
  final double usedStorage;

  const DeviceModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.model,
    required this.androidVersion,
    required this.status,
    required this.connectionTypeValue,
    required this.ipAddress,
    required this.battery,
    required this.totalStorage,
    required this.usedStorage,
  });

  double get freeStorage => totalStorage - usedStorage;
  bool get isConnected => status == DeviceStatus.connected;
  bool get isUsb => connectionTypeValue == DeviceConnectionType.usb;
  bool get isWifi => connectionTypeValue == DeviceConnectionType.wifi;
  String get connectionStatus => status.label;
  String get connectionType => connectionTypeValue.label;

  const DeviceModel.empty({this.status = DeviceStatus.disconnected})
    : id = '',
      name = 'No Device Connected',
      brand = '',
      model = '',
      androidVersion = '',
      connectionTypeValue = DeviceConnectionType.none,
      ipAddress = '',
      battery = 0,
      totalStorage = 0.0,
      usedStorage = 0.0;
}
