import 'dart:async';
import 'package:auto_start_flutter/auto_start_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionsService {
  static Future<bool> getPermissions() async {
    showAutoStartScreen();

    return await Permission.activityRecognition.request().isGranted &&
        await Permission.notification.request().isGranted &&
        await Permission.ignoreBatteryOptimizations.request().isGranted;
  }

  static Future<void> showAutoStartScreen() async {
    var autoStartPermission = await (isAutoStartAvailable);
    if (autoStartPermission != null && autoStartPermission) {
      getAutoStartPermission();
    }
  }
}
