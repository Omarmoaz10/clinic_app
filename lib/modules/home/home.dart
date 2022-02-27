import 'package:clinic_app/modules/home/cubit/cubit.dart';
import 'package:clinic_app/modules/home/cubit/states.dart';
import 'package:clinic_app/shared/component/components.dart';
import 'package:clinic_app/shared/component/patient_Info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/patient_model.dart';
import '../patient_register/patient_register.dart';
import '../search/search_screen.dart';


class Home extends StatelessWidget {
//  PatientModel? patient;

//   Home(this.patient, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading  :false,
            title: const Text("Clinic Schadel"),
            actions: [
              TextButton(
                onPressed: () {
                  navigateTo(context, PatientRegister());
                },
                child: const Text(
                  "Create New Patient",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 8),
             IconButton(
                icon: const Icon(
                  Icons.search,
                ),
                onPressed: ()
                {
                 navigateTo(context, SearchScreen(),);
                },
              ),
            ],
          ),
          body: Container(
            alignment: Alignment.topLeft,
            child: StreamBuilder<List<PatientModel>>(
              stream: HomeCubit.get(context).readPatient(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text("Some went wrong");
                } else if (snapshot.hasData) {
                  final patientsData = snapshot.data!;

                  return ListView.builder(
                    itemCount: patientsData.length,
                    itemBuilder: (context, index) {
                      final item = patientsData[index];
                      return buildPatient(patient: item,);
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
        );
      },
    );
  }

  
}
