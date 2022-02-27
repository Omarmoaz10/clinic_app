class SearchModel {
  String? name;
  String? uId;

  SearchModel({
    this.name,
    this.uId,
  });

  Map<String, dynamic> tojson() {
    return {
      'name': name,
      'uId': uId,
    };
  }

  static SearchModel fromJson(Map<String, dynamic> json) => SearchModel(
        name: json['name'],
        uId: json['uId'],
      );
}
