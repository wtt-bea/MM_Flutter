import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter/gestures.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _telController = new TextEditingController();
  final _vercodeController = new TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();
  late String _tel, _vercode;
  List imageList = [
    'lib/assets/images/info.png',
    'lib/assets/images/info.png',
    'lib/assets/images/info.png'
  ];

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _telController.dispose();
    _vercodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              telInput(context),
              const SizedBox(
                height: 10,
              ),
              verCodeInput(context),
              agreeBox(context),
              loginBtn(context),
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
                content: Text(_vercodeController.text),
              );
            },
          );
        },
      ),
    );
  }

  Widget slideShow() {
    return Container(
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

  Widget telInput(context) {
    return SizedBox(
      width: 280,
      height: 40,
      child: TextFormField(
        controller: _telController,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp('[0-9]')), //只允许输入数
          LengthLimitingTextInputFormatter(11),
        ],
        decoration: const InputDecoration(
          hintText: '请输入电话号码',
          hintStyle: TextStyle(
            color: Color.fromARGB(150, 204, 204, 204),
            fontSize: 11,
          ),
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
          // ignore: avoid_print
          print("点击了键盘上的动作按钮，当前输入框的值为：$val");
        },
        // validator: (v) {
        //   var emailReg = RegExp(r"^[1]+[3,5,7,8]+\d{9}$");
        //   if (!emailReg.hasMatch(v!)) {
        //     return '请输入正确的电话号码';
        //   }
        // },
      ),
    );
  }

  Widget verCodeInput(context) {
    return Column(
      children: [
        SizedBox(
          width: 280,
          height: 40,
          child: Row(
            children: [
              SizedBox(
                width: 200,
                child: TextFormField(
                  controller: _vercodeController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp('[0-9]')), //只允许输入数
                    LengthLimitingTextInputFormatter(11),
                  ],
                  decoration: const InputDecoration(
                    hintText: '请输入验证码',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(150, 204, 204, 204),
                      fontSize: 11,
                    ),
                    border: InputBorder.none,
                  ),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  keyboardType: TextInputType.phone,
                  cursorColor: Colors.white,
                  cursorRadius: const Radius.circular(5),
                  onFieldSubmitted: (val) {
                    print("点击了键盘上的动作按钮，当前输入框的值为：${val}");
                  },
                ),
              ),
              SizedBox(
                width: 80,
                child: TextButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(
                        fontSize: 11,
                      ),
                    ),
                    foregroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 237, 173, 204),
                    ),
                  ),
                  child: const Text("获取验证码"),
                ),
              ),
            ],
          ),
        ),
        Container(
          color: const Color.fromARGB(150, 204, 204, 204),
          width: 280,
          height: 1,
        ),
      ],
    );
  }

  Widget agreeBox(context) {
    // return const Center();
    return Text.rich(
    TextSpan(
        text: '登录即代表同意并阅读',
        style: TextStyle(fontSize: 14, color: Color(0xFF999999)),
        children: [
          TextSpan(
            text: '《用户协议》',
            style: TextStyle(color: Theme.of(context).primaryColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SecondRoute()),
            );));
              },
          ),
          const TextSpan(text: '和'),
          TextSpan(
            text: '《隐私政策》',
            style: TextStyle(color: Theme.of(context).primaryColor),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return WebViewPage(
                      title: '《隐私政策》', url: 'https://flutter.dev');
                }));
              },
          ),
        ]),
    );
  }

  Widget loginBtn(context) {
    return const Center();
  }
}
