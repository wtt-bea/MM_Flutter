import 'package:audioplayers/audioplayers.dart';
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
import '../community/community_page.dart';

class MusicPage extends StatefulWidget {
  final account;
  const MusicPage({
    super.key,
    required this.account,
  });

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
            _contextShow(context),
            const SizedBox(height: 12),
            _bottomNav(context),
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
                            0xe6c4,
                            fontFamily: "MyIcons",
                          ),
                          color: flag_1 ? _whiteColor : _blackColor,
                          size: 24,
                        ),
                        const SizedBox(width: 5),
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
                            0xe607,
                            fontFamily: "MyIcons",
                          ),
                          size: 24,
                          color: flag_2 ? _whiteColor : _blackColor,
                        ),
                        const SizedBox(width: 5),
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

  //生成listview
  Widget _contextShow(context) {
    return Container(
      height: 615,
      width: 335,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(50, 80, 80, 80),
            offset: Offset(0.0, 6.0),
            blurRadius: 8,
            spreadRadius: 5,
          )
        ],
        color: Color.fromARGB(230, 255, 255, 255),
      ),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 10),
            //搜索bar
            // _searchBar(context),
            SizedBox(
              height: 595,
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 1.0),
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.amberAccent),
                    height: 50,
                    width: 50,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //底部导航栏
  Widget _bottomNav(context) {
    return Container(
      alignment: Alignment.center,
      width: 340,
      height: 53,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: const Color.fromARGB(255, 43, 46, 51),
      ),
      child: Row(
        children: <Widget>[
          const SizedBox(
            width: 27,
          ),
          SizedBox(
            width: 65,
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
              ),
              child: Column(
                children: [
                  Icon(
                    const IconData(
                      0xe609,
                      fontFamily: "MyIcons",
                    ),
                    size: 20,
                    color: _whiteColor,
                  ),
                  Text(
                    "社区",
                    style: TextStyle(color: _whiteColor, fontSize: 11),
                  ),
                ],
              ),
              //社区按钮
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CommunityPage(
                      account: widget.account,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 59,
            width: 75,
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
              ),
              child: Column(
                children: [
                  Icon(
                    const IconData(
                      0xe714,
                      fontFamily: "MyIcons",
                    ),
                    size: 20,
                    color: _pinkColor,
                  ),
                  Text(
                    "助眠",
                    style: TextStyle(color: _pinkColor, fontSize: 11),
                  ),
                ],
              ),
              //助眠按钮
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MusicPage(
                              account: widget.account,
                            )));
              },
            ),
          ),
          SizedBox(
            height: 59,
            width: 75,
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
              ),
              child: Column(
                children: [
                  Icon(
                    const IconData(
                      0xe64d,
                      fontFamily: "MyIcons",
                    ),
                    size: 20,
                    color: _whiteColor,
                  ),
                  Text(
                    "信箱",
                    style: TextStyle(color: _whiteColor, fontSize: 11),
                  ),
                ],
              ),
              //信箱按钮
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => LetterPage(
                              account: widget.account,
                            )));
              },
            ),
          ),
          SizedBox(
            height: 59,
            width: 75,
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.home,
                    color: _whiteColor,
                    size: 20,
                  ),
                  Text(
                    "家",
                    style: TextStyle(color: _whiteColor, fontSize: 11),
                  ),
                ],
              ),
              //家按钮
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => HomePage(
                              account: widget.account,
                            )));
              },
            ),
          ),
        ],
      ),
    );
  }
}
