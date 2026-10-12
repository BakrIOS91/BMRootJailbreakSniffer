import 'package:bm_root_jailbreak_sniffer/rjsniffer.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// Example app showing the results of every check.
class MyApp extends StatefulWidget {
  /// Creates the example app.
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool? _compromised;
  bool? _emulator;
  bool? _debugged;

  @override
  void initState() {
    super.initState();
    _check();
  }

  Future<void> _check() async {
    final compromised = await Rjsniffer.amICompromised();
    final emulator = await Rjsniffer.amIEmulator();
    final debugged = await Rjsniffer.amIDebugged();
    if (!mounted) return;
    setState(() {
      _compromised = compromised;
      _emulator = emulator;
      _debugged = debugged;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Root / Jailbreak Sniffer')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Compromised: $_compromised'),
              Text('Emulator: $_emulator'),
              Text('Debugged: $_debugged'),
            ],
          ),
        ),
      ),
    );
  }
}
