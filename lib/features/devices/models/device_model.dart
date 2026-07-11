class DeviceModel {
  final String id;
  final String name;
  final String brand;
  final String model;
  final String androidVersion; // Conflict resolve karne ke liye wapas androidVersion
  
  final bool isConnected;
  final bool isUsb;
  final bool isWifi;
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
    required this.isConnected,
    required this.isUsb,
    required this.isWifi,
    required this.ipAddress,
    required this.battery,
    required this.totalStorage,
    required this.usedStorage,
  });

  double get freeStorage => totalStorage - usedStorage;
  String get connectionStatus => isConnected ? "Connected" : "Disconnected";
  String get connectionType {
    if (!isConnected) return "None";
    if (isUsb) return "USB";
    if (isWifi) return "Wi-Fi";
    return "Unknown";
  }

  factory DeviceModel.empty() {
    return const DeviceModel(
      id: "",
      name: "No Device Connected",
      brand: "",
      model: "",
      androidVersion: "",
      isConnected: false,
      isUsb: false,
      isWifi: false,
      ipAddress: "",
      battery: 0,
      totalStorage: 0.0,
      usedStorage: 0.0,
    );
  }
}