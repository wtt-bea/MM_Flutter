import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:trmobile/pages/community/post.dart';
import '../../net/TtApi.dart';
import '../../net/NetRequester.dart';
import '../../model/User.dart';
import '../home/home_page.dart';
import 'dart:async';
import '../music/music_page.dart';

class LetterPage extends StatefulWidget {
  final account;
  const LetterPage({super.key, required this.account});

  @override
  State<LetterPage> createState() => _LetterPageState();
}

class _LetterPageState extends State<LetterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/images/homebg.jpg")),
        ),
      ),
    );
  }
}
