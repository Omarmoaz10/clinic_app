import 'package:clinic_app/modules/home/home.dart';
import 'package:clinic_app/modules/patient_register/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/patient_model.dart';
import '../../shared/component/components.dart';
import '../Doctor/doctor_room.dart';
import '../home/cubit/cubit.dart';
import '../home/cubit/states.dart';

class PatientEdit extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var nameController = TextEditingController();
  var addressController = TextEditingController();
  var agedController = TextEditingController();
  var phoneController = TextEditingController();
  var visitController = TextEditingController();
  var visitTypeController = TextEditingController();
  final PatientModel? patient;
  PatientEdit(this.patient, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(listener: (context, state) {
        if (state is PatientCreateUserSuccessState) {
          print("Done Edit patient");
        }
      }, builder: (context, state) {
        return Scaffold(
          appBar: AppBar(),
          body: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ' Edit Patient',
                        style: Theme.of(context).textTheme.headline4!.copyWith(
                              color: Colors.black,
                            ),
                      ),
                      const SizedBox(height: 30.0),
                      defaultFormField(
                        controller: nameController,
                        type: TextInputType.name,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter Name';
                          }
                          return null;
                        },
                        label: 'Name',
                      ),
                      const SizedBox(height: 15.0),
                      defaultFormField(
                        controller: addressController,
                        type: TextInputType.streetAddress,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'Address Should know';
                          }
                          return null;
                        },
                        label: 'Address',
                      ),
                      const SizedBox(height: 15.0),
                      defaultFormField(
                        controller: agedController,
                        type: TextInputType.number,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter yor age';
                          }
                          return null;
                        },
                        label: 'Age',
                      ),
                      const SizedBox(height: 15.0),
                      defaultFormField(
                        controller: phoneController,
                        type: TextInputType.phone,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter Your phone';
                          }
                          return null;
                        },
                        label: 'phone',
                      ),
                      const SizedBox(height: 15.0),
                      //TO DO Change to DateFormFiled
                      defaultFormField(
                        controller: visitController,
                        type: TextInputType.datetime,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter Your date of visit';
                          }
                          return null;
                        },
                        label: 'visit time',
                      ),
                      const SizedBox(height: 15.0),
                      defaultFormField(
                        controller: visitTypeController,
                        type: TextInputType.text,
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return 'please enter Your date of visit type ( Examination Or Consultation )';
                          }
                          return null;
                        },
                        label: 'Visit Type \n ( Examination Or Consultation )',
                      ),
                      const SizedBox(height: 30.0),
                      defaultButton(
                        function: () {
                          if (formKey.currentState!.validate()) {
                            PatientModel updatedpatient = PatientModel(
                              uId: patient!.uId,
                              name: nameController.text,
                              address: addressController.text,
                              age: agedController.text,
                              phone: phoneController.text,
                              visit: visitController.text,
                              visitType: visitTypeController.text,
                            );
                            HomeCubit.get(context)
                                .updatePatient(updatedpatient)
                                .then((value) {
                              navigateTo(
                                context,
                                Home(),
                              );
                            });
                          }
                        },
                        text: 'Update New Patient',
                        isUpperCase: true,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
