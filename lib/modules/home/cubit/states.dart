abstract class HomeStates {}

class HomeInitialState extends HomeStates {}

class HomeGetUserLoadingState extends HomeStates {}

class HomeGetUserSuccessState extends HomeStates {}

class HomeGetUserErrorState extends HomeStates
{
  final String error;

  HomeGetUserErrorState(this.error);
}

class HomeGetPatientLoadingState extends HomeStates {}

class HomeGetPatientSuccessState extends HomeStates {}

class HomeGetPatientErrorState extends HomeStates
{
  final String error;

  HomeGetPatientErrorState(this.error);
}


// createDiagnosis

class HomeCreateDiagnosisLoadingState extends HomeStates {}
class HomeCreateDiagnosisSuccessState extends HomeStates {}
class HomeCreateDiagnosisErrorState extends HomeStates {}

// get diagnosis
class GetDiagnosisLoadingState extends HomeStates {}
class GetDiagnosisSuccessState extends HomeStates {}
class GetDiagnosisPostsErrorState extends HomeStates
{
  final String error;
  GetDiagnosisPostsErrorState(this.error);
}



//patients
class HomeGetAllPatientsLoadingState extends HomeStates {}
class HomeGetAllPatientsSuccessState extends HomeStates {}
class HomeGetAllPatientsErrorState extends HomeStates
{
  final String error;
  HomeGetAllPatientsErrorState(this.error);
}

//updatePatients
class UpdatePatientsLoadingState extends HomeStates {}
class UpdatePatientsSuccessState extends HomeStates {}
class UpdatePatientsErrorState extends HomeStates
{
  final String error;
  UpdatePatientsErrorState(this.error);
}

//DeletePatients
class DeletePatientsLoadingState extends HomeStates {}
class DeletePatientsSuccessState extends HomeStates {}
class DeletePatientsErrorState extends HomeStates
{
  final String error;
  DeletePatientsErrorState(this.error);
}



//SearchPatients
class SearchPatientsLoadingState extends HomeStates {}
class SearchPatientsSuccessState extends HomeStates {}
class SearchPatientsErrorState extends HomeStates
{
  final String error;
  SearchPatientsErrorState(this.error);
}


//getProcedures
class GetProcedureLoadingState extends HomeStates {}
class GetProcedureSuccessState extends HomeStates {}
class GetProcedureErrorState extends HomeStates
{
  final String error;
  GetProcedureErrorState(this.error);
}