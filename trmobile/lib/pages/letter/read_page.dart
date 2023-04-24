import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../net/TtApi.dart';
import '../../net/NetRequester.dart';
import '../home/home_page.dart';
import '../music/music_page.dart';
import '../community/community_page.dart';
import '../letter/letter_page.dart';
import '../letter/detial_page.dart';

class ReadPage extends StatefulWidget {
  final account;
  const ReadPage({super.key, required this.account});

  @override
  State<ReadPage> createState() => _ReadPageState();
}

class _ReadPageState extends State<ReadPage> {
  final Color _blackColor = const Color.fromARGB(255, 43, 46, 51);
  final Color _whiteColor = Colors.white;
  final Color _pinkColor = const Color.fromARGB(255, 253, 183, 200);
  final _weeklist = [" ", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"];
  final List _dayIcon = [59137, 60517, 60539, 60533, 60530];
  final List _weather = [60518, 60520, 60521, 60523, 60528, 58896];
  int _data = 0;
  int _temperature = 0;
  List _letter = [];
  bool _newLetter = false;
  @override
  initState() {
    super.initState();
    _getLetter();
    _getData();
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
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 254, 195, 209),
              Color.fromARGB(255, 255, 249, 249),
            ],
          ),
        ),
        child: Column(
          children: [
            const SizedBox(height: 25),
            SizedBox(
                height: 40,
                width: 370,
                child: Row(
                  children: [
                    _topBackBar(),
                    _topNav(),
                  ],
                )),
            _letterView(context),
            _bottomNav(context),
          ],
        ),
      ),
    );
  }

  //返回按钮
  Widget _topBackBar() {
    return SizedBox(
      width: 48,
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(const IconData(0xe8ef, fontFamily: "MyIcons"),
                size: 25, color: _blackColor),
          )
        ],
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
    if ((_hour >= 6) && (_hour <= 14)) {
      _index = 0;
    } else if ((_hour > 14) && (_hour < 17)) {
      _index = 1;
    } else if ((_hour >= 17) && (_hour < 21)) {
      _index = 2;
    } else if ((_hour >= 21) && (_hour <= 24)) {
      _index = 3;
    } else if ((_hour >= 0) && (_hour < 6)) {
      _index = 4;
    }
    return SizedBox(
      height: 40,
      width: 300,
      child: Row(children: [
        SizedBox(
          width: 150,
          child: Text(
            "$_month月$_day日 $_week",
            style: TextStyle(
                color: _blackColor, fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ),
        const SizedBox(width: 40),
        Container(
            width: 110,
            height: 30,
            decoration: BoxDecoration(
                color: _blackColor,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: Row(
              children: [
                const SizedBox(width: 10),
                //显示温度数字
                SizedBox(
                  width: 33,
                  child: Row(
                    children: [
                      SizedBox(
                        child: Text("$_temperature",
                            style: TextStyle(
                                color: _whiteColor,
                                fontWeight: FontWeight.w300)),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 9),
                        child: Icon(
                          Icons.circle_outlined,
                          size: 6,
                          color: _whiteColor,
                        ),
                      ),
                    ],
                  ),
                ),
                //显示白天or晚上
                SizedBox(
                  child: Icon(
                    IconData(
                      _dayIcon[_index],
                      fontFamily: "MyIcons",
                    ),
                    size: 19,
                    color: _whiteColor,
                  ),
                ),
                const SizedBox(width: 16),
                //显示天气
                SizedBox(
                  child: Icon(
                    IconData(
                      _weather[_data],
                      fontFamily: "MyIcons",
                    ),
                    size: 19,
                    color: _whiteColor,
                  ),
                ),
              ],
            )),
      ]),
    );
  }

  //信展示
  Widget _letterView(context) {
    return SizedBox(
      height: 656,
      width: 340,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 620,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  itemCount: _letter.length + 1,
                  itemBuilder: (context, index) {
                    if (_letter == []) {
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: const SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: CircularProgressIndicator(strokeWidth: 2.0),
                        ),
                      );
                    } else if (index == _letter.length) {
                      return Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Text(
                              "没有啦 去写一封吧~",
                              style: TextStyle(
                                  color: _blackColor,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          const SizedBox(height: 15)
                        ],
                      );
                    } else {
                      return _lettershow(index);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _lettershow(index) {
    String _date = _letter[index]["date"].substring(0, 16).replaceAll("-", ".");
    return Container(
      width: 340,
      height: 170,
      decoration:
          const BoxDecoration(color: Color.fromARGB(255, 254, 255, 248)),
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(children: [
        SizedBox(
          width: 220,
          child: Column(
            children: [
              const SizedBox(height: 10),
              //发件人姓名
              SizedBox(
                width: 200,
                child: Text("${_letter[index]["name"]}发",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: _blackColor)),
              ),
              const SizedBox(height: 25),
              //信件概要
              SizedBox(
                width: 200,
                height: 80,
                child: Text.rich(
                  TextSpan(
                      text: _letter[index]["context"],
                      style: const TextStyle(
                        fontWeight: FontWeight.w200,
                        fontSize: 14,
                        // decoration: TextDecoration.underline,
                        overflow: TextOverflow.ellipsis,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetialPage(
                                        account: widget.account,
                                        sender: _letter[index]["account"],
                                        stamp: _letter[index]["stamp"],
                                        context: _letter[index]["context"],
                                        name: _letter[index]["name"],
                                      )));
                        }),
                  maxLines: 3,
                ),
              ),
              //新信件
              if (_newLetter && index == 0)
                Row(
                  children: const [
                    SizedBox(width: 10),
                    Text("NEW!", style: TextStyle(color: Colors.red)),
                  ],
                )
            ],
          ),
        ),
        SizedBox(
          width: 120,
          child: Column(
            children: [
              SizedBox(
                height: 120,
                width: 120,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 25,
                    ),
                    Image.asset(
                      "lib/assets/stamp/${_letter[index]["stamp"]}.png",
                      fit: BoxFit.fill,
                      width: 90,
                      height: 100,
                    )
                  ],
                ),
              ),
              //写信时间
              SizedBox(
                height: 50,
                child: Row(children: [
                  const SizedBox(width: 25),
                  Text(
                    _date,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w300),
                  ),
                ]),
              )
            ],
          ),
        )
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

  void _getLetter() async {
    String _recipient = widget.account;
    var result1 = await NetRequester.request(Apis.queryOneLetter(_recipient));
    if (result1["data"] != null) {
      await NetRequester.request(
          Apis.insertRecipien(result1["data"]["letter_id"], _recipient));
      _newLetter = true;
      Get.snackbar("您收到了新的信件", "快打开看看吧~",
          backgroundColor: const Color.fromARGB(200, 255, 255, 255),
          duration: const Duration(seconds: 3));
    }
    // await NetRequester.request(Apis.writeLetter(_recipient, 3, "", "888"));
    var data = await NetRequester.request(Apis.queryLetter(_recipient));
    if (mounted) {
      setState(() {
        _letter = data["data"];
        print(_letter);
      });
    }
  }

  void _getData() async {
    String _account = widget.account;
    var result = await NetRequester.request(Apis.planet(_account));
    var data = await NetRequester.request(Apis.queryWeather(result["data"]));
    if (mounted) {
      setState(() {
        _data = data["data"]["num"];
        _temperature = data["data"]["temperature"];
        // print(data);
      });
    }
  }
}
