import 'package:clinic_app/models/patient_model.dart';
import 'package:clinic_app/modules/Doctor/doctor_room.dart';
import 'package:clinic_app/modules/home/cubit/cubit.dart';
import 'package:clinic_app/modules/home/cubit/states.dart';
import 'package:clinic_app/shared/component/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../modules/patient_edit/patient_edit.dart';

class buildPatient extends StatelessWidget {
  final PatientModel? patient;
  final bool nav;

  const buildPatient({
    this.nav = true,
    Key? key,
    this.patient,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return InkWell(
          onTap: () {
            nav ? navigateTo(context, ExaminationRoom(patient)) : null;
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name: ${patient!.name}',
                    style: const TextStyle(height: 1.4),
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    'Appointment Date:  ${patient!.visit}',
                    style: const TextStyle(height: 1.4),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    'Age:  ${patient!.age}',
                    style: const TextStyle(height: 1.4),
                  ),
                  const SizedBox(width: 10.0),
                  Text(
                    'Visit Type:  ${patient!.visitType}',
                    style: const TextStyle(height: 1.4),
                  ),
                  Container(
                    child: Row(
                      children: [
                        ElevatedButton(
                          child: const Text("Update"),
                          onPressed: () {
                            navigateTo(context, PatientEdit(patient));
                          },
                        ),
                        const SizedBox(width: 8),
                        ElevatedButton(
                          child: const Text("Delete"),
                          onPressed: () {
                            HomeCubit.get(context).deletePatient(patientId: patient!.uId);
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
