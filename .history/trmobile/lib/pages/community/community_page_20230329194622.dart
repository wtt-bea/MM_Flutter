import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:io';
import 'package:flutter/gestures.dart';
import "detial_page.dart";

class CommunityPage extends StatefulWidget {
  const CommunityPage({super.key});

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  Color blackColor = const Color.fromARGB(255, 43, 46, 51);
  Color whiteColor = Colors.white;
  Color pinkColor = const Color.fromARGB(255, 253, 183, 200);
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  bool flag_1 = false;
  bool flag_2 = true;
  bool flag_3 = true;
  bool flag_4 = true;
  bool flag_5 = true;
  List imageList = [
    'lib/assets/images/info.png',
    'lib/assets/images/info.png',
    'lib/assets/images/info.png'
  ];
  @override
  void initState() {
    super.initState();
    _retrieveData();
  }

  final GlobalKey _formKey = GlobalKey<FormState>();
  late String _searchContext = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            const SizedBox(height: 35),
            topNavBar(),
            const SizedBox(height: 13),
            conText(context),
            const SizedBox(height: 17),
            bottomNav(),
          ],
        ),
      ),
    );
  }

  Widget topNavBar() {
    return Container(
      alignment: Alignment.center,
      width: 335,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromARGB(255, 43, 46, 51),
      ),
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            width: 310,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color.fromARGB(255, 43, 46, 51),
            ),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                SizedBox(
                  width: 80,
                  child: TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.only(left: 5),
                      ),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor: MaterialStateProperty.all(
                          flag_1 ? blackColor : whiteColor),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          const IconData(
                            0xe617,
                            fontFamily: "PlanetIcons",
                          ),
                          color: flag_1 ? whiteColor : blackColor,
                          size: 24,
                        ),
                        Text("焦虑星",
                            style: TextStyle(
                                color: flag_1 ? whiteColor : blackColor,
                                fontSize: 13)),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        flag_1 = false;
                        flag_2 = true;
                        flag_3 = true;
                        flag_4 = true;
                        flag_5 = true;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.only(left: 5),
                      ),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor: MaterialStateProperty.all(
                          flag_2 ? blackColor : whiteColor),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          const IconData(
                            0xe612,
                            fontFamily: "PlanetIcons",
                          ),
                          size: 24,
                          color: flag_2 ? whiteColor : blackColor,
                        ),
                        Text("倦怠星",
                            style: TextStyle(
                                color: flag_2 ? whiteColor : blackColor,
                                fontSize: 13)),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        flag_1 = true;
                        flag_2 = false;
                        flag_3 = true;
                        flag_4 = true;
                        flag_5 = true;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.only(left: 5),
                      ),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor: MaterialStateProperty.all(
                          flag_3 ? blackColor : whiteColor),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          const IconData(
                            0xe610,
                            fontFamily: "PlanetIcons",
                          ),
                          color: flag_3 ? whiteColor : blackColor,
                          size: 24,
                        ),
                        Text("失落星",
                            style: TextStyle(
                                color: flag_3 ? whiteColor : blackColor,
                                fontSize: 13)),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        flag_1 = true;
                        flag_2 = true;
                        flag_3 = false;
                        flag_4 = true;
                        flag_5 = true;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.only(left: 5),
                      ),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor: MaterialStateProperty.all(
                          flag_4 ? blackColor : whiteColor),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          const IconData(
                            0xe615,
                            fontFamily: "PlanetIcons",
                          ),
                          color: flag_4 ? whiteColor : blackColor,
                          size: 24,
                        ),
                        Text("不开星",
                            style: TextStyle(
                                color: flag_4 ? whiteColor : blackColor,
                                fontSize: 13)),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        flag_1 = true;
                        flag_2 = true;
                        flag_3 = true;
                        flag_4 = false;
                        flag_5 = true;
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 80,
                  child: TextButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        const EdgeInsets.only(left: 5),
                      ),
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20))),
                      backgroundColor: MaterialStateProperty.all(
                          flag_5 ? blackColor : whiteColor),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          const IconData(
                            0xe611,
                            fontFamily: "PlanetIcons",
                          ),
                          color: flag_5 ? whiteColor : blackColor,
                          size: 24,
                        ),
                        Text("痛苦星",
                            style: TextStyle(
                                color: flag_5 ? whiteColor : blackColor,
                                fontSize: 13)),
                      ],
                    ),
                    onPressed: () {
                      setState(() {
                        flag_1 = true;
                        flag_2 = true;
                        flag_3 = true;
                        flag_4 = true;
                        flag_5 = false;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget searchBar(context) {
    return SizedBox(
      width: 320,
      height: 35,
      child: Row(
        children: [
          SizedBox(
            width: 255,
            height: 35,
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                    color: Color.fromARGB(20, 250, 123, 155),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      const SizedBox(
                        width: 20,
                        child: Icon(
                          IconData(
                            0xe632,
                            fontFamily: "MyIcons",
                          ),
                          size: 20,
                          color: Color.fromARGB(200, 53, 53, 53),
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      SizedBox(
                        width: 200,
                        height: 35,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: '搜索你感兴趣的东西',
                            hintStyle: TextStyle(
                                color: Color.fromARGB(146, 53, 53, 53),
                                fontSize: 13,
                                fontWeight: FontWeight.w300),
                          ),
                          //输入后字体
                          style: const TextStyle(
                              color: Color.fromARGB(255, 43, 46, 51),
                              fontSize: 14,
                              fontWeight: FontWeight.w300),
                          cursorColor: const Color.fromARGB(255, 43, 46, 51),
                          // cursorRadius: const Radius.circular(5),
                          cursorHeight: 20,
                          onSaved: (v) => _searchContext = v!,
                        ),
                      )
                    ],
                  )),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          SizedBox(
            width: 60,
            height: 35,
            child: Container(
              width: 55,
              height: 35,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Color.fromARGB(60, 234, 101, 134),
              ),
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
                ),
                onPressed: () {},
                child: const Text(
                  "搜索",
                  style: TextStyle(
                      color: Color.fromARGB(200, 53, 53, 53),
                      fontSize: 13,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget conText(context) {
    return Container(
      height: 601,
      width: 335,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(50, 80, 80, 80),
            offset: Offset(0.0, 6.0),
            blurRadius: 8,
            spreadRadius: 5,
          )
        ],
        color: Color.fromARGB(230, 255, 255, 255),
      ),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 10),
            searchBar(context),
            Expanded(
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.separated(
                  itemCount: _words.length,
                  itemBuilder: (context, index) {
                    //如果到了表尾
                    if (_words[index] == loadingTag) {
                      //不足100条，继续获取数据
                      if (_words.length - 1 < 100) {
                        //获取数据
                        _retrieveData();
                        //加载时显示loading
                        return Container(
                          padding: const EdgeInsets.all(16.0),
                          alignment: Alignment.center,
                          child: const SizedBox(
                            width: 24.0,
                            height: 24.0,
                            child: CircularProgressIndicator(strokeWidth: 2.0),
                          ),
                        );
                      } else {
                        //加载完成
                        return Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(16.0),
                          child: const Text(
                            "没有更多了",
                            style: TextStyle(color: Colors.grey),
                          ),
                        );
                      }
                    }
                    //社区内容现实列表
                    return Container(
                      width: 335,
                      // decoration: const BoxDecoration(color: Colors.brown),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            width: 335,
                            height: 55,
                            // decoration:
                            //     const BoxDecoration(color: Colors.amberAccent),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 10,
                                ),
                                const SizedBox(
                                  //头像
                                  height: 50,
                                  width: 50,
                                  // decoration: const BoxDecoration(
                                  //     color: Color.fromARGB(255, 64, 249, 255)),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(
                                        "https://www.itying.com/images/flutter/2.png"),
                                  ),
                                ),
                                SizedBox(
                                  height: 60,
                                  width: 270,
                                  // decoration: const BoxDecoration(
                                  //     color: Color.fromARGB(255, 255, 64, 64)),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: 270,
                                        child: Row(children: [
                                          SizedBox(
                                            height: 30,
                                            width: 220,
                                            // decoration: const BoxDecoration(
                                            //   color: Color.fromARGB(
                                            //       255, 64, 255, 102),
                                            // ),
                                            child: Row(
                                              children: [
                                                const SizedBox(
                                                  width: 10,
                                                ),
                                                SizedBox(
                                                  // decoration: const BoxDecoration(
                                                  //   color: Color.fromARGB(
                                                  //       255, 64, 188, 255),
                                                  // ),
                                                  child: Column(
                                                    //昵称
                                                    children: const [
                                                      SizedBox(
                                                        height: 10,
                                                      ),
                                                      Text("我的名字",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color:
                                                                Color.fromARGB(
                                                                    230,
                                                                    48,
                                                                    48,
                                                                    48),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 25,
                                            width: 44,
                                            child: TextButton(
                                              style: ButtonStyle(
                                                padding:
                                                    MaterialStateProperty.all(
                                                  const EdgeInsets.all(0),
                                                ),
                                                overlayColor:
                                                    MaterialStateProperty.all(
                                                        Colors.transparent),
                                                shape:
                                                    MaterialStateProperty.all(
                                                  RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15),
                                                  ),
                                                ),
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.black),
                                              ),
                                              onPressed: () {},
                                              child: const Text(
                                                "关注",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          )
                                        ]),
                                      ),
                                      SizedBox(
                                        height: 13,
                                        width: 270,
                                        child: Row(
                                          children: const [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            SizedBox(
                                              //帖子发布时间
                                              height: 13,
                                              width: 100,
                                              // decoration: const BoxDecoration(
                                              //   color: Color.fromARGB(
                                              //       255, 217, 64, 255),
                                              // ),
                                              child: Text(
                                                "2022/11/22  23:09",
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.grey),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            //图片设置为轮播图
                            width: double.infinity,
                            // decoration: const BoxDecoration(
                            //     color: Color.fromARGB(255, 131, 255, 64)),
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
                                    activeColor:
                                        Color.fromARGB(255, 237, 173, 204),
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
                          ),
                          SizedBox(
                            width: 335,
                            height: 40,
                            child: Row(children: [
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                //文章内容
                                width: 320,
                                height: 40,
                                // decoration: const BoxDecoration(
                                //     color: Color.fromARGB(255, 255, 131, 64)),
                                child: Text.rich(
                                    overflow: TextOverflow.ellipsis,
                                    TextSpan(
                                      text:
                                          "今天发现了超多好玩的东西啊啊啊啊啊啊啊啊骄傲地阿萨的交接第三今天发现了超多好玩的东西啊啊啊啊啊啊啊啊骄傲地阿萨的交接第三今天发现了超多好玩的东西啊啊啊啊啊啊啊啊骄傲地阿萨的交接第三今天发现了超多好玩的东西啊啊啊啊啊啊啊啊骄傲地阿萨的交接第三",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w300,
                                        fontSize: 13,
                                      ),
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DetialPage(
                                                          ImageList:
                                                              imageList)));
                                        },
                                    )),
                              ),
                            ]),
                          ),
                          Container(
                            width: 335,
                            child: Row(children: [
                              const SizedBox(
                                width: 6,
                              ),
                              Container(
                                //点赞按钮
                                width: 325,
                                height: 22,
                                // decoration: const BoxDecoration(
                                //     color: Color.fromARGB(255, 80, 64, 255)),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 30,
                                      padding: const EdgeInsets.only(left: 10),
                                      child: const Icon(
                                        IconData(
                                          0xe616,
                                          fontFamily: "MyIcons",
                                        ),
                                        size: 20,
                                        color: Color.fromARGB(255, 231, 62, 50),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 3),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            // decoration: const BoxDecoration(
                                            //   color: Color.fromARGB(
                                            //       255, 255, 64, 245),
                                            // ),
                                            child: const Text(
                                              "24",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 25),
                                      decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 249, 249, 249),
                                      ),
                                      child: const Icon(
                                        IconData(
                                          0xe60a,
                                          fontFamily: "MyIcons",
                                        ),
                                        color: Color.fromARGB(255, 231, 62, 50),
                                        size: 20,
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 3),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Container(
                                            width: 40,
                                            height: 14,
                                            // decoration: const BoxDecoration(
                                            //   color: Color.fromARGB(
                                            //       255, 255, 64, 245),
                                            // ),
                                            child: const Text(
                                              "22",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) =>
                      const Divider(height: .0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _retrieveData() {
    Future.delayed(const Duration(seconds: 2)).then((e) {
      setState(() {
        //重新构建列表
        _words.insertAll(
          _words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList(),
        );
      });
    });
  }

  Widget bottomNav() {
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
            width: 15,
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
                    color: pinkColor,
                  ),
                  Text(
                    "社区",
                    style: TextStyle(color: pinkColor, fontSize: 11),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 59,
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
                      0xe714,
                      fontFamily: "MyIcons",
                    ),
                    size: 20,
                    color: whiteColor,
                  ),
                  Text(
                    "助眠",
                    style: TextStyle(color: whiteColor, fontSize: 11),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 59,
            width: 60,
            child: TextButton(
              child: Column(
                children: [
                  const SizedBox(
                    height: 2,
                  ),
                  SizedBox(
                    height: 35,
                    width: 37,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
              onPressed: () {
                showBottomSheet();
              },
            ),
          ),
          SizedBox(
            height: 59,
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
                      0xe64d,
                      fontFamily: "MyIcons",
                    ),
                    size: 20,
                    color: whiteColor,
                  ),
                  Text(
                    "信箱",
                    style: TextStyle(color: whiteColor, fontSize: 11),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ),
          SizedBox(
            height: 59,
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
                    Icons.home,
                    color: whiteColor,
                    size: 20,
                  ),
                  Text(
                    "家",
                    style: TextStyle(color: whiteColor, fontSize: 11),
                  ),
                ],
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  //显示底部弹框的功能
  void showBottomSheet() {
    //用于在底部打开弹框的效果
    showModalBottomSheet(
        builder: (BuildContext context) {
          //构建弹框中的内容
          return buildBottomSheetWidget(context);
        },
        context: context);
  }

  Widget buildBottomSheetWidget(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          SizedBox(
            child: Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                SizedBox(
                  height: 32,
                  width: 55,
                  child: TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                          Color.fromARGB(0, 157, 45, 45)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 253, 183, 200)),
                    ),
                    onPressed: () {},
                    child: const Text(
                      "发布",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 245),
                SizedBox(
                  child: IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black54,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 150,
            width: 340,
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 6,
              minLines: 1,
              decoration: InputDecoration(
                hintText: '今天遇到什么开心的事情了吗....',
                hintStyle: TextStyle(fontSize: 14, color: Colors.black26),
                filled: true,
                fillColor: Colors.transparent,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                isDense: true,
                border: InputBorder.none,
              ),
              style: TextStyle(
                  color: Color.fromARGB(255, 67, 67, 67),
                  fontSize: 14,
                  fontWeight: FontWeight.w300),
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Color.fromARGB(255, 29, 28, 26)),
            height: 232,
          ),
        ],
      ),
    );
  }
}
