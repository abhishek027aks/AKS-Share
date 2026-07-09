class DeviceModel {
  final String name;
  final String platform;
  final int battery;
  final bool charging;
  final bool connected;

  const DeviceModel({
    required this.name,
    required this.platform,
    required this.battery,
    required this.charging,
    required this.connected,
  });
}