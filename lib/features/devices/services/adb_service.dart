import 'dart:io';

class AdbService {
  /// Check if ADB is installed
  static Future<bool> isAdbInstalled() async {
    try {
      final result = await Process.run(
        "adb",
        ["version"],
      );

      return result.exitCode == 0;
    } catch (_) {
      return false;
    }
  }

  /// Returns connected device IDs
  static Future<List<String>> getConnectedDevices() async {
    try {
      final result = await Process.run(
        "adb",
        ["devices"],
      );

      if (result.exitCode != 0) {
        return [];
      }

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
  static Future<String> shell(
    String deviceId,
    String command,
  ) async {
    try {
      final result = await Process.run(
        "adb",
        [
          "-s",
          deviceId,
          "shell",
          command,
        ],
      );

      return result.stdout.toString().trim();
    } catch (_) {
      return "";
    }
  }

  /// Get Android device model
  static Future<String> getModel(String deviceId) async {
    return await shell(
      deviceId,
      "getprop ro.product.model",
    );
  }

  /// Get Manufacturer
  static Future<String> getBrand(String deviceId) async {
    return await shell(
      deviceId,
      "getprop ro.product.manufacturer",
    );
  }

  /// Get Android Version
  static Future<String> getAndroidVersion(
    String deviceId,
  ) async {
    return await shell(
      deviceId,
      "getprop ro.build.version.release",
    );
  }

  /// Battery Percentage
  static Future<int> getBattery(
    String deviceId,
  ) async {
    final output = await shell(
      deviceId,
      "dumpsys battery",
    );

    final lines = output.split("\n");

    for (final line in lines) {
      if (line.trim().startsWith("level:")) {
        return int.tryParse(
              line.split(":").last.trim(),
            ) ??
            0;
      }
    }

    return 0;
  }
}