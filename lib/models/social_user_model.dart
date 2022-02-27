class SocialUserModel {
  String? name;
  String? email;
  String? phone;
  String? uId;
  String? type;
  bool? isEmailVerified;

  SocialUserModel({
    this.email,
    this.name,
    this.phone,
    this.uId,
    this.type,
    this.isEmailVerified,
  });

  SocialUserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uId = json['uId'];
    type = json['type'];
    isEmailVerified = json['isEmailVerified'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'uId': uId,
      'type': type,
      'isEmailVerified': isEmailVerified,
    };
  }
}
