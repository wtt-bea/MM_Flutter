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
  final _pwdController = TextEditingController(); //密码
  final _pwdreController = TextEditingController(); //确认密码
  final _nameController = TextEditingController(); //昵称
  final _genderController = TextEditingController(); //性别
  final _planetController = TextEditingController(); //星球
  final GlobalKey _formKey = GlobalKey<FormState>();

  late String _pwd, _pwdre, _name, _gender, _planet;

  List imageList = [
    'lib/assets/images/info.png',
    'lib/assets/images/info.png',
    'lib/assets/images/info.png'
  ];

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
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
              height: 30,
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
                  child: Column(children: []),
                ))
          ],
        ),
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
}
