
import 'package:exercise_application/Models/exercise_model.dart';
import 'package:exercise_application/widgets/edit_exercise_view_body.dart';
import 'package:flutter/material.dart';

class EditExerciseView extends StatelessWidget {
  const EditExerciseView({super.key, required this.exercises});

final ExerciseModel exercises;
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: EditExerciseViewBody(
        exercises: exercises,
      ),
    );
  }
}
