import 'package:flutter/material.dart';
import 'package:nativevolume/nativevolume.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  VolumeController volumeController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('MPVolumeView Plugin for iOS'),
          ),
          body: Center(
            child: SizedBox(
              child: Nativevolume(
                onVolumeCreated: onVolumeCreated,
              ),
              width: 300.0,
            ),
          )),
    );
  }

  void onVolumeCreated(volumeController) {
    this.volumeController = volumeController;
  }
}
