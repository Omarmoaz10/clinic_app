class ProcedureModel {
  String? name;
  String? uId;

  ProcedureModel({
    this.name,
    this.uId,
  });

  Map<String, dynamic> tojson() {
    return {
      'name': name,
      'uId': uId,
    };
  }

  static ProcedureModel fromJson(Map<String, dynamic> json) => ProcedureModel(
        name: json['name'],
        uId: json['uId'],
      );
}
