import 'package:flutter/material.dart';
import 'dart:async';

import 'package:active_package/active_package.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _packageName = 'Unknown';
  final _activePackagePlugin = ActivePackage();

  @override
  void initState() {
    super.initState();
  }

  Future<void> getPackageName() async {
    String packageName;
    try {
      packageName = await _activePackagePlugin.getActivePackageName() ??
          'Unknown package name';
    } catch (e) {
      packageName = 'Failed to get the active package name.';
    }

    // If the widget was removed from the tree while the asynchronous package name
    // method was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _packageName = packageName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () => getPackageName(),
                  child: const Text("Get package name")),
              Text(
                'Running on: $_packageName\n',
                textAlign: TextAlign.center,
              ),
            ]),
      ),
    );
  }
}
