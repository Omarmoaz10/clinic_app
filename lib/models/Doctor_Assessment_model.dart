class DoctorModel {

  String? dateTime;
  String? diagnosis;
  String? prescription;
  String? lab;

  DoctorModel({
   
    this.dateTime,
    this.diagnosis,
    this.prescription,
    this.lab,
    // this.visitType,
  });

  DoctorModel.fromJson(Map<String, dynamic> json) {
 
    dateTime = json['dateTime'];
    diagnosis = json['diagnosis'];
    prescription = json['prescription'];
    lab = json['lab'];
  }

  Map<String, dynamic> tojson() {
    return {
    
      'dateTime': dateTime,
      'diagnosis': diagnosis,
      'prescription': prescription,
      'lab': lab,
    };
  }
}
