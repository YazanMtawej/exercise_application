import 'package:hive/hive.dart';

part 'exercise_model.g.dart';

@HiveType(typeId: 0)
class ExerciseModel  extends HiveObject{
  @HiveField(0)
   String title;
    @HiveField(1)
   String sets;
    @HiveField(2)
    String weights;
    @HiveField(3)
  final String date;
    @HiveField(4)
   int color;

  ExerciseModel(
      {required this.title,
      required this.sets,
      required this.weights,
      required this.date,
      required this.color});

}