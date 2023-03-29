import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/gestures.dart';
import 'privacypolicy_page.dart';
import 'useragreement_page.dart';
import 'regist_page.dart';
import '../../model/CommonResult.dart';
import '../../controller/MMApi.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  late String _account = "";
  late String _pwd = "";

  final MMApi api = MMApi();

  bool _isObscure = true;
  Color _eyeColor = Colors.grey;
  List imageList = [
    'lib/assets/images/info.png',
    'lib/assets/images/info.png',
    'lib/assets/images/info.png'
  ];

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
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              slideShow(),
              const SizedBox(
                height: 10,
              ),
              accountInput(context),
              const SizedBox(
                height: 10,
              ),
              pwdInput(context),
              const SizedBox(
                height: 40,
              ),
              agreeBox(context),
              const SizedBox(
                height: 10,
              ),
              loginBtn(context),
              const SizedBox(
                height: 50,
              ),
              regist(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text(_pwd),
              );
            },
          );
        },
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

  Widget accountInput(context) {
    return SizedBox(
      width: 280,
      height: 40,
      child: TextFormField(
        decoration: const InputDecoration(
          hintText: '请输入账号',
          hintStyle: TextStyle(
              color: Color.fromARGB(150, 204, 204, 204),
              fontSize: 11,
              fontWeight: FontWeight.w300),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(150, 204, 204, 204)),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(150, 204, 204, 204)),
          ),
        ),
        //输入后字体
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        keyboardType: TextInputType.phone,
        cursorColor: Colors.white,
        cursorRadius: const Radius.circular(5),
        onSaved: (v) => _account = v!,
      ),
    );
  }

  Widget pwdInput(context) {
    return SizedBox(
      width: 280,
      height: 40,
      child: TextFormField(
        obscureText: _isObscure,
        // controller: _pwdController,
        decoration: InputDecoration(
          hintText: '请输入密码',
          hintStyle: const TextStyle(
              color: Color.fromARGB(150, 204, 204, 204),
              fontSize: 11,
              fontWeight: FontWeight.w300),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(150, 204, 204, 204)),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromARGB(150, 204, 204, 204)),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.remove_red_eye,
              color: _eyeColor,
            ),
            onPressed: () {
              setState(() {
                _isObscure = !_isObscure;
                _eyeColor = (_isObscure ? Colors.grey : Colors.white);
              });
            },
          ),
        ),
        //输入后字体
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
        cursorColor: Colors.white,
        cursorRadius: const Radius.circular(5),
        onSaved: (v) => _pwd = v!,
      ),
    );
  }

  Widget regist() {
    return Text.rich(
      TextSpan(
          text: '没有账号?',
          style: const TextStyle(
              fontSize: 11,
              color: Color.fromARGB(200, 255, 255, 255),
              fontWeight: FontWeight.w300),
          children: [
            TextSpan(
              text: '点击注册',
              style: const TextStyle(color: Color.fromARGB(255, 237, 173, 204)),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const RegistPage()));
                },
            )
          ]),
    );
  }

  Widget agreeBox(context) {
    // return const Center();
    return Text.rich(
      TextSpan(
          text: '登录即代表同意并阅读',
          style: const TextStyle(
              fontSize: 11,
              color: Color.fromARGB(200, 255, 255, 255),
              fontWeight: FontWeight.w300),
          children: [
            TextSpan(
              text: '《用户协议》',
              style: const TextStyle(color: Color.fromARGB(255, 237, 173, 204)),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserAgreementPage()));
                },
            ),
            const TextSpan(text: '和'),
            TextSpan(
              text: '《隐私政策》',
              style: const TextStyle(color: Color.fromARGB(255, 237, 173, 204)),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PrivacyPolicyPage()));
                },
            ),
          ]),
    );
  }

  Widget loginBtn(context) {
    return SizedBox(
      width: 280,
      height: 40,
      child: OutlinedButton(
        onPressed: () async {
          (_formKey.currentState as FormState).save();
          CommonResult result = await api.queryUser(_account, _pwd);
          if (result.message == "true") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const RegistPage()));
          } else {
            showDialog(
                context: this.context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text(
                      "登录提醒",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          fontWeight: FontWeight.w400),
                    ),
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    content: const Text(
                      "账号或密码错误，请仔细检查!",
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
                          side:
                              const BorderSide(width: 1.0, color: Colors.black),
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
        },
        style: OutlinedButton.styleFrom(
          side: const BorderSide(width: 1.0, color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          "立即登陆漫宇宙",
          style: TextStyle(
              fontSize: 15, color: Colors.white, fontWeight: FontWeight.w200),
        ),
      ),
    );
  }
}
