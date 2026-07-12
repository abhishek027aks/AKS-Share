enum DeviceStatus {
  disconnected,
  connecting,
  connected,
  unauthorized,
  adbMissing,
  error,
}

extension DeviceStatusLabel on DeviceStatus {
  String get label {
    switch (this) {
      case DeviceStatus.connected:
        return 'Connected';
      case DeviceStatus.connecting:
        return 'Connecting';
      case DeviceStatus.unauthorized:
        return 'USB debugging permission required';
      case DeviceStatus.adbMissing:
        return 'ADB not found';
      case DeviceStatus.error:
        return 'Connection error';
      case DeviceStatus.disconnected:
        return 'Disconnected';
    }
  }
}
