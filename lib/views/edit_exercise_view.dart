
import 'package:exercise_application/Models/exercise_model.dart';
import 'package:exercise_application/cubit/exercise_cubit/exercise_cubit.dart';
import 'package:exercise_application/widgets/custom_app_bar.dart';
import 'package:exercise_application/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditExerciseView extends StatelessWidget {
  const EditExerciseView({super.key, required this.exercises});

final ExerciseModel exercises;
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      body: EditNotesViewBody(
        exercises: exercises,
      ),
    );
  }
}
class EditNotesViewBody extends StatefulWidget {
  const EditNotesViewBody({super.key, required this.exercises});
  final ExerciseModel exercises;
  @override
  State<EditNotesViewBody> createState() => _EditNotesViewBodyState();
}

class _EditNotesViewBodyState extends State<EditNotesViewBody> {
String? title, sets,weights;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          CustomAppBar(
            onPressed: () {
              widget.exercises.title = title ?? widget.exercises.title;
              widget.exercises.sets = sets ?? widget.exercises.sets;
              widget.exercises.weights = weights ?? widget.exercises.weights;
              widget.exercises.save();
              BlocProvider.of<ExerciseCubit>(context).fetchAlExercise();
              Navigator.pop(context);
            },
            title: 'Edit Note',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
              onChanged: (value) {
                title = value;
              },
              hint: widget.exercises.title),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onChanged: (value) {
              sets = value;
            },
            hint: widget.exercises.sets,
            maxLines: 5,
          ),
          CustomTextField(
            onChanged: (value) {
              weights = value;
            },
            hint: widget.exercises.weights,
            maxLines: 5,
          ),
           const SizedBox(
            height: 32,
          ),
           //EditNoteColorsList(
          //  notes: widget.exercises,
         //  ),
        ],
      ),
    );
  }
}