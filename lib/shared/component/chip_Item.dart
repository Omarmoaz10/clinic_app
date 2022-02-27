import 'package:clinic_app/models/procedure_model.dart';
import 'package:clinic_app/modules/home/cubit/cubit.dart';
import 'package:clinic_app/modules/home/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class chipItems extends StatefulWidget {
  final ProcedureModel? model;
  const chipItems({
    Key? key,
    this.model,
  }) : super(key: key);

  @override
  State<chipItems> createState() => _chipItemsState();
}

class _chipItemsState extends State<chipItems> {
  final bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Center(
            child: ChoiceChip(
          label: Text(
            '${widget.model!.name}',
          ),
          selected: _isSelected,
          
        ));
      },
    );
  }
}
