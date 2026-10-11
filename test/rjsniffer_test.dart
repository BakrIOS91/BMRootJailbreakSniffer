import 'package:flutter_test/flutter_test.dart';
import 'package:bm_root_jailbreak_sniffer/rjsniffer.dart';
import 'package:bm_root_jailbreak_sniffer/rjsniffer_platform_interface.dart';
import 'package:bm_root_jailbreak_sniffer/rjsniffer_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockRjsnifferPlatform
    with MockPlatformInterfaceMixin
    implements RjsnifferPlatform {
  @override
  Future<bool?> amICompromised() async => false;

  @override
  Future<bool?> amIEmulator() async => true;

  @override
  Future<bool?> amIDebugged() async => false;
}

void main() {
  final RjsnifferPlatform initialPlatform = RjsnifferPlatform.instance;

  test('$MethodChannelRjsniffer is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelRjsniffer>());
  });

  test('Rjsniffer delegates to the platform instance', () async {
    MockRjsnifferPlatform fakePlatform = MockRjsnifferPlatform();
    RjsnifferPlatform.instance = fakePlatform;

    expect(await Rjsniffer.amICompromised(), false);
    expect(await Rjsniffer.amIEmulator(), true);
    expect(await Rjsniffer.amIDebugged(), false);
  });
}
