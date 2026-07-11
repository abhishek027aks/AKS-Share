import 'package:flutter/foundation.dart';

import '../models/device_model.dart';
import '../services/device_connection_service.dart';

class DeviceProvider extends ChangeNotifier {
  final DeviceConnectionService _service = DeviceConnectionService();

  DeviceModel _device = DeviceModel.empty();
  bool _isScanning = false;
  String? _errorMessage;

  DeviceModel get device => _device;
  bool get isConnected => _device.isConnected;
  bool get isScanning => _isScanning;
  String? get errorMessage => _errorMessage;

  Future<void> scanDevices() async {
    if (_isScanning) return;

    _isScanning = true;
    _errorMessage = null;
    notifyListeners();

    try {
      _device = await _service.getCurrentDevice();
    } catch (_) {
      _device = DeviceModel.empty();
      _errorMessage = 'Unable to scan devices. Please check ADB and try again.';
    } finally {
      _isScanning = false;
      notifyListeners();
    }
  }

  Future<void> refresh() async {
    await scanDevices();
  }
}
