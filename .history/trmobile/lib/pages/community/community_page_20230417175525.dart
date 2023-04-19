import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:trmobile/pages/community/post.dart';
import "detial_page.dart";
import '../../net/TtApi.dart';
import '../../net/NetRequester.dart';
import '../../model/User.dart';
import '../home/home_page.dart';
import 'dart:async';
import '../music/music_page.dart';
import '../letter/letter_page.dart';

class CommunityPage extends StatefulWidget {
  final account;
  CommunityPage({
    super.key,
    required this.account,
  });

  @override
  State<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final Color _blackColor = const Color.fromARGB(255, 43, 46, 51);
  final Color _whiteColor = Colors.white;
  final Color _pinkColor = const Color.fromARGB(255, 253, 183, 200);
  static const loadingTag = "##loading##"; //表尾标记
  List _words = <dynamic>[];
  // bool isLike = false;
  int liken = 0;
  var imgKey = UniqueKey();

  Map imageList = {};
  List _likeList = [];

  String _planet = "焦虑星";

  @override
  initState() {
    super.initState();
    _getPlanet();
    _retrieveData();
    _getLike();
  }

  final GlobalKey _formKey = GlobalKey<FormState>();
  // late String _searchContext = "";

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
            _topNavBar(),
            const SizedBox(height: 15),
            _contextShow(context),
            const SizedBox(height: 18),
            _bottomNav(context),
          ],
        ),
      ),
    );
  }

  //星球导航栏
  Widget _topNavBar() {
    bool flag_1 = true;
    bool flag_2 = true;
    bool flag_3 = true;
    bool flag_4 = true;
    bool flag_5 = true;
    switch (_planet) {
      case "焦虑星":
        flag_1 = false;
        break;
      case "倦怠星":
        flag_2 = false;
        break;
      case "失落星":
        flag_3 = false;
        break;
      case "不开星":
        flag_4 = false;
        break;
      case "痛苦星":
        flag_5 = false;
        break;
    }
    return Container(
      alignment: Alignment.center,
      width: 335,
      height: 44,
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
                          flag_1 ? _blackColor : _whiteColor),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          const IconData(
                            0xe617,
                            fontFamily: "PlanetIcons",
                          ),
                          color: flag_1 ? _whiteColor : _blackColor,
                          size: 24,
                        ),
                        Text("焦虑星",
                            style: TextStyle(
                                color: flag_1 ? _whiteColor : _blackColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    //焦虑星
                    onPressed: () {
                      if (mounted) {
                        flag_1 = false;
                        flag_2 = true;
                        flag_3 = true;
                        flag_4 = true;
                        flag_5 = true;

                        _planet = "焦虑星";
                        _retrieveData();
                      }
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
                          flag_2 ? _blackColor : _whiteColor),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          const IconData(
                            0xe612,
                            fontFamily: "PlanetIcons",
                          ),
                          size: 24,
                          color: flag_2 ? _whiteColor : _blackColor,
                        ),
                        Text("倦怠星",
                            style: TextStyle(
                                color: flag_2 ? _whiteColor : _blackColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    onPressed: () {
                      if (mounted) {
                        setState(() {
                          flag_1 = true;
                          flag_2 = false;
                          flag_3 = true;
                          flag_4 = true;
                          flag_5 = true;

                          _planet = "倦怠星";
                          _retrieveData();
                        });
                      }
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
                          flag_3 ? _blackColor : _whiteColor),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          const IconData(
                            0xe610,
                            fontFamily: "PlanetIcons",
                          ),
                          color: flag_3 ? _whiteColor : _blackColor,
                          size: 24,
                        ),
                        Text("失落星",
                            style: TextStyle(
                                color: flag_3 ? _whiteColor : _blackColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    onPressed: () {
                      if (mounted) {
                        setState(() {
                          flag_1 = true;
                          flag_2 = true;
                          flag_3 = false;
                          flag_4 = true;
                          flag_5 = true;

                          _planet = "失落星";
                          _retrieveData();
                        });
                      }
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
                          flag_4 ? _blackColor : _whiteColor),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          const IconData(
                            0xe615,
                            fontFamily: "PlanetIcons",
                          ),
                          color: flag_4 ? _whiteColor : _blackColor,
                          size: 24,
                        ),
                        Text("不开星",
                            style: TextStyle(
                                color: flag_4 ? _whiteColor : _blackColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    onPressed: () {
                      if (mounted) {
                        setState(() {
                          flag_1 = true;
                          flag_2 = true;
                          flag_3 = true;
                          flag_4 = false;
                          flag_5 = true;

                          _planet = "不开星";
                          _retrieveData();
                        });
                      }
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
                          flag_5 ? _blackColor : _whiteColor),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          const IconData(
                            0xe611,
                            fontFamily: "PlanetIcons",
                          ),
                          color: flag_5 ? _whiteColor : _blackColor,
                          size: 24,
                        ),
                        Text("痛苦星",
                            style: TextStyle(
                                color: flag_5 ? _whiteColor : _blackColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                    onPressed: () {
                      if (mounted) {
                        setState(() {
                          flag_1 = true;
                          flag_2 = true;
                          flag_3 = true;
                          flag_4 = true;
                          flag_5 = false;

                          _planet = "痛苦星";
                          _retrieveData();
                        });
                      }
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

  // //搜索bar
  // Widget _searchBar(context) {
  //   return Container(
  //     margin: const EdgeInsets.only(bottom: 10),
  //     width: 320,
  //     height: 35,
  //     child: Row(
  //       children: [
  //         SizedBox(
  //           width: 255,
  //           height: 35,
  //           child: Form(
  //             key: _formKey,
  //             autovalidateMode: AutovalidateMode.onUserInteraction,
  //             child: Container(
  //                 decoration: const BoxDecoration(
  //                   borderRadius: BorderRadius.only(
  //                       topLeft: Radius.circular(20),
  //                       bottomLeft: Radius.circular(20)),
  //                   color: Color.fromARGB(20, 250, 123, 155),
  //                 ),
  //                 child: Row(
  //                   children: [
  //                     const SizedBox(
  //                       width: 10,
  //                     ),
  //                     const SizedBox(
  //                       width: 20,
  //                       child: Icon(
  //                         IconData(
  //                           0xe632,
  //                           fontFamily: "MyIcons",
  //                         ),
  //                         size: 20,
  //                         color: Color.fromARGB(200, 53, 53, 53),
  //                       ),
  //                     ),
  //                     const SizedBox(
  //                       width: 5,
  //                     ),
  //                     SizedBox(
  //                       width: 200,
  //                       height: 35,
  //                       child: TextFormField(
  //                         decoration: const InputDecoration(
  //                           border: InputBorder.none,
  //                           hintText: '搜索你感兴趣的东西',
  //                           hintStyle: TextStyle(
  //                               color: Color.fromARGB(146, 53, 53, 53),
  //                               fontSize: 13,
  //                               fontWeight: FontWeight.w300),
  //                         ),
  //                         //输入后字体
  //                         style: const TextStyle(
  //                             color: Color.fromARGB(255, 43, 46, 51),
  //                             fontSize: 14,
  //                             fontWeight: FontWeight.w300),
  //                         cursorColor: const Color.fromARGB(255, 43, 46, 51),
  //                         // cursorRadius: const Radius.circular(5),
  //                         cursorHeight: 20,
  //                         onSaved: (v) => _searchContext = v!,
  //                       ),
  //                     )
  //                   ],
  //                 )),
  //           ),
  //         ),
  //         const SizedBox(
  //           width: 5,
  //         ),
  //         SizedBox(
  //           width: 60,
  //           height: 35,
  //           child: Container(
  //             width: 55,
  //             height: 35,
  //             decoration: const BoxDecoration(
  //               borderRadius: BorderRadius.only(
  //                   topRight: Radius.circular(20),
  //                   bottomRight: Radius.circular(20)),
  //               color: Color.fromARGB(60, 234, 101, 134),
  //             ),
  //             child: TextButton(
  //               style: ButtonStyle(
  //                 overlayColor: MaterialStateProperty.all(Colors.transparent),
  //                 shape: MaterialStateProperty.all(RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.circular(20))),
  //               ),
  //               //搜索按钮
  //               onPressed: () {},
  //               child: const Text(
  //                 "搜索",
  //                 style: TextStyle(
  //                     color: Color.fromARGB(200, 53, 53, 53),
  //                     fontSize: 13,
  //                     fontWeight: FontWeight.w400),
  //               ),
  //             ),
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  //生成listview
  Widget _contextShow(context) {
    return Container(
      height: 615,
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
            //搜索bar
            // _searchBar(context),
            SizedBox(
              height: 595,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.separated(
                  itemCount: _words.length + 1,
                  itemBuilder: (context, index) {
                    if (_words == []) {
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: const SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: CircularProgressIndicator(strokeWidth: 2.0),
                        ),
                      );
                    } else if (index == _words.length) {
                      // 加载完成
                      return Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "- The End -",
                              style: TextStyle(
                                  color: Colors.black26, fontSize: 11),
                            ),
                          ],
                        ),
                      );
                    } else {
                      //社区内容现实列表
                      print(index);
                      return _postShow(index);
                    }
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

  //每个帖子的导航栏
  Widget _contextNavBar(index) {
    var time = _words[index]["date"].substring(0, 16);
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          //发帖人头像
          height: 45,
          width: 45,
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                "http://172.20.10.5/images/${_words[index]["account"]}.png?$imgKey"),
          ),
        ),
        SizedBox(
          height: 60,
          width: 270,
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              SizedBox(
                height: 30,
                width: 270,
                child: Row(children: [
                  SizedBox(
                    height: 30,
                    width: 220,
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              //发帖人昵称
                              Text("${_words[index]["name"]}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(230, 48, 48, 48),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 13,
                width: 270,
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    SizedBox(
                      height: 13,
                      width: 110,
                      //帖子发布时间
                      child: Text(
                        "$time",
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _retrieveData() async {
    var result1;
    var result2;
    Future.delayed(
        Duration(seconds: 1),
        () async => {
              result1 = await NetRequester.request(Apis.receive(_planet)),
              result2 = await NetRequester.request(Apis.queryImage()),
            }).then((value) => {picbuilder(result1, result2)});
  }

  void picbuilder(result1, result2) {
    var data1 = result1["data"];
    var data2 = result2["data"];
    Map newimageList = {};
    for (int index = 0; index < data1.length; index++) {
      List aList = [];
      var flag = 0;
      for (int i = 0; i < data2.length; i++) {
        while ((i < data2.length) &&
            (data1[index]["post_id"] == data2[i]["post_id"])) {
          aList.add(data2[i]["url"]);
          i++;
          flag = 1;
        }
        if (flag == 1) {
          break;
        }
      }
      newimageList[data1[index]["post_id"]] = aList;
      // print(newimageList);
    }
    if (mounted) {
      setState(() {
        _words = result1["data"];
        imageList = newimageList;
        imgKey = UniqueKey();
      });
    }
  }

  void _getPlanet() async {
    String _account = widget.account;
    var result = await NetRequester.request(Apis.planet(_account));
    if (mounted) {
      setState(() {
        _planet = result["data"];
      });
    }
  }

  void _getLike() async {
    List likeList = [];
    var result = await NetRequester.request(Apis.queryLike(widget.account));
    for (int i = 0; i < result["data"].length; i++) {
      likeList.add(result["data"][i]["post_id"]);
    }
    if (mounted) {
      setState(() {
        _likeList = likeList;
      });
    }
  }

  //底部导航栏
  Widget _bottomNav(context) {
    return Container(
      alignment: Alignment.center,
      width: 360,
      height: 53,
      decoration: BoxDecoration(
        // borderRadius: BorderRadius.circular(30),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
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
                    color: _pinkColor,
                  ),
                  Text(
                    "社区",
                    style: TextStyle(color: _pinkColor, fontSize: 11),
                  ),
                ],
              ),
              //社区按钮
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
              //文字编辑按钮
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PostPage(
                              account: widget.account,
                            )));
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
                    color: _whiteColor,
                    size: 20,
                  ),
                  Text(
                    "家",
                    style: TextStyle(color: _whiteColor, fontSize: 11),
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

  //每个帖子的图片
  Widget _swiperPic(index) {
    return SizedBox(
      //图片设置为轮播图
      width: double.infinity,
      child: AspectRatio(
        // 配置宽高比
        aspectRatio: 1 / 1,
        child: Swiper(
          key: ValueKey(imageList[_words[index]["post_id"]].length),
          // 配置图片数量
          itemBuilder: (BuildContext context, int flag) {
            return Image.network(
              imageList[_words[index]["post_id"]][flag],
              fit: BoxFit.contain,
            );
            // 配置图片地址
          },
          itemCount: imageList[_words[index]["post_id"]].length,
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
        ),
      ),
    );
  }

  //每个帖子的文字内容
  Widget _textContext(index) {
    return SizedBox(
      width: 335,
      height: 40,
      child: Row(children: [
        const SizedBox(
          width: 10,
        ),
        SizedBox(
          //文章内容
          width: 320,
          height: 20,
          child: Text.rich(
            TextSpan(
              text: '''${_words[index]["context"]}''',
              style: const TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 13,
                overflow: TextOverflow.ellipsis,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetialPage(
                                recipeImageList: imageList,
                                account: widget.account,
                                name: _words[index]["name"],
                                post_id: _words[index]["post_id"],
                                postaccount: _words[index]["account"],
                                context: _words[index]["context"],
                                time: _words[index]["date"].substring(0, 16),
                                commentunm: _words[index]["comment_number"],
                              )));
                },
            ),
          ),
        ),
      ]),
    );
  }

  //点赞和评论
  Widget _likeBtn(index) {
    var isLike = _likeList.contains(_words[index]["post_id"]);
    return StatefulBuilder(builder:
        (BuildContext context, void Function(void Function()) setState) {
      return SizedBox(
        width: 335,
        child: Row(children: [
          SizedBox(
            width: 325,
            height: 25,
            child: Row(
              children: [
                Container(
                  width: 25,
                  transform: Matrix4.translationValues(0.0, -5, 0.0),
                  //点赞按钮
                  child: IconButton(
                    icon: isLike
                        ? const Icon(Icons.favorite,
                            size: 20, color: Color.fromARGB(255, 231, 62, 50))
                        : const Icon(
                            IconData(
                              0xe616,
                              fontFamily: "MyIcons",
                            ),
                            size: 20,
                            color: Color.fromARGB(255, 231, 62, 50)),
                    onPressed: () async {
                      if (isLike == true) {
                        var result1 = await NetRequester.request(
                            Apis.deldetePostLike(_words[index]["post_id"]));
                        var result2 = await NetRequester.request(
                            Apis.deleteLike(
                                _words[index]["post_id"], widget.account));
                        liken = 0;
                        print("取消$result1");
                        print("取消$result2");
                      } else {
                        var result1 = await NetRequester.request(
                            Apis.insertPostLike(_words[index]["post_id"]));
                        var result2 = await NetRequester.request(
                            Apis.insertLike(
                                _words[index]["post_id"], widget.account));
                        liken = 1;
                        print("点赞$result1");
                        print("点赞$result2");
                      }
                      isLike = !isLike;
                      _getLike();
                    },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 5),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      //点赞数量
                      SizedBox(
                        child: Text(
                          "${_words[index]["like_number"] + liken}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(0.0, -5, 0.0),
                  padding: const EdgeInsets.only(left: 10),
                  //评论按钮
                  child: IconButton(
                    icon: const Icon(
                      IconData(
                        0xe60a,
                        fontFamily: "MyIcons",
                      ),
                      color: Color.fromARGB(255, 231, 62, 50),
                      size: 20,
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetialPage(
                                    recipeImageList: imageList,
                                    account: widget.account,
                                    name: _words[index]["name"],
                                    post_id: _words[index]["post_id"],
                                    postaccount: _words[index]["account"],
                                    context: _words[index]["context"],
                                    time:
                                        _words[index]["date"].substring(0, 16),
                                    commentunm: _words[index]["comment_number"],
                                  )));
                    },
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(-10, 0.0, 0.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        //评论数量
                        child: Text(
                          "${_words[index]["comment_number"]}",
                          style: const TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ]),
      );
    });
  }

  //展示帖子
  Widget _postShow(index) {
    return SizedBox(
      width: 335,
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            width: 335,
            height: 55,
            //每个帖子的导航栏
            child: _contextNavBar(index),
          ),
          _swiperPic(index),
          const SizedBox(
            height: 10,
          ),
          _textContext(index),
          _likeBtn(index),
          const SizedBox(
            height: 15,
          )
        ],
      ),
    );
  }
}
