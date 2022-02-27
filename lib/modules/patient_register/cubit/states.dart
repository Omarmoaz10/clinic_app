abstract class PatientRegisterStates {}

class PatientRegisterInitialState extends PatientRegisterStates {}

class PatientRegisterLoadingState extends PatientRegisterStates {}

class PatientRegisterSuccessState extends PatientRegisterStates {}

class PatientRegisterErrorState extends PatientRegisterStates
{
  final String error;

  PatientRegisterErrorState(this.error);
}

class PatientCreateUserSuccessState extends PatientRegisterStates {}

class PatientCreateUserErrorState extends PatientRegisterStates
{
  final String error;

  PatientCreateUserErrorState(this.error);
}


class HomeGetPatientLoadingState extends PatientRegisterStates {}

class HomeGetPatientSuccessState extends PatientRegisterStates {}

class HomeGetPatientErrorState extends PatientRegisterStates
{
  final String error;

  HomeGetPatientErrorState(this.error);
}


