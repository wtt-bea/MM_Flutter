import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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

  bool flag_6 = false;
  bool flag_7 = true;
  bool flag_8 = true;
  bool flag_9 = true;
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
      height: 45,
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
                        width: 5,
                      ),
                      const SizedBox(
                        width: 20,
                        child: Icon(
                          IconData(
                            0xe632,
                            fontFamily: "MyIcons",
                          ),
                          color: Color.fromARGB(200, 53, 53, 53),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
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
                    // return ListTile(title: Text(_words[index]));
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
                                                                  FontWeight
                                                                      .w500,
                                                              color: Color
                                                                  .fromARGB(
                                                                      230,
                                                                      48,
                                                                      48,
                                                                      48))),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            //关注按钮
                                            // decoration: const BoxDecoration(
                                            //   color: Color.fromARGB(
                                            //       255, 223, 255, 64),
                                            // ),
                                            height: 26,
                                            width: 44,
                                            child: TextButton(
                                              style: ButtonStyle(
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
                                                    fontSize: 9,
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
                            child: Row(children: const [
                              SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                //文章内容
                                width: 325,
                                height: 40,
                                // decoration: const BoxDecoration(
                                //     color: Color.fromARGB(255, 255, 131, 64)),
                                child: Text(
                                  "今天发现了超多好玩的东西啊啊啊啊啊啊啊啊骄傲地阿萨的交接第三",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 13,
                                      overflow: TextOverflow.ellipsis),
                                ),
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
                                      height: 22,
                                      decoration: const BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                      ),
                                      child: const Icon(
                                        IconData(
                                          0xe616,
                                          fontFamily: "MyIcons",
                                        ),
                                        color: Color.fromARGB(255, 231, 62, 50),
                                      ),
                                    ),
                                    Container(
                                      width: 40,
                                      height: 22,
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
                                    Container(
                                      height: 22,
                                      width: 30,
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
                                      ),
                                    ),
                                    Container(
                                      width: 40,
                                      height: 22,
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
                          SizedBox(
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
      height: 57,
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
                      0xe609,
                      fontFamily: "MyIcons",
                    ),
                    color: flag_6 ? whiteColor : pinkColor,
                  ),
                  Text(
                    "社区",
                    style: TextStyle(
                        color: flag_6 ? whiteColor : pinkColor, fontSize: 12),
                  ),
                ],
              ),
              onPressed: () {
                setState(() {
                  flag_6 = false;
                  flag_7 = true;
                  flag_8 = true;
                  flag_9 = true;
                });
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
                      0xe714,
                      fontFamily: "MyIcons",
                    ),
                    color: flag_7 ? whiteColor : pinkColor,
                  ),
                  Text(
                    "助眠",
                    style: TextStyle(
                        color: flag_7 ? whiteColor : pinkColor, fontSize: 12),
                  ),
                ],
              ),
              onPressed: () {
                setState(() {
                  flag_6 = true;
                  flag_7 = false;
                  flag_8 = true;
                  flag_9 = true;
                });
              },
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
                    color: flag_8 ? whiteColor : pinkColor,
                  ),
                  Text(
                    "信箱",
                    style: TextStyle(
                        color: flag_8 ? whiteColor : pinkColor, fontSize: 12),
                  ),
                ],
              ),
              onPressed: () {
                setState(() {
                  flag_6 = true;
                  flag_7 = true;
                  flag_8 = false;
                  flag_9 = true;
                });
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
                    Icons.home,
                    color: flag_9 ? whiteColor : pinkColor,
                  ),
                  Text(
                    "家",
                    style: TextStyle(
                        color: flag_9 ? whiteColor : pinkColor, fontSize: 12),
                  ),
                ],
              ),
              onPressed: () {
                setState(() {
                  flag_6 = true;
                  flag_7 = true;
                  flag_8 = true;
                  flag_9 = false;
                });
              },
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
    return Container(
      height: MediaQuery.of(context).size.height / 0.8,
      child: Column(children: [
        Container(
            height: 30,
            // decoration: BoxDecoration(color: Colors.black12),
            child: SizedBox(
              //关注按钮
              // decoration: const BoxDecoration(
              //   color: Color.fromARGB(
              //       255, 223, 255, 64),
              // ),
              height: 30,
              width: 50,
              child: TextButton(
                style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all(Color.fromARGB(0, 157, 45, 45)),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
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
            ))
      ]),
    );
  }
}
