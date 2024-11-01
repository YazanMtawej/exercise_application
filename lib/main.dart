import 'package:device_preview/device_preview.dart';
import 'package:exercise_application/Models/exercise_model.dart';
import 'package:exercise_application/constants.dart';
import 'package:exercise_application/views/exercise_view.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async{
  //Bloc.observer = SimpleBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(ExerciseModelAdapter());
  await Hive.openBox<ExerciseModel>(kNoteBox);

  runApp(DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const ExerciseApp()), // Wrap your app
    );
}

class ExerciseApp extends StatelessWidget {
  const ExerciseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark),
      home: const ExersiseView(),
    );
  }
}
