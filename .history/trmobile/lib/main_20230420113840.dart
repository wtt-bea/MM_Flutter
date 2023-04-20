import 'package:flutter/material.dart';
import 'pages/login/login_page.dart';
import 'pages/login/regist_page.dart';
import 'pages/login/privacypolicy_page.dart';
import 'pages/login/useragreement_page.dart';
import 'pages/community/community_page.dart';
import 'package:provider/provider.dart';
import 'model/User.dart';
import 'pages/home/home_page.dart';
import 'package:get/get.dart';
import 'pages/home/remind_page.dart';
import 'pages/music/music_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '漫漫',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: LoginPage(),
    );
  }
}
