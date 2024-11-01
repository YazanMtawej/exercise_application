
import 'package:exercise_application/Models/exercise_model.dart';
import 'package:exercise_application/cubit/add_exercise_cubit/add_exercise_cubit.dart';
import 'package:exercise_application/widgets/custom_button.dart';
import 'package:exercise_application/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class AddExerciseForm extends StatefulWidget {
  const AddExerciseForm({super.key});

  @override
  State<AddExerciseForm> createState() => _AddExerciseFormState();
}

class _AddExerciseFormState extends State<AddExerciseForm> {
 final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, sets,weights;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
        child: Column(
          children: [
            const SizedBox(
              height: 32,
            ),
            CustomTextField(
                onSaved: (value) {
                  title = value;
                },
                maxLines: 1,
                hint: 'title'),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              onSaved: (value) {
                sets = value;
              },
              hint: 'content',
              maxLines: 2,
            ),
             const SizedBox(
              height: 16,
            ),
              CustomTextField(
              onSaved: (value) {
                weights = value;
              },
              hint: 'content',
              maxLines: 2,
            ),
            const SizedBox(
              height: 32,
            ),
            //const ColorsListView(),
            const SizedBox(
              height: 32,
            ),
            BlocBuilder<AddExerciseCubit, AddExerciseState>(
              builder: (context, state) {
                return CustomButton(
                    isloading: state is AddExerciseLoding ? true : false,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        var currentDate = DateTime.now();
                        var formattedCurrentDate =
                            DateFormat.yMd().format(currentDate);

                        var exerciseModel = ExerciseModel(
                            title: title!,
                            sets: sets!,
                            weights:weights!,
                            date: formattedCurrentDate,
                            color: Colors.blue.value);
                        BlocProvider.of<AddExerciseCubit>(context)
                            .addExercise(exerciseModel);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    });
              },
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ));
  }
}
