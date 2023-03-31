import 'package:flutter/material.dart';

class User {
  String? account; // 用户账号
  String? password; // 用户密码
  String? name; // 用户名
  String? planet; // 星球
  String? address; // 用户地址
  String? age; //用户年龄
  String? avatar; //用户头像

  User(
      {this.account,
      this.password,
      this.name,
      this.planet,
      this.address,
      this.age,
      this.avatar});

  User.fromJson(dynamic json) {
    account = json["account"];
    password = json["password"];
    name = json["name"];
    planet = json["planet"];
    address = json["address"];
    age = json["age"];
    avatar = json["avatar"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["account"] = account;
    map["password"] = password;
    map["name"] = name;
    map["planet"] = planet;
    map["address"] = address;
    map["age"] = age;
    map["avatar"] = avatar;
    return map;
  }

  @override
  String toString() {
    return 'User{account: $account, password: $password, name: $name, planet: $planet, address: $address, age: $age, avatar: $avatar}';
  }
}
