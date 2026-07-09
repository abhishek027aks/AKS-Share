import '../../shared/models/device_model.dart';

class DeviceService {
  static DeviceModel currentDevice = const DeviceModel(
    name: "No Device",
    platform: "",
    battery: 0,
    charging: false,
    connected: false,
  );
}