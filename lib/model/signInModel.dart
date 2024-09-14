// To parse this JSON data, do
//
//     final signInModel = signInModelFromJson(jsonString);

import 'dart:convert';

SignInModel signInModelFromJson(String str) => SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  bool? status;
  String? message;
  Data? data;

  SignInModel({
    this.status,
    this.message,
    this.data,
  });

  SignInModel copyWith({
    bool? status,
    String? message,
    Data? data,
  }) =>
      SignInModel(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory SignInModel.fromJson(Map<String, dynamic> json) => SignInModel(
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
  String? id;
  String? username;
  String? email;
  String? password;
  int? v;

  Data({
    this.id,
    this.username,
    this.email,
    this.password,
    this.v,
  });

  Data copyWith({
    String? id,
    String? username,
    String? email,
    String? password,
    int? v,
  }) =>
      Data(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        password: password ?? this.password,
        v: v ?? this.v,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    username: json["username"],
    email: json["email"],
    password: json["password"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "username": username,
    "email": email,
    "password": password,
    "__v": v,
  };
}
