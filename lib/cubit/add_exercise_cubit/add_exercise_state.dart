part of 'add_exercise_cubit.dart';

@immutable
sealed class AddExerciseState {}

final class AddExerciseInitial extends AddExerciseState {}
 class AddExerciseLoding extends AddExerciseState {}
 class AddExerciseSuccess extends AddExerciseState {}
 class AddExerciseFailure extends AddExerciseState {
  final String errMessage;
  AddExerciseFailure(this.errMessage);
}
