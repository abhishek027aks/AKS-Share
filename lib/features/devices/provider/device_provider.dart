import 'package:flutter/foundation.dart';

import '../models/device_model.dart';
import '../services/device_connection_service.dart';

class DeviceProvider extends ChangeNotifier {
  final DeviceConnectionService _service;

  DeviceModel _device = DeviceModel.empty();
  bool _isScanning = false;
  bool _hasScanned = false;
  DateTime? _lastScannedAt;
  String _scanMessage = 'Not scanned yet';
  String? _errorMessage;

  DeviceProvider({
    DeviceConnectionService? service,
    bool autoScanOnStart = false,
  }) : _service = service ?? DeviceConnectionService() {
    if (autoScanOnStart) {
      Future.microtask(scanDevices);
    }
  }

  DeviceModel get device => _device;
  bool get isConnected => _device.isConnected;
  bool get isScanning => _isScanning;
  bool get hasScanned => _hasScanned;
  DateTime? get lastScannedAt => _lastScannedAt;
  String get scanMessage => _scanMessage;
  String? get errorMessage => _errorMessage;

  Future<void> scanDevices() async {
    if (_isScanning) return;

    _isScanning = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final result = await _service.scanCurrentDevice();
      _device = result.device;
      _hasScanned = true;
      _lastScannedAt = result.scannedAt;
      _scanMessage = result.message;
    } catch (_) {
      _device = DeviceModel.empty();
      _hasScanned = true;
      _lastScannedAt = DateTime.now();
      _scanMessage = 'Unable to scan devices';
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
