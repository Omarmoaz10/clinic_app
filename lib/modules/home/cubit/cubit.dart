import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:clinic_app/models/Doctor_Assessment_model.dart';
import 'package:clinic_app/models/patient_model.dart';
import 'package:clinic_app/models/procedure_model.dart';
import 'package:clinic_app/models/search_model.dart';
import 'package:clinic_app/modules/home/cubit/states.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../models/social_user_model.dart';
import '../../../shared/component/constanse.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  SocialUserModel? userModel;
  PatientModel? patientModel;
  ProcedureModel? procedureModel;
  SearchModel? searchModel;
  List<ProcedureModel> selectedProcedures = [];
  void getUserData() {
    emit(HomeGetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      //print(value.data());
      userModel = SocialUserModel.fromJson(value.data()!);
      emit(HomeGetUserSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeGetUserErrorState(error.toString()));
    });
  }

  //Read data to show in HomePage
  Stream<List<PatientModel>> readPatient() => FirebaseFirestore.instance
      .collection("patients")
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => PatientModel.fromJson(doc.data()))
          .toList());

  //Read procedures to show in DoctorScreen
  Stream<List<ProcedureModel>> readProcedures() => FirebaseFirestore.instance
      .collection("procedures")
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => ProcedureModel.fromJson(doc.data()))
          .toList());

  String searchText = "";
  void search(name) {
    emit(SearchPatientsLoadingState());
    searchText = name;
    emit(SearchPatientsSuccessState());
  }

  Stream<List<PatientModel>>? searchPatient() {
    var f = FirebaseFirestore.instance
        .collection('patients')
        .where("name", isEqualTo: searchText)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => PatientModel.fromJson(doc.data()))
            .toList());

    return f;

    //return null;
  }

  // create subCollection
  Future createDiagnosis(DoctorModel diagnosis, String? patientId) async {
    emit(HomeCreateDiagnosisLoadingState());
    final docPatientDiagnosis = FirebaseFirestore.instance
        .collection('patients')
        .doc(patientId)
        .collection('Diagnosis')
        .doc();

    final json = diagnosis.tojson();
    // write data to firebase
    await docPatientDiagnosis.set(json); // check it <<<<<<<<<<
    emit(HomeCreateDiagnosisSuccessState());
  }

  Future updatePatient(
    PatientModel updatedPatient,
  ) async {
    emit(UpdatePatientsLoadingState());
    final docPatientEdit = FirebaseFirestore.instance
        .collection('patients')
        .doc(updatedPatient.uId);

    final json = updatedPatient.tojson();
    // Update data to firebase
    await docPatientEdit.update(json);
    emit(UpdatePatientsSuccessState());
  }

  Future deletePatient({required patientId}) async {
    emit(DeletePatientsLoadingState());
    final docPatientDelete =
        FirebaseFirestore.instance.collection('patients').doc(patientId);
    // Delete data to firebase
    await docPatientDelete.delete();
    emit(DeletePatientsSuccessState());
  }

  double totalPrice = 0.0;
  void selectProcedure(bool selected, ProcedureModel p) {
    (selected)
        ? {selectedProcedures.add(p), totalPrice = totalPrice + (p.cost)!}
        : {selectedProcedures.remove(p), totalPrice = totalPrice - (p.cost)!};
    print(selectedProcedures.length);
    print(selected);
  }
}
