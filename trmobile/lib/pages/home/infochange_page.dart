import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../community/community_page.dart';
import '../../net/NetRequester.dart';
import '../../net/TtApi.dart';
import 'home_page.dart';
import 'remind_page.dart';
import 'clock_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'dart:io';
import '../music/music_page.dart';
import '../letter/letter_page.dart';
import 'game_page.dart';

class InfochangePage extends StatefulWidget {
  final account;
  const InfochangePage({
    super.key,
    required this.account,
  });

  @override
  State<InfochangePage> createState() => _InfochangePageState();
}

class _InfochangePageState extends State<InfochangePage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  bool _isObscure = true;
  bool _isreObscure = true;
  Color _eyeColor = Colors.grey;
  Color _eyereColor = Colors.grey;
  String _name = "";
  String _date = "";
  String _newname = "";
  final picker = ImagePicker();
  XFile? _imageFile;
  String _planet = '';
  String _newPlanet = "敬请期待";
  String _address = '';

  final Color _blackColor = const Color.fromARGB(255, 43, 46, 51);
  final Color _whiteColor = Colors.white;
  final Color _pinkColor = const Color.fromARGB(255, 253, 183, 200);
  var imgKey = UniqueKey();

  @override
  initState() {
    super.initState();
    _retrieveData();
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
              _changeView(context),
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
      width: 120,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(200, 255, 255, 255),
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
        color: Color.fromARGB(40, 255, 255, 255),
        border: Border.all(color: _blackColor, width: 2), // border
        borderRadius: BorderRadius.horizontal(right: Radius.circular(5)),
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
      width: 90,
      margin: EdgeInsets.only(right: 40),
      decoration: BoxDecoration(
        color: Color.fromARGB(40, 255, 255, 255),
        border: Border.all(color: _blackColor, width: 2), // border
        borderRadius: BorderRadius.horizontal(right: Radius.circular(5)),
      ),
      child: TextButton(
        child: Text(
          "每日打卡",
          style: TextStyle(
              color: _blackColor, fontWeight: FontWeight.w400, fontSize: 13),
        ),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ClockPage(
                        account: widget.account,
                      )));
        },
      ),
    );
  }

  //信息更改
  Widget _changeView(context) {
    return Container(
      height: 550,
      width: 340,
      decoration: BoxDecoration(
        color: Color.fromARGB(230, 255, 255, 255),
        borderRadius: BorderRadius.circular(27),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(100, 255, 255, 255),
            offset: Offset(3, -10),
            blurRadius: 10,
          )
        ],
      ),
      padding: const EdgeInsets.only(top: 13),
      child: Form(
        key: _formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            const SizedBox(height: 10),
            _slogin(),
            const SizedBox(height: 20),
            _showAccount(context),
            const SizedBox(height: 5),
            _nameInput(context),
            const SizedBox(height: 5),
            _showAddress(context),
            const SizedBox(height: 5),
            _planetDropdown(context),
            const SizedBox(height: 15),
            _avatarChose(context),
            const SizedBox(height: 35),
            _changeBtn(context)
          ],
        ),
      ),
    );
  }

  //Slogin
  Widget _slogin() {
    return const Text.rich(TextSpan(
        text: "更改个人信息",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)));
  }

  //显示账号
  Widget _showAccount(context) {
    return SizedBox(
        width: 350,
        height: 40,
        child: Row(
          children: [
            const SizedBox(width: 40),
            Text.rich(
              TextSpan(
                text: "账号：${widget.account}",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ));
  }

  //姓名输入框
  Widget _nameInput(context) {
    return SizedBox(
        width: 350,
        height: 40,
        child: Row(
          children: [
            const SizedBox(width: 40),
            const Text.rich(
              TextSpan(
                text: "昵称：",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(
              width: 240,
              height: 30,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: _name,
                  hintStyle: const TextStyle(
                    color: Color.fromARGB(40, 83, 83, 83),
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                  contentPadding: const EdgeInsets.only(bottom: 12),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(40, 83, 83, 83)),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(40, 83, 83, 83)),
                  ),
                ),
                //输入后字体
                style: const TextStyle(
                  color: Color.fromARGB(255, 83, 83, 83),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
                cursorColor: const Color.fromARGB(46, 135, 135, 135),
                cursorRadius: const Radius.circular(5),
                onSaved: (v) {
                  if (v != "") {
                    _name = v!;
                    _newname = v!;
                  }
                },
              ),
            )
          ],
        ));
  }

  //星球选择
  Widget _planetDropdown(context) {
    return SizedBox(
      width: 350,
      height: 40,
      child: Row(
        children: [
          const SizedBox(width: 40),
          const Text.rich(
            TextSpan(
              text: "入驻星球：",
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
          DropdownButton(
            value: _newPlanet,
            onChanged: (newValue) {
              setState(() {
                _newPlanet = newValue;
              });
            },
            items: ['焦虑星', '倦怠星', '失落星', '不开星', '痛苦星', "敬请期待"]
                .map<DropdownMenuItem>(
              (planet) {
                return DropdownMenuItem(
                  value: planet,
                  child: Text.rich(TextSpan(
                    text: planet,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  )),
                );
              },
            ).toList(),
          ),
          const Text.rich(
            TextSpan(
              text: "   更改后地址也会变化哦~",
              style: TextStyle(
                fontSize: 11,
                color: Colors.black38,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //显示地址
  Widget _showAddress(context) {
    return SizedBox(
        width: 350,
        height: 40,
        child: Row(
          children: [
            const SizedBox(width: 40),
            Text.rich(
              TextSpan(
                text: "家庭住址：$_address",
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ],
        ));
  }

  //设置头像
  Widget _avatarChose(context) {
    return Center(
      child: Row(
        children: [
          const SizedBox(
            width: 40,
          ),
          const Text(
            "头像",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w300,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          TextButton(
            onPressed: _openGallery,
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(color: Colors.black12),
              child: _imageFile == null
                  ? SizedBox(
                      //用户头像
                      height: 30,
                      width: 30,
                      child: Image.network(
                          "http://172.20.10.5/images/${widget.account}.png?$imgKey"))
                  : SizedBox(
                      height: 100,
                      width: 100,
                      child:
                          Image.file(File(_imageFile!.path), fit: BoxFit.fill),
                    ),
            ),
          )
        ],
      ),
    );
  }

  Future _openGallery() async {
    XFile? pickedFile = await picker.pickImage(
        source: ImageSource.gallery, maxHeight: 600, maxWidth: 600);

    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  //获取个人主页信息
  void _retrieveData() async {
    var result1 = await NetRequester.request(Apis.userInfo(widget.account));
    if (mounted) {
      setState(() {
        _address = result1["data"]["address"];
        _name = result1["data"]["name"];
        _planet = result1["data"]["planet"];
        _date = result1["data"]["age"];
        imgKey = UniqueKey();
      });
    }
  }

  //更改按钮
  Widget _changeBtn(context) {
    return Container(
        width: 180,
        height: 36,
        decoration: BoxDecoration(
          color: Color.fromARGB(40, 255, 255, 255),
          border: Border.all(color: _blackColor, width: 2), // border
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
            onPressed: () async {
              (_formKey.currentState as FormState).save();
              if (_newPlanet == "敬请期待" &&
                  _imageFile == null &&
                  _newname == "") {
                showDialog(
                    context: this.context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          "更新提醒",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        content: const Text(
                          "请您至少更新一样信息",
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
                    });
              } else {
                var Reg = RegExp(r"[0-9A-Za-z]{6,11}");
                var result;
                if (_newPlanet != "敬请期待") {
                  _planet = _newPlanet;
                }
                if (_imageFile != null) {
                  FormData formData = FormData.fromMap({
                    "account": widget.account,
                    "name": _name,
                    "date": _date,
                    "planet": _planet,
                    "file": await MultipartFile.fromFile(_imageFile!.path,
                        filename: "${widget.account}.png")
                  });
                  var dio = Dio();
                  result = await dio.post(
                      "http://172.20.10.5:80/user/updateUser",
                      data: formData);
                  if (result.data['message'] == "true") {
                    Get.snackbar("更新成功", "$_name",
                        backgroundColor: Color.fromARGB(200, 255, 255, 255),
                        duration: const Duration(seconds: 4));
                    _retrieveData();
                  }
                } else {
                  result = await NetRequester.request(
                      Apis.updateUsers(widget.account, _date, _name, _planet));
                  if (result['message'] == "true") {
                    Get.snackbar("更新成功", "$_name",
                        backgroundColor: Color.fromARGB(200, 255, 255, 255),
                        duration: const Duration(seconds: 4));
                    _retrieveData();
                  }
                }
              }
            },
            child: Container(
              child: Text("确认修改",
                  style: TextStyle(color: _blackColor, fontSize: 13)),
            )));
  }
}
