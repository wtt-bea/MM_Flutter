import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../letter/letter_page.dart';

import '../../net/NetRequester.dart';
import '../../net/TtApi.dart';

class StampPage extends StatefulWidget {
  final account;
  final recipient;
  final context;
  const StampPage({
    super.key,
    required this.account,
    required this.recipient,
    required this.context,
  });

  @override
  State<StampPage> createState() => _StampPageState();
}

class _StampPageState extends State<StampPage> {
  final Color _blackColor = const Color.fromARGB(255, 43, 46, 51);
  final Color _whiteColor = Colors.white;
  final Color _pinkColor = const Color.fromARGB(255, 253, 183, 200);
  final List _stamp = [
    "A",
    "B",
    "C",
    "D",
    "E",
    "F",
    "G",
    "H",
  ];
  final List _cost = [500, 1000, 2000, 3000, 4000, 5000, 6000, 7000];
  var _flag;
  var point;
  @override
  initState() {
    super.initState();
    _getData();
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
            Row(
              children: [
                _topBackBar(),
              ],
            ),
            _showStamp(),
            _writeBtn()
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

  Widget _showStamp() {
    return SizedBox(
      height: 650,
      width: 318,
      child: GridView.builder(
          itemCount: _stamp.length,
          padding: EdgeInsets.zero,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 1.0),
          itemBuilder: (BuildContext context, int index) {
            return Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/assets/stamp/${_stamp[index]}.png"),
                  opacity: _flag == index ? 0.6 : 1.0,
                ),
              ),
              child: TextButton(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        const SizedBox(width: 100),
                        Text(
                          "${_cost[index]}",
                          style: const TextStyle(
                              color: Color.fromARGB(255, 80, 76, 76)),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    if (_flag == index)
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(left: 50),
                            child: const Icon(
                              Icons.check_rounded,
                              size: 40,
                              color: Color.fromARGB(255, 80, 76, 76),
                            ),
                          ),
                        ],
                      )
                  ],
                ),
                onPressed: () {
                  if (mounted) {
                    setState(() {
                      _flag = index;
                    });
                  }
                },
              ),
            );
          }),
    );
  }

  Widget _writeBtn() {
    return Row(
      children: [
        const SizedBox(width: 25),
        SizedBox(
          width: 120,
          child: Text("可用积分：$point"),
        ),
        const SizedBox(width: 145),
        SizedBox(
          height: 40,
          width: 70,
          child: TextButton(
              onPressed: () async {
                if (point < _cost[_flag]) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        title: const Text(
                          "您的积分不足",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        content: const Text(
                          "可通过每日打卡、签到获取",
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
                } else {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        title: const Text(
                          "请确认",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        content: Text(
                          "要花费${_cost[_flag]}积分",
                          style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black,
                              fontWeight: FontWeight.w300),
                        ),
                        actions: <Widget>[
                          OutlinedButton(
                            onPressed: () async {
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
                              "取 消",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () async {
                              await NetRequester.request(Apis.writeLetter(
                                      widget.account,
                                      _stamp[_flag],
                                      widget.recipient,
                                      widget.context))
                                  .then((value) async => {
                                        if (value["message"] == "true")
                                          {
                                            await NetRequester.request(
                                                Apis.subPoint(
                                              widget.account,
                                              _cost[_flag],
                                            )),
                                            Get.snackbar("投递成功", "希望你的信能温暖到别人",
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        200, 255, 255, 255),
                                                duration:
                                                    const Duration(seconds: 3)),
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    LetterPage(
                                                  account: widget.account,
                                                ),
                                              ),
                                            )
                                          }
                                      });
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
              child: Row(
                children: [
                  Text(
                    "发送",
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
    );
  }

  void _getData() async {
    var result = await NetRequester.request(Apis.getPoint(widget.account));
    if (mounted) {
      setState(() {
        point = result["data"];
      });
    }
  }
}
