// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    required this.error,
    required this.message,
    required this.userDetail,
  });

  String error;
  String message;
  List<UserDetail> userDetail;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        error: json["error"],
        message: json["message"],
        userDetail: List<UserDetail>.from(
            json["user_detail"].map((x) => UserDetail.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "error": error,
        "message": message,
        "user_detail": List<dynamic>.from(userDetail.map((x) => x.toJson())),
      };
}

class UserDetail {
  UserDetail({
    required this.id,
    required this.name,
    required this.email,
    required this.emailVerifiedAt,
    required this.password,
    required this.type,
    required this.status,
    required this.tPin,
    required this.kycStatus,
    required this.rememberToken,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
  });

  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String password;
  int type;
  int status;
  int tPin;
  int kycStatus;
  String rememberToken;
  DateTime createdAt;
  DateTime updatedAt;
  dynamic createdBy;

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        emailVerifiedAt: json["email_verified_at"],
        password: json["password"],
        type: json["type"],
        status: json["status"],
        tPin: json["t_pin"],
        kycStatus: json["kyc_status"],
        rememberToken: json["remember_token"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        createdBy: json["created_by"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "email_verified_at": emailVerifiedAt,
        "password": password,
        "type": type,
        "status": status,
        "t_pin": tPin,
        "kyc_status": kycStatus,
        "remember_token": rememberToken,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "created_by": createdBy,
      };
}
