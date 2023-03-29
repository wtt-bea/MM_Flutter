import 'package:flutter/material.dart';
import 'pages/login/login_page.dart';
import 'pages/login/privacypolicy_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const MaterialApp(
        title: '漫漫',
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
