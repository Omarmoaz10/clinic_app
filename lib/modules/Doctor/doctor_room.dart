import 'package:clinic_app/models/Doctor_Assessment_model.dart';
import 'package:clinic_app/models/patient_model.dart';
import 'package:clinic_app/models/procedure_model.dart';
import 'package:clinic_app/modules/bills/bill_screen.dart';
import 'package:clinic_app/modules/home/cubit/states.dart';
import 'package:clinic_app/modules/home/home.dart';
import 'package:clinic_app/shared/component/components.dart';
import 'package:clinic_app/shared/component/patient_Info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../shared/component/chip_Item.dart';
import '../home/cubit/cubit.dart';

class ExaminationRoom extends StatelessWidget {
  var diagnosisController = TextEditingController();
  var prescriptionController = TextEditingController();
  var labController = TextEditingController();
  var billController = TextEditingController();
  final PatientModel? patient;

  ExaminationRoom(this.patient, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Doctor Room"),
            actions: [
              // TextButton(
              //   onPressed: () {
              //     // var now = DateTime.now();
              //     // HomeCubit.get(context).createDiagnosis(
              //     //   dateTime: now.toString(),
              //     //   diagnosis: diagnosisController.text,
              //     // );
              //     // navigateTo(context, Home());
              //   },
              //   child: const Text(
              //     'Get Bill',
              //     style: TextStyle(color: Colors.black),
              //   ),
              // ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  if (state is HomeCreateDiagnosisLoadingState)
                    const LinearProgressIndicator(),
                  if (state is HomeCreateDiagnosisLoadingState)
                    const SizedBox(height: 10.0),
                  buildPatient(
                    patient: patient,
                    nav: false,
                  ),
                  const SizedBox(height: 10.0),
                  Column(
                    children: [
                      const Text("Available Procedures"),
                      const SizedBox(height: 10.0),
                      Container(
                        alignment: Alignment.center,
                        child: StreamBuilder<List<ProcedureModel>>(
                          stream: HomeCubit.get(context).readProcedures(),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return Text("${snapshot.error}");
                            } else if (snapshot.hasData) {
                              final proceduresData = snapshot.data!;
                              print(proceduresData.length);
                              return ListView.builder(
                                itemCount: proceduresData.length,
                                itemBuilder: (context, index) {
                                  final item = proceduresData[index];
                                  return chipItems(item,
                                      HomeCubit.get(context).selectProcedure);
                                },
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  TextFormField(
                    controller: diagnosisController,
                    decoration: InputDecoration(
                      hintText: 'what is on your Diagnosis ...',
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
                    ),
                    maxLines: 5,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: prescriptionController,
                    decoration: InputDecoration(
                      hintText: 'Write  your prescription...',
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
                    ),
                    maxLines: 5,
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    controller: labController,
                    decoration: InputDecoration(
                      hintText: 'Should Have Lab Or Rad Tests ...',
                      border: InputBorder.none,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(
                          color: Colors.red,
                          width: 2.0,
                        ),
                      ),
                    ),
                    maxLines: 5,
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      var now = DateTime.now();
                      final patientDiagnosis = DoctorModel(
                        dateTime: now.toString(),
                        diagnosis: diagnosisController.text,
                        prescription: prescriptionController.text,
                        lab: labController.text,
                      );

                      HomeCubit.get(context).createDiagnosis(
                        patientDiagnosis,
                        patient!.uId,
                      );
                      navigateTo(
                          context,
                          BillScreenSec(
                            patient: patient,
                            procedures:
                                HomeCubit.get(context).selectedProcedures,
                            totalCost: HomeCubit.get(context).totalPrice,
                          ));
                    },
                    child: const Text(
                      'Post Diagnosis',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
