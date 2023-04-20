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
  final _weeklist = [" ", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"];
  final List _dayIcon = [60518, 60517, 60539, 60533, 60530];

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

  //显示日期 天气
  Widget _topNav() {
    DateTime dateTime = DateTime.now();
    int _year = dateTime.year;
    int _month = dateTime.month;
    int _day = dateTime.day;
    // int _hour = dateTime.hour;
    int _hour = 6;
    int week = dateTime.weekday;
    String _week = _weeklist[week];
    int _index = 0;
    if ((_hour >= 6) && (_hour < 14)) {
      _index = 0;
    } else if ((_hour >= 15) && (_hour < 17)) {
      _index = 1;
    } else if ((_hour >= 18) && (_hour < 21)) {
      _index = 2;
    } else if ((_hour >= 22) && (_hour < 24)) {
      _index = 3;
    } else if ((_hour >= 0) && (_hour < 6)) {
      _index = 4;
    }
    return SizedBox(
      height: 40,
      width: 360,
      child: Row(children: [
        const SizedBox(width: 20),
        Container(
          // margin: const EdgeInsets.only(top: 5),
          width: 150,
          child: Text(
            "$_month月$_day日 $_week",
            style: TextStyle(
                color: _blackColor, fontWeight: FontWeight.w500, fontSize: 19),
          ),
        ),
        const SizedBox(width: 55),
        Container(
            width: 120,
            height: 34,
            decoration: BoxDecoration(
                color: _blackColor,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Row(
              children: [
                const SizedBox(width: 15),
                //显示温度
                SizedBox(
                  child: Text("1",
                      style: TextStyle(
                          color: _whiteColor, fontWeight: FontWeight.w300)),
                ),
                SizedBox(
                  child: Icon(
                    const IconData(
                      0xe6ce,
                      fontFamily: "MyIcons",
                    ),
                    size: 17,
                    color: _whiteColor,
                  ),
                ),
                const SizedBox(width: 15),
                //显示白天or晚上
                SizedBox(
                  child: Icon(
                    IconData(
                      _dayIcon[_index],
                      fontFamily: "MyIcons",
                    ),
                    size: 17,
                    color: _whiteColor,
                  ),
                ),
                const SizedBox(width: 15),
                //显示温度
                SizedBox(
                  child: Icon(
                    const IconData(
                      0xec6e,
                      fontFamily: "MyIcons",
                    ),
                    size: 17,
                    color: _whiteColor,
                  ),
                ),
              ],
            )),
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
