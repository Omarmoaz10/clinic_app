import 'package:clinic_app/models/patient_model.dart';
import 'package:clinic_app/models/procedure_model.dart';
import 'package:clinic_app/modules/home/cubit/states.dart';
import 'package:clinic_app/modules/patient_register/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/component/patient_Info.dart';
import '../home/cubit/cubit.dart';
import '../patient_register/cubit/cubit.dart';

class BillScreenSec extends StatelessWidget {
  final PatientModel? patient;
  List<ProcedureModel>? procedures;
  double? totalCost;
  BillScreenSec({Key? key, this.patient, this.procedures, this.totalCost})
      : super(key: key) {}
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatientRegisterCubit, PatientRegisterStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Bill"),
          ),
          body: Column(
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: (patient != null)
                    ? buildPatient(
                        patient: patient,
                        nav: false,
                      )
                    : const Center(
                        child: Text("No data"),
                      ),
              ),
              Center(
                child: ListView.builder(
                  itemCount: procedures!.length,
                  itemBuilder: (context, index) {
                    final item = procedures![index];
                    return Text("${item.name}");
                  },
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: (totalCost == null)
                    ? const Text("Total Bill : 100 EGP")
                    : Text("Total Bill : $totalCost EGP"),
              ),
            ],
          ),
        );
      },
    );
  }
}
