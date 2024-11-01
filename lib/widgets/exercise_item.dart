import 'package:exercise_application/Models/exercise_model.dart';
import 'package:exercise_application/cubit/exercise_cubit/exercise_cubit.dart';
import 'package:exercise_application/views/edit_exercise_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseItem extends StatelessWidget {
  const ExerciseItem({super.key, required this.exercises});
  final ExerciseModel exercises;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return EditExerciseView(
            exercises: exercises,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(
          top: 24,
          bottom: 24,
          left: 16,
        ),
        decoration: BoxDecoration(
          color: Color(exercises.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            SizedBox(
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    exercises.title,
                    style: const TextStyle(fontSize: 28, color: Colors.black),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text('Sets:${exercises.sets}',
                      style: TextStyle(
                          fontSize: 18, color: Colors.black.withOpacity(.5))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {
                            exercises.delete();
                            BlocProvider.of<ExerciseCubit>(context)
                                .fetchAlExercise();
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.black,
                            size: 30,
                          )),
                    ],
                  ),
                  Text(
                    'Weights:${exercises.weights}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
          
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                exercises.date,
                style: TextStyle(
                  color: Colors.black.withOpacity(.4),
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
