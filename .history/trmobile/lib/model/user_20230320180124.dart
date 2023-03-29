import 'package:flutter/material.dart';

class User {
  String? account; // 用户账号
  String? password; // 用户密码
  String? name; // 用户名
  String? planet; // 星球
  String? address; // 用户地址
  String? age; //用户年龄

  User(
      {this.account,
      this.password,
      this.name,
      this.planet,
      this.address,
      this.age});

  User.fromJson(dynamic json) {
    id = json["id"];
    email = json["email"];
    password = json["password"];
    username = json["username"];
    headImage = json["headImage"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["email"] = email;
    map["password"] = password;
    map["username"] = username;
    map["headImage"] = headImage;
    return map;
  }

  @override
  String toString() {
    return 'User{id: $id, email: $email, password: $password, username: $username, headImage: $headImage}';
  }
}
