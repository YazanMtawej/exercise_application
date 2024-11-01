
import 'package:exercise_application/Models/exercise_model.dart';
import 'package:exercise_application/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'add_exercise_state.dart';

class AddExerciseCubit extends Cubit<AddExerciseState> {
  AddExerciseCubit() : super(AddExerciseInitial());

  
  Color color= Colors.red;

  addNote(ExerciseModel exercise)async{
    exercise.color =color.value;
    emit(AddExerciseLoding());
   try {
  var notesBox =Hive.box<ExerciseModel>(kExerciseBox);
  await notesBox.add(exercise);
  emit(AddExerciseSuccess());
}  catch (e) {
  emit(AddExerciseFailure(e.toString()));
}
  }
}
