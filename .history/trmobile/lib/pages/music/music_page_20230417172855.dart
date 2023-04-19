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
import '../letter/letter_page.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  final Color _blackColor = const Color.fromARGB(255, 43, 46, 51);
  final Color _whiteColor = Colors.white;
  final Color _pinkColor = const Color.fromARGB(255, 253, 183, 200);
  bool flag_1 = false;
  bool flag_2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.centerLeft,
            colors: [
              Color.fromARGB(255, 253, 183, 200),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 35),
            _topNavBar(),
            const SizedBox(height: 13),
            // _contextShow(context),
            // const SizedBox(height: 12),
            // _bottomNav(context),
          ],
        ),
      ),
    );
  }

  //音乐导航栏
  Widget _topNavBar() {
    return Container(
      alignment: Alignment.center,
      width: 335,
      height: 44,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromARGB(255, 43, 46, 51),
      ),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            width: 310,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 43, 46, 51),
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                SizedBox(
                  width: 155,
                  child: TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.only(left: 45),
                      ),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor: MaterialStateProperty.all(
                          flag_1 ? _blackColor : _whiteColor),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          const IconData(
                            0xe617,
                            fontFamily: "PlanetIcons",
                          ),
                          color: flag_1 ? _whiteColor : _blackColor,
                          size: 24,
                        ),
                        Text("白噪音",
                            style: TextStyle(
                                color: flag_1 ? _whiteColor : _blackColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    //焦虑星
                    onPressed: () {
                      if (mounted) {
                        setState(() {
                          flag_1 = false;
                          flag_2 = true;
                        });
                      }
                    },
                  ),
                ),
                SizedBox(
                  width: 155,
                  child: TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.only(left: 45),
                      ),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor: MaterialStateProperty.all(
                          flag_2 ? _blackColor : _whiteColor),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          const IconData(
                            0xe6c4,
                            fontFamily: "MyIcons",
                          ),
                          size: 24,
                          color: flag_2 ? _whiteColor : _blackColor,
                        ),
                        Text("轻音乐",
                            style: TextStyle(
                                color: flag_2 ? _whiteColor : _blackColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    onPressed: () {
                      if (mounted) {
                        setState(() {
                          flag_1 = true;
                          flag_2 = false;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
