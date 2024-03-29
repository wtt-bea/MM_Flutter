import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:trmobile/pages/community/community_page.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:dio/dio.dart';

class RegistPage extends StatefulWidget {
  const RegistPage({super.key});

  @override
  State<RegistPage> createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();

  bool _isObscure = true;
  bool _isreObscure = true;

  Color _eyeColor = Colors.grey;
  Color _eyereColor = Colors.grey;
  late String _account, _pwd, _pwdre, _name;

  final picker = ImagePicker();
  XFile? _imageFile;

  List imageList = [
    'lib/assets/images/info.png',
    'lib/assets/images/info.png',
    'lib/assets/images/info.png'
  ];

  String _planet = '焦虑星';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //文字输入后缩放
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("lib/assets/images/loginbg.png"),
          ),
        ),
        child: Column(
          children: [
            Container(
              width: 380,
              height: 600,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.elliptical(40, 40)),
              ),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    _slogin(),
                    const SizedBox(height: 20),
                    _accountInput(),
                    const SizedBox(height: 10),
                    _pwdInput(context),
                    const SizedBox(height: 10),
                    _pwdreInput(context),
                    const SizedBox(height: 10),
                    _nameInput(context),
                    const SizedBox(height: 10),
                    _planetDropdown(context),
                    const SizedBox(height: 20),
                    _avatarChose(context),
                    const SizedBox(height: 50),
                    _loginBtn(context),
                  ],
                ),
              ),
            ),
            // SizedBox(
            //   width: 300,
            //   height: 300,
            //   child: _slideShow(),
            // ),
          ],
        ),
      ),
    );
  }

  //滑动图片
  Widget _slideShow() {
    return SizedBox(
      width: double.infinity,
      child: AspectRatio(
        // 配置宽高比
        aspectRatio: 1 / 1,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            // 配置图片地址
            return Image.asset(
              imageList[index],
              fit: BoxFit.fill,
            );
          },
          // 配置图片数量
          itemCount: imageList.length,
          // 底部分页器
          pagination: const SwiperPagination(
            builder: DotSwiperPaginationBuilder(
              activeColor: Color.fromARGB(255, 237, 173, 204),
              size: 6.0,
              activeSize: 6.0,
            ),
          ),
          // 无限循环
          loop: true,
          // 自动轮播
          // autoplay: true,
        ),
      ),
    );
  }

  //Slogin
  Widget _slogin() {
    return const Text.rich(TextSpan(
        text: "Welcom to MM universe",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)));
  }

  //账号输入框
  Widget _accountInput() {
    return SizedBox(
        width: 350,
        height: 40,
        child: Row(
          children: [
            const SizedBox(width: 40),
            const Text.rich(
              TextSpan(
                text: "账号：",
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
                decoration: const InputDecoration(
                  hintText: "六到十一位字母数字",
                  hintStyle: TextStyle(
                    color: Color.fromARGB(40, 83, 83, 83),
                    fontSize: 14,
                    fontWeight: FontWeight.w300,
                  ),
                  contentPadding: EdgeInsets.only(bottom: 12),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(40, 83, 83, 83)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(40, 83, 83, 83)),
                  ),
                ),
                style: const TextStyle(
                  color: Color.fromARGB(255, 83, 83, 83),
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                ),
                cursorColor: const Color.fromARGB(46, 135, 135, 135),
                cursorRadius: const Radius.circular(5),
                onSaved: (v) => _account = v!,
              ),
            )
          ],
        ));
  }

  //密码输入框
  Widget _pwdInput(context) {
    return SizedBox(
        width: 350,
        height: 40,
        child: Row(
          children: [
            const SizedBox(width: 40),
            const Text.rich(
              TextSpan(
                text: "密码：",
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
                obscureText: _isObscure,
                decoration: InputDecoration(
                  hintText: "六到十一位字母数字",
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
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: _eyeColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscure = !_isObscure;
                        _eyeColor = (_isObscure
                            ? Colors.grey
                            : Theme.of(context).iconTheme.color)!;
                      });
                    },
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
                onSaved: (v) => _pwd = v!,
              ),
            )
          ],
        ));
  }

  //确认密码
  Widget _pwdreInput(context) {
    return SizedBox(
        width: 350,
        height: 40,
        child: Row(
          children: [
            const SizedBox(width: 40),
            const Text.rich(
              TextSpan(
                text: "确认密码：",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            SizedBox(
              width: 213,
              height: 30,
              child: TextFormField(
                obscureText: _isreObscure,
                decoration: InputDecoration(
                  hintText: "六到十一位字母数字",
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
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: _eyereColor,
                    ),
                    onPressed: () {
                      setState(() {
                        _isreObscure = !_isreObscure;
                        _eyereColor = (_isreObscure
                            ? Colors.grey
                            : Theme.of(context).iconTheme.color)!;
                      });
                    },
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
                onSaved: (v) => _pwdre = v!,
              ),
            )
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
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(40, 83, 83, 83)),
                  ),
                  enabledBorder: UnderlineInputBorder(
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
                onSaved: (v) => _name = v!,
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
            value: _planet,
            onChanged: (newValue) {
              setState(() {
                _planet = newValue;
              });
            },
            items: ['焦虑星', '倦怠星', '失落星', '不开星', '痛苦星'].map<DropdownMenuItem>(
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
        ],
      ),
    );
  }

  //登录按钮
  Widget _loginBtn(context) {
    return SizedBox(
        width: 250,
        height: 45,
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              backgroundColor: Colors.black,
            ),
            onPressed: () async {
              (_formKey.currentState as FormState).save();
              var Reg = RegExp(r"[0-9A-Za-z]{6,11}");
              // ignore: todo
              //TODO 执行注册方法
              // 如果输入的密码和确认的密码不想当，则弹出弹出框提示用户
              if (_pwd != _pwdre) {
                showDialog(
                    context: this.context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          "注册提醒",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        content: const Text(
                          "两次密码输入不一致，请仔细检查!",
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
              } else if (!Reg.hasMatch(_account)) {
                showDialog(
                    context: this.context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          "注册提醒",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        content: const Text(
                          "请按格式输入账号",
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
              } else if (!Reg.hasMatch(_pwd)) {
                showDialog(
                    context: this.context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          "注册提醒",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        content: const Text(
                          "请按格式输入密码",
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
              } else if (_imageFile == null) {
                showDialog(
                    context: this.context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text(
                          "注册提醒",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w400),
                        ),
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        content: const Text(
                          "请选择头像",
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
                FormData formData = FormData.fromMap({
                  "account": _account,
                  "password": _pwd,
                  "name": _name,
                  "planet": _planet,
                  "file": await MultipartFile.fromFile(_imageFile!.path,
                      filename: "$_account.png")
                });
                var dio = Dio();
                var result = await dio.post(
                    "http://172.20.10.5:80/user/register",
                    data: formData);
                if (result.data['message'] == "true") {
                  Get.snackbar("成功登陆", "欢迎回家$_name",
                      backgroundColor: Color.fromARGB(200, 255, 255, 255),
                      duration: const Duration(seconds: 3));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CommunityPage(
                                account: _account,
                              )));
                } else {
                  showDialog(
                      context: this.context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            "注册提醒",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w400),
                          ),
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          content: const Text(
                            "该账号已被注册",
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
                }
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: const [
                  SizedBox(width: 65),
                  Text("I'm ready", style: TextStyle(color: Colors.white)),
                  Icon(Icons.chevron_right, color: Colors.white)
                ],
              ),
            )));
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
            "设置头像",
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
                  ? Container(
                      margin: const EdgeInsets.all(20),
                      child: Column(children: const [
                        Icon(
                          Icons.add,
                          color: Colors.black26,
                          size: 40,
                        ),
                        Text(
                          "点击选择",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black38,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ]),
                    )
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
}
