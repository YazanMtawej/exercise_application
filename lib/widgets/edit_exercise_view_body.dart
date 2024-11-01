import 'package:exercise_application/Models/exercise_model.dart';
import 'package:exercise_application/cubit/exercise_cubit/exercise_cubit.dart';
import 'package:exercise_application/widgets/custom_app_bar.dart';
import 'package:exercise_application/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditExerciseViewBody extends StatefulWidget {
  const EditExerciseViewBody({super.key, required this.exercises});
  final ExerciseModel exercises;
  @override
  State<EditExerciseViewBody> createState() => _EditExerciseViewBodyState();
}

class _EditExerciseViewBodyState extends State<EditExerciseViewBody> {
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
            title: 'Edit Exercise',
            icon: Icons.check,
          ),
          const SizedBox(
            height: 50,
          ),
          CustomTextField(
              onChanged: (value) {
                title = value;
              },
              hint: 'Title ${widget.exercises.title}'),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onChanged: (value) {
              sets = value;
            },
            hint: 'Sets ${widget.exercises.sets}',
            maxLines: 3,
          ),
           const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onChanged: (value) {
              weights = value;
            },
            hint: 'Weights ${widget.exercises.weights}',
            maxLines: 3,
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