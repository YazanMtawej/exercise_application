
import 'package:exercise_application/constants.dart';
import 'package:exercise_application/cubit/add_exercise_cubit/add_exercise_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isActive, required this.color});
 final bool isActive;
 final Color color;
  @override
  Widget build(BuildContext context) {
    return isActive?   CircleAvatar(
      radius: 34,
      backgroundColor: Colors.white,
      child: CircleAvatar(
        radius: 30,
        backgroundColor: color,
      ),
    ) :CircleAvatar(
      radius: 32,
      backgroundColor: color,
    );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex=0;



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
                BlocProvider.of<AddExerciseCubit>(context).color=kColors[index];
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