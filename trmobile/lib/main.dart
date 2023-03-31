import 'package:flutter/material.dart';
import 'pages/login/login_page.dart';
import 'pages/login/regist_page.dart';
import 'pages/login/privacypolicy_page.dart';
import 'pages/login/useragreement_page.dart';

import 'pages/community/community_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '漫漫',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.grey),
      home: RegistPage(),
    );
  }
}
