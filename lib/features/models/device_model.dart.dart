class DeviceModel {
  final String id;
  final String name;
  final String androidVersion;
  final String status;
  final bool connected;

  const DeviceModel({
    required this.id,
    required this.name,
    required this.androidVersion,
    required this.status,
    required this.connected,
  });

  factory DeviceModel.empty() {
    return const DeviceModel(
      id: "",
      name: "No Device Connected",
      androidVersion: "",
      status: "Waiting for device...",
      connected: false,
    );
  }
}