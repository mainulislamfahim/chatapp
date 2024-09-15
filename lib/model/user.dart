// To parse this JSON data, do
//
//     final allUsers = allUsersFromJson(jsonString);

import 'dart:convert';

AllUsers allUsersFromJson(String str) => AllUsers.fromJson(json.decode(str));

String allUsersToJson(AllUsers data) => json.encode(data.toJson());

class AllUsers {
  List<Users>? data;

  AllUsers({
    this.data,
  });

  AllUsers copyWith({
    List<Users>? data,
  }) =>
      AllUsers(
        data: data ?? this.data,
      );

  factory AllUsers.fromJson(Map<String, dynamic> json) => AllUsers(
    data: json["data"] == null ? [] : List<Users>.from(json["data"]!.map((x) => Users.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Users {
  String? id;
  String? username;
  String? email;
  int? v;

  Users({
    this.id,
    this.username,
    this.email,
    this.v,
  });

  Users copyWith({
    String? id,
    String? username,
    String? email,
    String? password,
    int? v,
  }) =>
      Users(
        id: id ?? this.id,
        username: username ?? this.username,
        email: email ?? this.email,
        v: v ?? this.v,
      );

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    id: json["_id"],
    username: json["username"],
    email: json["email"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "username": username,
    "email": email,
    "__v": v,
  };
}
