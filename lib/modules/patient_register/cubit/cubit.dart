import 'package:clinic_app/modules/patient_register/cubit/states.dart';
import 'package:clinic_app/shared/component/constanse.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/patient_model.dart';

class PatientRegisterCubit extends Cubit<PatientRegisterStates> {
  PatientRegisterCubit() : super(PatientRegisterInitialState());

  static PatientRegisterCubit get(context) => BlocProvider.of(context);
  PatientModel? registeredPatient;
  Future<PatientModel?> patientRegister({
    required String name,
    required String address,
    required String age,
    required String phone,
    required String visit,
    required String visitType,
  }) async {
    emit(PatientRegisterLoadingState());
    final docPatient = FirebaseFirestore.instance.collection('patients').doc();
    registeredPatient = PatientModel(
      name: name,
      address: address,
      age: age,
      phone: phone,
      uId: docPatient.id,
      visit: visit,
      visitType: visitType,
    );
    final json = registeredPatient!.tojson();
    // write data to firebase
    await docPatient.set(json);

    emit(PatientRegisterSuccessState());
    return registeredPatient;
  }
}
