import 'package:flutter/material.dart';
import '../../net/NetRequester.dart';
import '../../net/TtApi.dart';
import 'home_page.dart';
import '../community/community_page.dart';
import 'infochange_page.dart';
import 'remind_page.dart';
import '../music/music_page.dart';
import '../letter/letter_page.dart';
import 'game_page.dart';

class ClockPage extends StatefulWidget {
  final account;
  const ClockPage({
    super.key,
    required this.account,
  });

  @override
  State<ClockPage> createState() => _ClockPageState();
}

class _ClockPageState extends State<ClockPage> {
  final Color _blackColor = const Color.fromARGB(255, 43, 46, 51);
  final Color _whiteColor = Colors.white;
  final Color _pinkColor = const Color.fromARGB(255, 253, 183, 200);
  final _weeklist = [" ", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"];
  final _mounthlist = [
    " ",
    "一",
    "二",
    "三",
    "四",
    "五",
    "六",
    "七",
    "八",
    "九",
    "十",
    "十一",
    "十二"
  ];
  bool _isClock = false;
  int _clockNum = 0;
  var imgKey = UniqueKey();
  @override
  initState() {
    super.initState();
    _retrieveData();
  }

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
        child: Column(children: [
          const SizedBox(height: 72),
          Row(
            children: [
              Column(
                children: [
                  _infoChange(context),
                  const SizedBox(height: 10),
                  _itemRemind(context),
                  const SizedBox(height: 10),
                  _dailyCheckins(context),
                  const SizedBox(height: 25),
                ],
              ),
              Column(
                children: [
                  _avatar(),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 45),
                  _game(context),
                ],
              ),
            ],
          ),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _clockView(context),
              _bottomNav(context),
            ],
          ),
        ]),
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
                    color: _pinkColor,
                    size: 20,
                  ),
                  Text(
                    "家",
                    style: TextStyle(color: _pinkColor, fontSize: 11),
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

  //头像显示
  Widget _avatar() {
    return SizedBox(
        height: 100,
        width: 100,
        child: Column(
          children: [
            SizedBox(
              height: 100,
              width: 100,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "http://172.20.10.5/images/${widget.account}.png?$imgKey"),
                key: imgKey,
              ),
            ),
          ],
        ));
  }

  //小游戏按钮
  Widget _game(context) {
    return Container(
      height: 35,
      width: 90,
      margin: const EdgeInsets.only(left: 40),
      decoration: BoxDecoration(
        color: const Color.fromARGB(40, 255, 255, 255),
        border: Border.all(color: _blackColor, width: 2), // border
        borderRadius: const BorderRadius.horizontal(left: Radius.circular(5)),
      ),
      child: TextButton(
        child: Text(
          "小游戏",
          style: TextStyle(
              color: _blackColor, fontWeight: FontWeight.w400, fontSize: 13),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GamePage(
                account: widget.account,
              ),
            ),
          );
        },
      ),
    );
  }

  //信息更改按钮
  Widget _infoChange(context) {
    return Container(
      height: 35,
      width: 90,
      margin: const EdgeInsets.only(right: 40),
      decoration: BoxDecoration(
        color: const Color.fromARGB(40, 255, 255, 255),
        border: Border.all(color: _blackColor, width: 2), // border
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(5)),
      ),
      child: TextButton(
        child: Text(
          "信息更改",
          style: TextStyle(
              color: _blackColor, fontWeight: FontWeight.w400, fontSize: 13),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => InfochangePage(
                        account: widget.account,
                      )));
        },
      ),
    );
  }

  //事项提醒按钮
  Widget _itemRemind(context) {
    return Container(
      height: 35,
      width: 100,
      margin: EdgeInsets.only(right: 30),
      decoration: BoxDecoration(
        color: const Color.fromARGB(40, 255, 255, 255),
        border: Border.all(color: _blackColor, width: 2), // border
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(5)),
      ),
      child: TextButton(
        child: Text(
          "备忘录",
          style: TextStyle(
              color: _blackColor, fontWeight: FontWeight.w400, fontSize: 13),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RemindPage(
                        account: widget.account,
                      )));
        },
      ),
    );
  }

  //每日打卡按钮
  Widget _dailyCheckins(context) {
    return Container(
      height: 35,
      width: 110,
      margin: const EdgeInsets.only(right: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(200, 255, 255, 255),
        border: Border.all(color: _blackColor, width: 2), // border
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(5)),
      ),
      child: TextButton(
        child: Text(
          "每日打卡",
          style: TextStyle(
              color: _blackColor, fontWeight: FontWeight.w400, fontSize: 13),
        ),
        onPressed: () {},
      ),
    );
  }

  //打卡
  Widget _clockView(context) {
    DateTime dateTime = DateTime.now();
    int _day = dateTime.day;
    int month = dateTime.month;
    String _month = _mounthlist[month];
    int week = dateTime.weekday;
    String _week = _weeklist[week];
    return StatefulBuilder(builder:
        (BuildContext context, void Function(void Function()) setState) {
      return Container(
        height: 550,
        width: 340,
        decoration: BoxDecoration(
          image: _isClock
              ? const DecorationImage(
                  image: AssetImage("lib/assets/images/clock.png"),
                  fit: BoxFit.cover)
              : const DecorationImage(
                  image: AssetImage("lib/assets/images/unclock.png"),
                  fit: BoxFit.cover),
          // color: Color.fromARGB(230, 255, 255, 255),
          borderRadius: BorderRadius.circular(27),
          boxShadow: const [
            BoxShadow(
              color: Color.fromARGB(100, 255, 255, 255),
              offset: Offset(3, -10),
              blurRadius: 10,
            )
          ],
        ),
        child: Column(children: [
          const SizedBox(height: 40),
          SizedBox(
            child: Row(
              children: [
                const SizedBox(width: 25),
                Text(
                  "$_day",
                  style: TextStyle(
                      color: _blackColor,
                      fontSize: 55,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 30),
              SizedBox(
                child: Text(
                  "$_month月 $_week",
                  style: TextStyle(
                      color: _blackColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ],
          ),
          const SizedBox(height: 80),
          SizedBox(
              child: _isClock
                  ? const Text("")
                  : Text(
                      "买一本感兴趣的杂志阅读",
                      style: TextStyle(
                          color: _blackColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w300),
                    )),
          const SizedBox(height: 150),
          Container(
            height: 40,
            width: 130,
            // margin: const EdgeInsets.only(right: 50),
            decoration: BoxDecoration(
              color: !_isClock ? _pinkColor : _whiteColor,
              border: Border.all(color: _blackColor, width: 2), // border
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
            child: TextButton(
              child: _isClock
                  ? Text(
                      "今日已完成打卡",
                      style: TextStyle(
                          color: _blackColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    )
                  : Text(
                      "完成打卡",
                      style: TextStyle(
                          color: _blackColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                    ),
              onPressed: () async {
                if (_isClock == false) {
                  _sentisClock();
                  await NetRequester.request(
                      Apis.addPoint(widget.account, 1000));
                  // ignore: use_build_context_synchronously
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        title: const Text(
                          "积分增加",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        content: const Text(
                          "恭喜您获得1000积分",
                          style: TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w300),
                        ),
                        actions: <Widget>[
                          OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  width: 1.0, color: Colors.black),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "确 认",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300),
                            ),
                          )
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            child: Text(
              "您已完成打卡$_clockNum次",
              style: const TextStyle(fontWeight: FontWeight.w300),
            ),
          ),
        ]),
      );
    });
  }

  //获取个人是否签到信息
  void _retrieveData() async {
    var result = await NetRequester.request(Apis.isClock(widget.account));
    if (mounted) {
      if (result["data"]["clock"] == 0) {
        setState(() {
          _isClock = false;
          _clockNum = result["data"]["clocktime"];
        });
      } else {
        setState(() {
          _isClock = true;
          _clockNum = result["data"]["clocktime"];
        });
      }
    }
  }

  //签到按钮
  void _sentisClock() async {
    var result = await NetRequester.request(Apis.updateClock(widget.account));
    if (result["message"] == "true") {
      _retrieveData();
    }
  }
}
