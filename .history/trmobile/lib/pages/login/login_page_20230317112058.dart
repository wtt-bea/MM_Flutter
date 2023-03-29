import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/gestures.dart';
import 'privacypolicy_page.dart';
import 'useragreement_page.dart';
import 'regist_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _idController = TextEditingController();
  final _pwdController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();
  late String _id, _pwd;
  bool _isObscure = true;
  Color _eyeColor = Colors.white;
  List imageList = [
    'lib/assets/images/info.png',
    'lib/assets/images/info.png',
    'lib/assets/images/info.png'
  ];

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _idController.dispose();
    _pwdController.dispose();
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
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              const SizedBox(
                height: 35,
              ),
              slideShow(),
              const SizedBox(
                height: 20,
              ),
              idInput(context),
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
                content: Text(_pwdController.text),
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

  Widget idInput(context) {
    return SizedBox(
      width: 280,
      height: 40,
      child: TextFormField(
        controller: _idController,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp('[0-9]')), //只允许输入数
          LengthLimitingTextInputFormatter(7),
        ],
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
        onFieldSubmitted: (val) {
          _id = val;
          // ignore: avoid_print
          print("点击了键盘上的动作按钮，当前输入框的值为：$_id");
        },
      ),
    );
  }

  Widget pwdInput(context) {
    return SizedBox(
      width: 280,
      height: 40,
      child: TextFormField(
        obscureText: _isObscure,
        controller: _pwdController,
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
        onFieldSubmitted: (val) {
          _pwd = val;
          // ignore: avoid_print
          print("点击了键盘上的动作按钮，当前输入框的值为：$_pwd");
        },
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
        onPressed: null,
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
