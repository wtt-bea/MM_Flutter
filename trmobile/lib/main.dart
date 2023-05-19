import 'package:flutter/material.dart';
import 'pages/login/login_page.dart';
import 'package:get/get.dart';
import 'pages/home/home_page.dart';
import 'pages/home/game_page.dart';

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
