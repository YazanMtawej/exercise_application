
import 'package:exercise_application/widgets/add_exercise_bottom_sheet.dart';
import 'package:exercise_application/widgets/exercise_view_body.dart';
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
