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
  var _flag;
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
            const SizedBox(height: 25),
            Row(
              children: [
                _topBackBar(),
              ],
            ),
            _showStamp(),
            _weitrBtn()
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
                child: Row(children: [
                  if (_flag == index)
                    Container(
                      margin: const EdgeInsets.only(left: 50),
                      child: const Icon(
                        Icons.check_rounded,
                        size: 40,
                        color: Color.fromARGB(255, 80, 76, 76),
                      ),
                    ),
                ]),
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

  Widget _weitrBtn() {
    return Row(
      children: [
        const SizedBox(width: 285),
        SizedBox(
          height: 40,
          width: 70,
          child: TextButton(
              onPressed: () async {
                var result = await NetRequester.request(Apis.writeLetter(
                        widget.account,
                        _stamp[_flag],
                        widget.recipient,
                        widget.context))
                    .then((value) => {
                          if (value["message"] == "true")
                            {
                              Get.snackbar("投递成功", "希望你的信能温暖到别人",
                                  backgroundColor:
                                      const Color.fromARGB(200, 255, 255, 255),
                                  duration: const Duration(seconds: 3)),
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LetterPage(
                                    account: widget.account,
                                  ),
                                ),
                              )
                            }
                        });
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
}
