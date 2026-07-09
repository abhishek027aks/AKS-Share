class DeviceModel {
  final String id;
  final String name;
  final String model;
  final String androidVersion;
  final String brand;

  final int battery;

  final bool isConnected;
  final bool isUsb;
  final bool isWifi;

  final String ipAddress;

  final double totalStorage;
  final double usedStorage;

  const DeviceModel({
    required this.id,
    required this.name,
    required this.model,
    required this.androidVersion,
    required this.brand,
    required this.battery,
    required this.isConnected,
    required this.isUsb,
    required this.isWifi,
    required this.ipAddress,
    required this.totalStorage,
    required this.usedStorage,
  });

  double get freeStorage => totalStorage - usedStorage;

  factory DeviceModel.empty() {
    return const DeviceModel(
      id: "",
      name: "No Device Connected",
      model: "",
      androidVersion: "",
      brand: "",
      battery: 0,
      isConnected: false,
      isUsb: false,
      isWifi: false,
      ipAddress: "",
      totalStorage: 0,
      usedStorage: 0,
    );
  }
}