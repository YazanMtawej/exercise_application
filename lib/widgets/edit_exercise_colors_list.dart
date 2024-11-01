import 'package:exercise_application/Models/exercise_model.dart';
import 'package:exercise_application/constants.dart';
import 'package:exercise_application/widgets/colors_list_view.dart';
import 'package:flutter/material.dart';

class EditExerciseColorsList extends StatefulWidget {
  const EditExerciseColorsList({super.key, required this.exercises});
final ExerciseModel exercises;
  @override
  State<EditExerciseColorsList> createState() => _EditExerciseColorsListState();
}

class _EditExerciseColorsListState extends State<EditExerciseColorsList> {
 late int currentIndex;
 @override
  void initState() {
    currentIndex=kColors.indexOf(Color(widget.exercises.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64,
      child: ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
        
          return  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: GestureDetector(
              onTap: (){
                currentIndex=index;
               widget.exercises.color= kColors[index].value;
                setState(() {});
              },
              child: ColorItem(
                color: kColors[index],
                isActive: currentIndex==index,
              ),
            ),
          );
        },
      ),
    );
  }
}