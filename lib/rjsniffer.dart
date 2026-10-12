import 'rjsniffer_platform_interface.dart';

/// Detects compromised devices (rooted Android / jailbroken iOS), emulators
/// and attached debuggers.
class Rjsniffer {
  /// Whether the device is rooted (Android, Magisk Hide aware) or jailbroken
  /// (iOS).
  ///
  /// Returns `null` if the platform could not determine the result.
  static Future<bool?> amICompromised() async {
    return await RjsnifferPlatform.instance.amICompromised();
  }

  /// Whether the app is running on an emulator or simulator.
  ///
  /// Returns `null` if the platform could not determine the result.
  static Future<bool?> amIEmulator() async {
    return await RjsnifferPlatform.instance.amIEmulator();
  }

  /// Whether a debugger is attached to the app process.
  ///
  /// Returns `null` if the platform could not determine the result.
  static Future<bool?> amIDebugged() async {
    return await RjsnifferPlatform.instance.amIDebugged();
  }
}
