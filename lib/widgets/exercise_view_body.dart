
import 'package:exercise_application/cubit/exercise_cubit/exercise_cubit.dart';
import 'package:exercise_application/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExerciseViewBody extends StatefulWidget {
  const ExerciseViewBody({super.key});

  @override
  State<ExerciseViewBody> createState() => _ExerciseViewBodyState();
}

class _ExerciseViewBodyState extends State<ExerciseViewBody> {
  @override
 void initState(){
    BlocProvider.of<ExerciseCubit>(context).fetchAlExercise();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      child: Column(
        children: [
          CustomAppBar(
            title: 'Notes App',
            icon: Icons.search,
          ),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}

class NotesListView extends StatelessWidget {
  const NotesListView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}