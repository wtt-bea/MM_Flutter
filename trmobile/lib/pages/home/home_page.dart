import 'package:flutter/material.dart';
import '../../net/NetRequester.dart';
import '../../net/TtApi.dart';
import '../community/community_page.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'homedetial_page.dart';
import 'infochange_page.dart';
import 'clock_page.dart';
import 'remind_page.dart';
import '../music/music_page.dart';
import '../letter/letter_page.dart';

class HomePage extends StatefulWidget {
  final account;
  const HomePage({
    super.key,
    required this.account,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Color _blackColor = const Color.fromARGB(255, 43, 46, 51);
  final Color _whiteColor = Colors.white;
  final Color _pinkColor = const Color.fromARGB(255, 253, 183, 200);
  List _data = [];
  Map _imageList = {};
  List _likeList = [];
  int liken = 0;
  var imgKey = UniqueKey();

  @override
  initState() {
    super.initState();
    _retrieveData();
    _getLike();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("lib/assets/images/homebg.jpg")),
        ),
        child: Column(children: [
          const SizedBox(height: 80),
          _infoChange(context),
          const SizedBox(height: 10),
          _itemRemind(context),
          const SizedBox(height: 10),
          _dailyCheckins(context),
          const SizedBox(height: 25),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _listView(context),
              _bottomNav(context),
            ],
          ),
        ]),
      ),
    );
  }

  //底部导航栏
  Widget _bottomNav(context) {
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
            width: 27,
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
                    color: _whiteColor,
                  ),
                  Text(
                    "社区",
                    style: TextStyle(color: _whiteColor, fontSize: 11),
                  ),
                ],
              ),
              //社区按钮
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CommunityPage(
                      account: widget.account,
                    ),
                  ),
                );
                ImageCache imageCache = PaintingBinding.instance.imageCache;
                imageCache.clear();
              },
            ),
          ),
          SizedBox(
            height: 59,
            width: 75,
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
            width: 75,
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
            width: 75,
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
                    color: _pinkColor,
                    size: 20,
                  ),
                  Text(
                    "家",
                    style: TextStyle(color: _pinkColor, fontSize: 11),
                  ),
                ],
              ),
              //家按钮
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }

  //信息更改按钮
  Widget _infoChange(context) {
    return Container(
      height: 35,
      width: 110,
      margin: const EdgeInsets.only(right: 260),
      decoration: BoxDecoration(
        color: const Color.fromARGB(40, 255, 255, 255),
        border: Border.all(
            color: const Color.fromARGB(255, 255, 255, 255),
            width: 2), // border
        borderRadius: const BorderRadius.horizontal(right: Radius.circular(5)),
      ),
      child: TextButton(
        child: Text(
          "信息更改",
          style: TextStyle(
              color: _whiteColor, fontWeight: FontWeight.w400, fontSize: 13),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => InfochangePage(
                account: widget.account,
              ),
            ),
          );
        },
      ),
    );
  }

  //事项提醒按钮
  Widget _itemRemind(context) {
    return Container(
      height: 35,
      width: 130,
      margin: EdgeInsets.only(right: 280),
      decoration: BoxDecoration(
        color: Color.fromARGB(40, 255, 255, 255),
        border: Border.all(
            color: Color.fromARGB(255, 255, 255, 255), width: 2), // border
        borderRadius: BorderRadius.horizontal(right: Radius.circular(5)),
      ),
      child: TextButton(
        child: Text(
          "事项提醒",
          style: TextStyle(
              color: _whiteColor, fontWeight: FontWeight.w400, fontSize: 13),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => RemindPage(
                account: widget.account,
              ),
            ),
          );
        },
      ),
    );
  }

  //每日打卡按钮
  Widget _dailyCheckins(context) {
    return Container(
      height: 35,
      width: 130,
      margin: EdgeInsets.only(right: 265),
      decoration: BoxDecoration(
        color: Color.fromARGB(40, 255, 255, 255),
        border: Border.all(
            color: Color.fromARGB(255, 255, 255, 255), width: 2), // border
        borderRadius: BorderRadius.horizontal(right: Radius.circular(5)),
      ),
      child: TextButton(
        child: Text(
          "每日打卡",
          style: TextStyle(
              color: _whiteColor, fontWeight: FontWeight.w400, fontSize: 13),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ClockPage(
                account: widget.account,
              ),
            ),
          );
        },
      ),
    );
  }

  //个人主页生成
  Widget _listView(context) {
    return Container(
      height: 550,
      width: 340,
      decoration: BoxDecoration(
        color: Color.fromARGB(230, 255, 255, 255),
        borderRadius: BorderRadius.circular(27),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(100, 255, 255, 255),
            offset: Offset(3, -10),
            blurRadius: 10,
          )
        ],
      ),
      padding: const EdgeInsets.only(top: 13),
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 10),
            //搜索bar
            // _searchBar(context),
            SizedBox(
              height: 455,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.separated(
                  itemCount: _data.length + 1,
                  itemBuilder: (context, index) {
                    if (_data == []) {
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: const SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: CircularProgressIndicator(strokeWidth: 2.0),
                        ),
                      );
                    } else if (index == _data.length) {
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

  //获取个人主页信息
  void _retrieveData() async {
    var result1 = await NetRequester.request(Apis.postHome(widget.account));
    var result2 = await NetRequester.request(Apis.queryImage());
    picbuilder(result1, result2);
  }

  //获取点赞
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

  //处理图片信息
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
        _data = result1["data"];
        _imageList = newimageList;
        imgKey = UniqueKey();
      });
    }
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

  //每个帖子的导航栏
  Widget _contextNavBar(index) {
    var time = _data[index]["date"].substring(0, 16);
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
                "http://172.20.10.5/images/${_data[index]["account"]}.png?$imgKey"),
            key: imgKey,
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
                              Text("${_data[index]["name"]}",
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

  //每个帖子的图片
  Widget _swiperPic(index) {
    return SizedBox(
      //图片设置为轮播图
      width: double.infinity,
      child: AspectRatio(
        // 配置宽高比
        aspectRatio: 1 / 1,
        child: Swiper(
          key: ValueKey(_imageList[_data[index]["post_id"]].length),
          // 配置图片数量
          itemBuilder: (BuildContext context, int flag) {
            return Image.network(
              _imageList[_data[index]["post_id"]][flag],
              fit: BoxFit.contain,
            );
            // 配置图片地址
          },
          itemCount: _imageList[_data[index]["post_id"]].length,
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
              text: '''${_data[index]["context"]}''',
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
                          builder: (context) => HomedetialPage(
                                recipeImageList: _imageList,
                                account: widget.account,
                                name: _data[index]["name"],
                                post_id: _data[index]["post_id"],
                                postaccount: _data[index]["account"],
                                context: _data[index]["context"],
                                time: _data[index]["date"].substring(0, 16),
                                commentunm: _data[index]["comment_number"],
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
    var isLike = _likeList.contains(_data[index]["post_id"]);
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
                            Apis.deldetePostLike(_data[index]["post_id"]));
                        var result2 = await NetRequester.request(
                            Apis.deleteLike(
                                _data[index]["post_id"], widget.account));
                        liken = 0;
                        print("取消$result1");
                        print("取消$result2");
                      } else {
                        var result1 = await NetRequester.request(
                            Apis.insertPostLike(_data[index]["post_id"]));
                        var result2 = await NetRequester.request(
                            Apis.insertLike(
                                _data[index]["post_id"], widget.account));
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
                          "${_data[index]["like_number"] + liken}",
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
                              builder: (context) => HomedetialPage(
                                    recipeImageList: _imageList,
                                    account: widget.account,
                                    name: _data[index]["name"],
                                    post_id: _data[index]["post_id"],
                                    postaccount: _data[index]["account"],
                                    context: _data[index]["context"],
                                    time: _data[index]["date"].substring(0, 16),
                                    commentunm: _data[index]["comment_number"],
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
                          "${_data[index]["comment_number"]}",
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
}
