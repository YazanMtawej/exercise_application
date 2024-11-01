import 'package:device_preview/device_preview.dart';
import 'package:exercise_application/views/exercise_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const Exercise_App()), // Wrap your app
    );
}

class Exercise_App extends StatelessWidget {
  const Exercise_App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: const ExersiseView(),
    );
  }
}
