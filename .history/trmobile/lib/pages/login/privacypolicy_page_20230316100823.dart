import 'package:flutter/material.dart';

class privacyPolicyPage extends StatelessWidget {
  const privacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "隐私政策",
      home: Scaffold(
        appBar: AppBar(
          title: Text("隐私保护政策"),
        ),
        body: Center(
          child: Column(
            children: const [
              TextSpan(
                  "知我王潇彤尊重并保护您的隐私。您在下载、开启、浏览、注册、登录、使用“漫漫”网站、软件及相关产品和/或服务时，我们将按照本《隐私保护政策》（以下简称“本政策”）收集、使用、储存及对外提供您的信息。同时，我们会通过本政策向您说明，我们如何为您提供访问、更新、管理和保护您的信息的服务。本政策与您使用我们的服务关系紧密，我们建议您仔细阅读并理解本政策全部内容，做出您认为适当的选择。我们努力用通俗易懂、简明扼要的文字表达，并对本政策中与您的权益存在重大关系的条款和个人敏感信息，采用重点标注以提示您注意。"),
            ],
          ),
        ),
      ),
    );
  }
}
