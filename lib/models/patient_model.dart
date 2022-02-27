class PatientModel {
  String? name;
  String? address;
  String? age;
  String? phone;
  String? uId;
  String? visit;
  String? visitType;

  PatientModel({
    this.name,
    this.address,
    this.age,
    this.phone,
    this.uId,
    this.visit,
    this.visitType,
  });

 

  Map<String, dynamic> tojson() {
    return {
      'name': name,
      'address': address,
      'age':age,
      'phone': phone,
      'uId': uId,
      'visit': visit,
      'visitType':visitType,
    };
  }

 static PatientModel fromJson(Map<String, dynamic> json)=>PatientModel (
    name : json['name'],
    address : json['address'],
    age : json['age'],
    phone : json['phone'],
    uId : json['uId'],
    visit: json['visit'],
    visitType : json['visitType'],
 );



}
