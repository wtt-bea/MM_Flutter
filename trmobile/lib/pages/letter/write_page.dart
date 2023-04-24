import 'package:flutter/material.dart';
import '../../net/TtApi.dart';
import '../../net/NetRequester.dart';
import '../home/home_page.dart';
import '../music/music_page.dart';
import '../community/community_page.dart';
import '../letter/letter_page.dart';
import '../letter/stamp_page.dart';

class WritePage extends StatefulWidget {
  final account;
  final recipient;
  final name;
  const WritePage(
      {super.key,
      required this.account,
      required this.recipient,
      required this.name});

  @override
  State<WritePage> createState() => _WritePageState();
}

class _WritePageState extends State<WritePage> {
  final Color _blackColor = const Color.fromARGB(255, 43, 46, 51);
  final Color _whiteColor = Colors.white;
  final Color _pinkColor = const Color.fromARGB(255, 253, 183, 200);
  final _weeklist = [" ", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六", "星期日"];
  final List _dayIcon = [59137, 60517, 60539, 60533, 60530];
  final List _weather = [60518, 60520, 60521, 60523, 60528, 58896];
  int _data = 0;
  int _temperature = 0;
  final TextEditingController _postText = TextEditingController();

  @override
  initState() {
    super.initState();
    _getData();
  }

  @override
  void dispose() {
    _postText.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //文字输入后缩放
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
            const SizedBox(height: 20),
            _write(),
            _bottomNav(context),
          ],
        ),
      ),
    );
  }

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

  Widget _write() {
    return Container(
      height: 636,
      width: 330,
      decoration: BoxDecoration(
          color: _whiteColor,
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      child: Column(
        children: [
          const SizedBox(height: 25),
          SizedBox(
            child: Row(
              children: [
                const SizedBox(width: 15),
                Text("To ${widget.recipient == "" ? "有缘人" : widget.name}"),
              ],
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            height: 530,
            width: 320,
            //信输入框
            child: TextField(
              controller: _postText,
              keyboardType: TextInputType.multiline,
              maxLines: 35,
              // minLines: 1,
              decoration: const InputDecoration(
                hintText: '写一封温柔的信吧....',
                hintStyle: TextStyle(fontSize: 14, color: Colors.black26),
                filled: true,
                fillColor: Colors.transparent,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                isDense: true,
                border: InputBorder.none,
              ),
              style: const TextStyle(
                  color: Color.fromARGB(255, 67, 67, 67),
                  fontSize: 14,
                  fontWeight: FontWeight.w300),
            ),
          ),
          Row(
            children: [
              const SizedBox(width: 235),
              SizedBox(
                height: 40,
                width: 90,
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => StampPage(
                                    account: widget.account,
                                    recipient: widget.recipient,
                                    context: _postText.text,
                                  )));
                    },
                    child: Row(
                      children: [
                        Text(
                          "选择邮票",
                          style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: _blackColor),
                        ),
                        Icon(
                          Icons.arrow_forward,
                          size: 18,
                          color: _blackColor,
                        )
                      ],
                    )),
              )
            ],
          ),
        ],
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

  void _getData() async {
    String _account = widget.account;
    var result = await NetRequester.request(Apis.planet(_account));
    var data = await NetRequester.request(Apis.queryWeather(result["data"]));
    if (mounted) {
      setState(() {
        _data = data["data"]["num"];
        _temperature = data["data"]["temperature"];
      });
    }
  }
}
