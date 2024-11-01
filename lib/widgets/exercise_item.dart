
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
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context){
          return  EditExerciseView(
            exercises: exercises,
          );
        }));
      },
      child: Container(
       
        padding: const EdgeInsets.only(top: 24,bottom: 24,left: 16,),
        decoration: BoxDecoration(
          color: Color(exercises.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title:  Text(
                exercises.title,
                style: const TextStyle(fontSize: 26, color: Colors.black),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16,bottom: 16),
                child: Text(exercises.sets,
                    style: TextStyle(
                        fontSize: 18, color: Colors.black.withOpacity(.5))),
              ),
              leading: Text(
                exercises.weights,
                style: const TextStyle(fontSize: 26, color: Colors.black),
              ),
              trailing: IconButton(
                  onPressed: () {
                    exercises.delete();
                    BlocProvider.of<ExerciseCubit>(context).fetchAlExercise();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 24,
                  )),
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
