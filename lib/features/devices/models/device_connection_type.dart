enum DeviceConnectionType { none, usb, wifi, hotspot, internet, bluetooth }

extension DeviceConnectionTypeLabel on DeviceConnectionType {
  String get label {
    switch (this) {
      case DeviceConnectionType.usb:
        return 'USB';
      case DeviceConnectionType.wifi:
        return 'Wi-Fi';
      case DeviceConnectionType.hotspot:
        return 'Hotspot';
      case DeviceConnectionType.internet:
        return 'Internet';
      case DeviceConnectionType.bluetooth:
        return 'Bluetooth';
      case DeviceConnectionType.none:
        return 'None';
    }
  }
}
