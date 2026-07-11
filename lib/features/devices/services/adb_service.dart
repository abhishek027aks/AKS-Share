import 'dart:io';

class AdbService {
  /// Check if ADB is installed
  static Future<bool> isAdbInstalled() async {
    try {
      final result = await Process.run("adb", ["version"]);
      return result.exitCode == 0;
    } catch (_) {
      return false;
    }
  }

  /// Returns connected device IDs
  static Future<List<String>> getConnectedDevices() async {
    try {
      final result = await Process.run("adb", ["devices"]);
      if (result.exitCode != 0) return [];

      final lines = result.stdout.toString().split("\n");
      final devices = <String>[];

      for (final line in lines) {
        if (line.contains("\tdevice")) {
          devices.add(line.split("\t").first.trim());
        }
      }
      return devices;
    } catch (_) {
      return [];
    }
  }

  /// Execute adb shell command
  static Future<String> shell(String deviceId, String command) async {
    try {
      // Command ko list of arguments me split karna zaroori hai
      final args = ["-s", deviceId, "shell", ...command.split(" ")];
      final result = await Process.run("adb", args);
      return result.stdout.toString().trim();
    } catch (_) {
      return "";
    }
  }

  /// Get Android device model
  static Future<String> getModel(String deviceId) async {
    return await shell(deviceId, "getprop ro.product.model");
  }

  /// Get Manufacturer / Brand
  static Future<String> getBrand(String deviceId) async {
    return await shell(deviceId, "getprop ro.product.manufacturer");
  }

  /// Get Android Version
  static Future<String> getAndroidVersion(String deviceId) async {
    return await shell(deviceId, "getprop ro.build.version.release");
  }

  /// Battery Percentage
  static Future<int> getBattery(String deviceId) async {
    final output = await shell(deviceId, "dumpsys battery");
    final lines = output.split("\n");

    for (final line in lines) {
      if (line.trim().startsWith("level:")) {
        return int.tryParse(line.split(":").last.trim()) ?? 0;
      }
    }
    return 0;
  }

  /// Get Device IP Address (Wi-Fi)
  static Future<String> getIpAddress(String deviceId) async {
    final output = await shell(deviceId, "ip route");
    final lines = output.split("\n");
    
    for (final line in lines) {
      if (line.contains("wlan0") && line.contains("src")) {
        // Output format generally: "192.168.1.0/24 dev wlan0 ... src 192.168.1.5"
        final parts = line.split(" ");
        final srcIndex = parts.indexOf("src");
        if (srcIndex != -1 && srcIndex + 1 < parts.length) {
          return parts[srcIndex + 1];
        }
      }
    }
    return "Unknown";
  }

  /// Get Storage Info (Returns total and used storage in GB)
  /// Returns a Map: {'total': 128.0, 'used': 64.2}
  static Future<Map<String, double>> getStorageInfo(String deviceId) async {
    try {
      // 'df -h /data' storage info human-readable format me deta hai (G/M)
      final output = await shell(deviceId, "df -h /data");
      final lines = output.split("\n");
      
      if (lines.length > 1) {
        // Line 1 contains the actual data values
        final dataLine = lines[1].trim().replaceAll(RegExp(r'\s+'), ' ');
        final parts = dataLine.split(' ');
        
        if (parts.length >= 3) {
          double parseSize(String sizeStr) {
            final val = double.tryParse(sizeStr.replaceAll(RegExp(r'[a-zA-Z]'), '')) ?? 0.0;
            if (sizeStr.toUpperCase().contains('T')) return val * 1024;
            if (sizeStr.toUpperCase().contains('M')) return val / 1024;
            return val; // Default is GB
          }

          return {
            'total': parseSize(parts[1]), // Size column
            'used': parseSize(parts[2]),  // Used column
          };
        }
      }
    } catch (_) {}
    
    return {'total': 0.0, 'used': 0.0};
  }
}