
import 'package:exercise_application/cubit/add_exercise_cubit/add_exercise_cubit.dart';
import 'package:exercise_application/cubit/exercise_cubit/exercise_cubit.dart';
import 'package:exercise_application/widgets/add_exercise_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddExerciseBottomSheet extends StatelessWidget {
  const AddExerciseBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => AddExerciseCubit(),
      child: BlocConsumer<AddExerciseCubit,AddExerciseState>(listener: (context,state){
         if (state is AddExerciseFailure) {}

        if (state is AddExerciseSuccess) {
          BlocProvider.of<ExerciseCubit>(context).fetchAlExercise();
          Navigator.pop(context);
        }
      },
      builder: (context,state){
       return AbsorbPointer(
          absorbing: state is AddExerciseLoding ? true : false,
          child: Padding(
            padding: EdgeInsets.only(
                left: 16,
                right: 16,
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: const SingleChildScrollView(child: AddExerciseForm()),
          ),
        );
      } ),
      
      );
  }
}
