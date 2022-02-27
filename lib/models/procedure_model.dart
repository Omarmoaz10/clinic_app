class ProcedureModel {
  String? name; // هى ال title
  String? uId;
  int? cost;
  // final bool isSelected;

  ProcedureModel({
    this.name,
    this.uId,
    this.cost,
    //this.isSelected=false,
  });

  Map<String, dynamic> tojson() {
    return {
      'name': name,
      'uId': uId,
      "cost": cost,
    };
  }

  static ProcedureModel fromJson(Map<String, dynamic> json) => ProcedureModel(
        name: json['name'],
        uId: json['uId'],
        cost: json["cost"],
      );
}
