import 'package:flutter/material.dart';
import '../community/community_page.dart';
import '../../net/TtApi.dart';
import '../../net/NetRequester.dart';
import '../home/home_page.dart';
import '../music/music_page.dart';

class LetterPage extends StatefulWidget {
  final account;
  const LetterPage({super.key, required this.account});

  @override
  State<LetterPage> createState() => _LetterPageState();
}

class _LetterPageState extends State<LetterPage> {
  final Color _blackColor = const Color.fromARGB(255, 43, 46, 51);
  final Color _whiteColor = Colors.white;
  final Color _pinkColor = const Color.fromARGB(255, 253, 183, 200);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/images/letter_bg.jpg")),
        ),
        child: Column(children: [
          const SizedBox(height: 40),
          _topNav(),
          const SizedBox(height: 465),
          _btn(),
          const SizedBox(height: 68),
          _bottomNav(context),
        ]),
      ),
    );
  }

  Widget _topNav() {
    DateTime dateTime = DateTime.now();
    int _year = dateTime.year;
    int _month = dateTime.month;
    int _day = dateTime.day;
    return SizedBox(
      height: 40,
      width: 360,
      child: Row(children: [
        const SizedBox(width: 20),
        SizedBox(
          width: 200,
          child: Text(
            "$_year年 $_month月 $_day日",
            style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w600,
                fontSize: 18),
          ),
        ),
      ]),
    );
  }

  Widget _btn() {
    return Container(
      // height: 150,
      // decoration: BoxDecoration(color: Colors.brown),
      child: Column(children: [
        SizedBox(
          width: 160,
          height: 40,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              backgroundColor: _blackColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              "查看信箱",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        SizedBox(
          width: 160,
          height: 40,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: BorderSide(width: 1.0, color: _blackColor),
              backgroundColor: _whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text(
              "发送信件",
              style: TextStyle(
                  fontSize: 15,
                  color: _blackColor,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ]),
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
                    color: _whiteColor,
                  ),
                  Text(
                    "助眠",
                    style: TextStyle(color: _whiteColor, fontSize: 11),
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
                    color: _pinkColor,
                  ),
                  Text(
                    "信箱",
                    style: TextStyle(color: _pinkColor, fontSize: 11),
                  ),
                ],
              ),
              //信箱按钮
              onPressed: () {},
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
