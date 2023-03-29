import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/gestures.dart';

class RegistPage extends StatefulWidget {
  const RegistPage({super.key});

  @override
  State<RegistPage> createState() => _RegistPageState();
}

class _RegistPageState extends State<RegistPage> {
  final _accountController = TextEditingController(); //账号
  final _pwdController = TextEditingController(); //密码
  final _pwdreController = TextEditingController(); //确认密码
  final _nameController = TextEditingController(); //昵称
  final _genderController = TextEditingController(); //性别
  final _planetController = TextEditingController(); //星球
  final GlobalKey _formKey = GlobalKey<FormState>();

  bool _isObscure = true;
  bool _isreObscure = true;

  Color _eyeColor = Colors.grey;
  Color _eyereColor = Colors.grey;
  late String _pwd, _pwdre, _name, _gender, _planet, _account;

  List imageList = [
    'lib/assets/images/info.png',
    'lib/assets/images/info.png',
    'lib/assets/images/info.png'
  ];

  String dropdownValue = '焦虑星';
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _accountController.dispose();
    _pwdController.dispose();
    _pwdreController.dispose();
    _nameController.dispose();
    _genderController.dispose();
    _planetController.dispose();
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
          image: DecorationImage(
            image: AssetImage("lib/assets/images/loginbg.png"),
          ),
        ),
        child: Column(
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: slideShow(),
            ),
            const SizedBox(
              width: 10,
              height: 20,
            ),
            Container(
                width: 380,
                height: 450,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.vertical(top: Radius.elliptical(40, 40)),
                ),
                child: Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                    children: [
                      const SizedBox(height: 30),
                      slogin(),
                      const SizedBox(height: 20),
                      accountInput(),
                      const SizedBox(height: 10),
                      pwdInput(context),
                      const SizedBox(height: 10),
                      pwdreInput(context),
                      const SizedBox(height: 10),
                      nameInput(context),
                      const SizedBox(height: 10),
                      planetDropdown(context),
                      const SizedBox(height: 10),
                      loginBtn(context),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  Widget slideShow() {
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

  Widget slogin() {
    return const Text.rich(TextSpan(
        text: "Welcom to MM Universe!",
        style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)));
  }

  Widget accountInput() {
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
                controller: _accountController,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(90, 83, 83, 83)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(90, 83, 83, 83)),
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
                onFieldSubmitted: (val) {
                  _account = val;
                  // ignore: avoid_print
                  print("点击了键盘上的动作按钮，当前输入框的值为：$_account");
                },
              ),
            )
          ],
        ));
  }

  Widget pwdInput(context) {
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
                controller: _pwdController,
                decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(90, 83, 83, 83)),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(90, 83, 83, 83)),
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
                onFieldSubmitted: (val) {
                  _pwd = val;
                  // ignore: avoid_print
                  print("点击了键盘上的动作按钮，当前输入框的值为：$_pwd");
                },
              ),
            )
          ],
        ));
  }

  Widget pwdreInput(context) {
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
                controller: _pwdreController,
                decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(90, 83, 83, 83)),
                  ),
                  enabledBorder: const UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(90, 83, 83, 83)),
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
                onFieldSubmitted: (val) {
                  _pwdre = val;
                  // ignore: avoid_print
                  print("点击了键盘上的动作按钮，当前输入框的值为：$_pwd");
                },
              ),
            )
          ],
        ));
  }

  Widget nameInput(context) {
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
                controller: _nameController,
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(90, 83, 83, 83)),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(90, 83, 83, 83)),
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
                onFieldSubmitted: (val) {
                  _name = val;
                  // ignore: avoid_print
                  print("点击了键盘上的动作按钮，当前输入框的值为：$_name");
                },
              ),
            )
          ],
        ));
  }

  Widget planetDropdown(context) {
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
            value: dropdownValue,
            onChanged: (newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: ['焦虑星', '倦怠星', '失落星', '不开心', '痛苦星'].map<DropdownMenuItem>(
              (value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text.rich(TextSpan(
                    text: value,
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

  Widget loginBtn(context) {
    return SizedBox(
      width: 280,
      height: 40,
      child: TextButton.icon(
        icon: const Icon(Icons.chevron_right),
        label: Text("I'm ready"),
        onPressed: () {},
      ),
    );
  }
}
