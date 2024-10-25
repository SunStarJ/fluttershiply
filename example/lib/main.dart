import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:android_shiply/android_shiply.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _androidShiplyPlugin = AndroidShiply();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    _androidShiplyPlugin.initShiply(
        "1afbdf2702", "863ff038-bb0c-4117-ad9c-534297059aa9");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: FilledButton(
              onPressed: () {
                _androidShiplyPlugin.checkUpdate().onError((e, str) {
                  if (kDebugMode) {
                    print("贤侄：报错了");
                    print("贤侄：${(e as PlatformException).message}");
                  }
                });
              },
              child: Text("更新测试")),
        ),
      ),
    );
  }
}
