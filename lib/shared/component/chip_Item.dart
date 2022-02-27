import 'package:clinic_app/models/procedure_model.dart';
import 'package:clinic_app/modules/home/cubit/cubit.dart';
import 'package:clinic_app/modules/home/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class chipItems extends StatelessWidget {
  ProcedureModel model;
  bool _isSelected = false;
  void Function(bool, ProcedureModel)? onPress;
  chipItems(this.model, this.onPress);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ActionChip(
            label: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '${model.name}',
                ),
                Text(
                  ' Cost: ${model.cost}',
                ),
              ],
            ),
            // selectedColor: Colors.blue,
            // disabledColor: Colors.blueGrey,

            onPressed: () {
              _isSelected = !_isSelected;

              onPress!(_isSelected, model);
            });
      },
    );
  }
}
