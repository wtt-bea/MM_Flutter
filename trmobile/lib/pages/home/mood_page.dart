import 'package:get/get.dart';

import '../../net/NetRequester.dart';
import '../../net/TtApi.dart';
import 'home_page.dart';
import 'package:flutter/material.dart';

class MoodPage extends StatefulWidget {
  final account;
  const MoodPage({super.key, required this.account});

  @override
  State<MoodPage> createState() => _MoodPageState();
}

class _MoodPageState extends State<MoodPage> {
  final Color _blackColor = const Color.fromARGB(255, 43, 46, 51);
  final Color _whiteColor = Colors.white;
  final Color _pinkColor = const Color.fromARGB(255, 253, 183, 200);
  int _mood = 0;
  int __mood = 0;
  bool _one = false;
  bool _two = false;
  bool _three = false;
  bool _four = false;
  bool _five = false;
  bool _six = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
          const SizedBox(height: 30),
          Row(children: [_topBackBar()]),
          const SizedBox(height: 30),
          _moodBox(),
          const SizedBox(height: 30),
          _textBox(),
          const SizedBox(height: 30),
          _subBox(),
        ]),
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
            onPressed: () async {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(
                    account: widget.account,
                  ),
                ),
              );
            },
            icon: Icon(const IconData(0xe8ef, fontFamily: "MyIcons"),
                size: 25, color: _blackColor),
          )
        ],
      ),
    );
  }

  Widget _moodBox() {
    return Container(
      width: 300,
      height: 200,
      decoration: const BoxDecoration(
          color: Color.fromARGB(14, 0, 0, 0),
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          const SizedBox(height: 15),
          Row(
            children: [
              const SizedBox(width: 15),
              Container(
                decoration: BoxDecoration(
                    color: _one ? Colors.black12 : null,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 80,
                width: 80,
                child: TextButton(
                  onPressed: () {
                    if (mounted) {
                      setState(() {
                        _one = true;
                        _two = false;
                        _three = false;
                        _four = false;
                        _five = false;
                        _six = false;
                        _mood = 1;
                      });
                    }
                  },
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Icon(
                        const IconData(
                          0xea7f,
                          fontFamily: "MoodIcons",
                        ),
                        color: _one ? _whiteColor : _blackColor,
                        size: 35,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "开心",
                        style: TextStyle(
                          fontSize: 13,
                          color: _one ? _whiteColor : _blackColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: _two ? Colors.black12 : null,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 80,
                width: 80,
                child: TextButton(
                  onPressed: () {
                    if (mounted) {
                      setState(() {
                        _one = false;
                        _two = true;
                        _three = false;
                        _four = false;
                        _five = false;
                        _six = false;
                        _mood = 2;
                      });
                    }
                  },
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Icon(
                        const IconData(
                          0xea83,
                          fontFamily: "MoodIcons",
                        ),
                        color: _two ? _whiteColor : _blackColor,
                        size: 35,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "难受",
                        style: TextStyle(
                          fontSize: 13,
                          color: _two ? _whiteColor : _blackColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: _three ? Colors.black12 : null,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 80,
                width: 80,
                child: TextButton(
                  onPressed: () {
                    if (mounted) {
                      setState(() {
                        _one = false;
                        _two = false;
                        _three = true;
                        _four = false;
                        _five = false;
                        _six = false;
                        _mood = 3;
                      });
                    }
                  },
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Icon(
                        const IconData(
                          0xea82,
                          fontFamily: "MoodIcons",
                        ),
                        color: _three ? _whiteColor : _blackColor,
                        size: 35,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "伤心",
                        style: TextStyle(
                          fontSize: 13,
                          color: _three ? _whiteColor : _blackColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 15),
              Container(
                decoration: BoxDecoration(
                    color: _four ? Colors.black12 : null,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 80,
                width: 80,
                child: TextButton(
                  onPressed: () {
                    if (mounted) {
                      setState(() {
                        _one = false;
                        _two = false;
                        _three = false;
                        _four = true;
                        _five = false;
                        _six = false;
                        _mood = 4;
                      });
                    }
                  },
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Icon(
                        const IconData(
                          0xea81,
                          fontFamily: "MoodIcons",
                        ),
                        color: _four ? _whiteColor : _blackColor,
                        size: 35,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "期待",
                        style: TextStyle(
                          fontSize: 13,
                          color: _four ? _whiteColor : _blackColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: _five ? Colors.black12 : null,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 80,
                width: 80,
                child: TextButton(
                  onPressed: () {
                    if (mounted) {
                      setState(() {
                        _one = false;
                        _two = false;
                        _three = false;
                        _four = false;
                        _five = true;
                        _six = false;
                        _mood = 5;
                      });
                    }
                  },
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Icon(
                        const IconData(
                          0xea80,
                          fontFamily: "MoodIcons",
                        ),
                        color: _five ? _whiteColor : _blackColor,
                        size: 35,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "平淡",
                        style: TextStyle(
                          fontSize: 13,
                          color: _five ? _whiteColor : _blackColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              Container(
                decoration: BoxDecoration(
                    color: _six ? Colors.black12 : null,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                height: 80,
                width: 80,
                child: TextButton(
                  onPressed: () {
                    if (mounted) {
                      setState(() {
                        _one = false;
                        _two = false;
                        _three = false;
                        _four = false;
                        _five = false;
                        _six = true;
                        _mood = 6;
                      });
                    }
                  },
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Icon(
                        const IconData(
                          0xea7e,
                          fontFamily: "MoodIcons",
                        ),
                        color: _six ? _whiteColor : _blackColor,
                        size: 35,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        "生气",
                        style: TextStyle(
                          fontSize: 13,
                          color: _six ? _whiteColor : _blackColor,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _subBox() {
    return SizedBox(
      width: 100,
      height: 40,
      child: OutlinedButton(
        onPressed: () async {
          if (_mood != 0) {
            var result =
                await NetRequester.request(Apis.addMood(widget.account, _mood));
            if (result["message"] == "true") {
              Get.snackbar("今日心情已更新", "今日可见",
                  backgroundColor: const Color.fromARGB(200, 255, 255, 255),
                  duration: const Duration(seconds: 3));
            }
            if (mounted) {
              setState(() {
                __mood = _mood;
              });
            }
          } else {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text(
                    "提醒",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400),
                  ),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  content: const Text(
                    "请您选择心情",
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
                        side: const BorderSide(width: 1.0, color: Colors.black),
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
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 1.0, color: _blackColor),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          "确认心情",
          style: TextStyle(
              fontSize: 15, color: _blackColor, fontWeight: FontWeight.w300),
        ),
      ),
    );
  }

  Widget _textBox() {
    return Container(
      width: 300,
      height: 300,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 254, 240),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(50, 80, 80, 80),
            offset: Offset(5.0, 6.0),
            blurRadius: 8,
            spreadRadius: 5,
          )
        ],
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 80,
          ),
          if (__mood == 0)
            const Text(
              '''
____
会有新的花儿，
新的绿叶，
会有其他温柔的日子
''',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
          if (__mood == 1)
            const Text(
              '''
____
当你记录生活的美好，
它本身就很美好
''',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
          if (__mood == 2)
            const Text(
              '''
____
也许糖沉在了杯底,
摇一摇试试看
''',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
          if (__mood == 3)
            const Text(
              '''
____
风停在窗边，
嘱咐你要热爱这个世界
''',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
          if (__mood == 4)
            const Text(
              '''
  ____
  宇宙山河浪漫，
  生活点滴温暖，
  都值得我们前进
''',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
          if (__mood == 5)
            const Text(
              '''
  ____
  日落是免费的
  春夏秋冬也是
  希望你快乐
''',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
          if (__mood == 6)
            const Text(
              '''
____
爱自己的明媚，
也爱自己的破碎
''',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),
            ),
        ],
      ),
    );
  }
}
