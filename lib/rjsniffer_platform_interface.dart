import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'rjsniffer_method_channel.dart';

/// The interface that platform implementations of `bm_root_jailbreak_sniffer`
/// must extend.
abstract class RjsnifferPlatform extends PlatformInterface {
  /// Constructs a RjsnifferPlatform.
  RjsnifferPlatform() : super(token: _token);

  static final Object _token = Object();

  static RjsnifferPlatform _instance = MethodChannelRjsniffer();

  /// The default instance of [RjsnifferPlatform] to use.
  ///
  /// Defaults to [MethodChannelRjsniffer].
  static RjsnifferPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [RjsnifferPlatform] when
  /// they register themselves.
  static set instance(RjsnifferPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// Whether the device is rooted or jailbroken.
  Future<bool?> amICompromised() async {
    throw UnimplementedError('amICompromised() has not been implemented.');
  }

  /// Whether the app is running on an emulator or simulator.
  Future<bool?> amIEmulator() async {
    throw UnimplementedError('amIEmulator() has not been implemented.');
  }

  /// Whether a debugger is attached to the app process.
  Future<bool?> amIDebugged() async {
    throw UnimplementedError('amIDebugged() has not been implemented.');
  }
}
