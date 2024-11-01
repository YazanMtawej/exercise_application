

import 'package:exercise_application/Models/exercise_model.dart';
import 'package:exercise_application/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

part 'exercise_state.dart';

class ExerciseCubit extends Cubit<ExerciseState> {
  ExerciseCubit() : super(ExerciseInitial());

  
  List<ExerciseModel>? exercises;
  fetchAlExercise(){
      var exerciseBox = Hive.box<ExerciseModel>(kExerciseBox);
       exercises = exerciseBox.values.toList();
       emit(ExerciseSuccess());
          }
}
