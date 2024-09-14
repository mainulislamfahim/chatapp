// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromJson(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromJson(String str) => SignUpModel.fromJson(json.decode(str));

String signUpModelToJson(SignUpModel data) => json.encode(data.toJson());

class SignUpModel {
  bool? status;
  String? message;
  Data? data;

  SignUpModel({
    this.status,
    this.message,
    this.data,
  });

  SignUpModel copyWith({
    bool? status,
    String? message,
    Data? data,
  }) =>
      SignUpModel(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory SignUpModel.fromJson(Map<String, dynamic> json) => SignUpModel(
    status: json["status"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String? username;
  String? email;
  String? password;
  String? id;
  int? v;

  Data({
    this.username,
    this.email,
    this.password,
    this.id,
    this.v,
  });

  Data copyWith({
    String? username,
    String? email,
    String? password,
    String? id,
    int? v,
  }) =>
      Data(
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        id: id ?? this.id,
        v: v ?? this.v,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    username: json["username"],
    email: json["email"],
    password: json["password"],
    id: json["_id"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "username": username,
    "email": email,
    "password": password,
    "_id": id,
    "__v": v,
  };
}
