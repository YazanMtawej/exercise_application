
import 'package:flutter/material.dart';

class ExersiseView extends StatelessWidget {
  const ExersiseView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          context: context, builder: (context){
          return const AddExerciseBottomSheet();
        });
      },
      child: const Icon(Icons.add),
      ),
      body: const ExerciseViewBody(),
    );
  }
}

class AddExerciseBottomSheet extends StatelessWidget {
  const AddExerciseBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
class ExerciseViewBody extends StatelessWidget {
  const ExerciseViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}