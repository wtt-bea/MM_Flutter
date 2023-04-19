import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
// ignore: depend_on_referenced_packages
import '../../net/NetRequester.dart';
import '../../net/TtApi.dart';
import 'home_page.dart';
import '../music/music_page.dart';
import '../letter/letter_page.dart';

class HomedetialPage extends StatefulWidget {
  Map recipeImageList = {}; //传来的图片
  final account;
  final postaccount;
  final name;
  final post_id;
  final context;
  final time;
  int commentunm;
  HomedetialPage(
      {super.key,
      required this.recipeImageList,
      required this.account,
      required this.name,
      required this.post_id,
      required this.postaccount,
      required this.context,
      required this.time,
      required this.commentunm});

  @override
  State<HomedetialPage> createState() => _HomedetialPageState();
}

class _HomedetialPageState extends State<HomedetialPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  List _commentList = [];
  var _commentContext = "";
  var _inputContext = "";
  int _comnum = 0;
  TextEditingController _textcontroller = TextEditingController();
  // TextEditingController editingController = TextEditingController();
  bool keyboard = false; //键盘的弹起、收回状态
  var imgKey = UniqueKey();

  @override
  initState() {
    super.initState();
    _getComment();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(children: [
          const SizedBox(height: 15),
          _topNavBar(context),
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              _pageDisplay(context),
              _bottomNavBar(context),
            ],
          ),
        ]),
      ),
    );
  }

  void _getComment() async {
    var result = await NetRequester.request(Apis.queryComment(widget.post_id));
    print(result["data"]);
    if (mounted) {
      setState(() {
        _commentList = result["data"];
        imgKey = UniqueKey();
      });
    }
  }

  //顶部导航栏
  Widget _topNavBar(context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: double.infinity,
      height: 60,
      child: Row(
        children: [
          SizedBox(
            height: 40,
            width: 25,
            //返回按钮
            child: IconButton(
              padding: const EdgeInsets.only(left: 10),
              icon: const Icon(
                IconData(0xe8ef, fontFamily: "MyIcons"),
                size: 20,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                      account: widget.account,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            height: 40,
            width: 40,
            //发帖人头像
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  "http://172.20.10.5/images/${widget.postaccount}.png"),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 210,
            //用户名
            child: Text(
              "${widget.name}",
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ],
      ),
    );
  }

  //底部导航栏
  Widget _bottomNavBar(context) {
    double height = MediaQuery.of(context).padding.bottom;
    TextEditingController editingController = TextEditingController(); //输入框的编辑
    return Container(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              height: 1,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 233, 233, 233)),
              padding: EdgeInsets.only(bottom: keyboard ? 0 : height),
            ),
            AnimatedPadding(
              //可以添加一个动画效果
              padding: MediaQuery.of(context).viewInsets, //边距（必要）
              duration: const Duration(milliseconds: 100), //动画时常 （必要）
              child: Container(
                color: Colors.white, //评论位置颜色
                //距离底部边界距离，这个是为了适配全面屏的，keyboard，bool类型，代表键盘的弹起和收回。true谈起，false收回，这个值怎么获取下面会有提到。
                child: Container(
                  height: 50, //设置输入框谈起和收回时的高度
                  width: double.infinity, //设置宽度
                  //控件横向排版弹性布局
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 295,
                        margin: EdgeInsets.only(left: 20),
                        padding:
                            EdgeInsets.only(left: 15, bottom: 2, right: 15),
                        decoration: BoxDecoration(
                            //设置边框、圆角效果
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border:
                                Border.all(width: 0.5, color: Colors.black38)),
                        child: Form(
                          key: _formKey,
                          child: TextFormField(
                            maxLines: 1, //最大行数
                            controller:
                                _textcontroller, //绑定TextEditController更好操作
                            style: const TextStyle(
                              //设置字体、颜色
                              fontSize: 13,
                              color: Color.fromARGB(254, 0, 0, 0),
                            ),
                            autocorrect: true,
                            decoration: InputDecoration(
                              //设置提示内容，字体颜色、大小等
                              border: InputBorder.none,
                              hintText: _inputContext,
                              hintStyle: const TextStyle(
                                fontSize: 13,
                                color: Colors.black26,
                              ),
                            ),
                            cursorHeight: 17,
                            cursorColor: const Color.fromARGB(255, 43, 46, 51),
                            onChanged: (text) {
                              // 获取时时输入框的内容
                              _commentContext = _inputContext + text;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 35,
                        height: 35,
                        child: IconButton(
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onPressed: () async {
                            (_formKey.currentState as FormState).save();
                            if (_commentContext == "") {
                              showDialog(
                                  context: this.context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: const Text(
                                        "输入提醒",
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(15))),
                                      content: const Text(
                                        "您未输入任何评论哦~",
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
                                            side: const BorderSide(
                                                width: 1.0,
                                                color: Colors.black),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                            } else {
                              var result = await NetRequester.request(
                                  Apis.postComment(widget.post_id,
                                      widget.account, _commentContext));
                              var result2 = await NetRequester.request(
                                  Apis.postAddcomment(widget.post_id));
                              SystemChannels.textInput
                                  .invokeMethod<void>('TextInput.hide');
                              if (mounted) {
                                setState(() {
                                  _comnum++;
                                  _getComment();
                                  _textcontroller.clear();
                                  _commentContext = "";
                                  _inputContext = "";
                                });
                              }
                            }
                          },
                          icon: const Icon(Icons.send,
                              size: 20,
                              color: Color.fromARGB(255, 247, 176, 194)),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  //实现listview
  Widget _pageDisplay(context) {
    return SizedBox(
      height: 695,
      width: 360,
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 695,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  itemCount: _commentList.length + 3,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return _contentDetials(context);
                    } else if (index == 1) {
                      return _commentBar(context);
                    } else if (index == _commentList.length + 2) {
                      return Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: const [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "- The End -",
                              style: TextStyle(
                                  color: Colors.black26, fontSize: 11),
                            ),
                          ],
                        ),
                      );
                    }
                    //评论内容现实列表
                    return _commentDetials(index - 2);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //帖子详细内容
  Widget _contentDetials(iindex) {
    return Column(
      children: [
        SizedBox(
          //图片设置为轮播图
          width: double.infinity,
          child: AspectRatio(
            // 配置宽高比
            aspectRatio: 1 / 1,
            child: Swiper(
              key: ValueKey(widget.recipeImageList[widget.post_id].length),
              itemBuilder: (BuildContext context, int index) {
                // 配置图片地址
                return Image.network(
                  widget.recipeImageList[widget.post_id][index],
                  fit: BoxFit.contain,
                );
              },
              // 配置图片数量
              itemCount: widget.recipeImageList[widget.post_id].length,
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
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 335,
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 320,
                //文字内容
                child: Text(
                  '''${widget.context}''',
                  style: const TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 14,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 13,
          width: 315,
          child: Text.rich(
            TextSpan(
                text: "发布于  ",
                style: const TextStyle(
                    fontSize: 10,
                    color: Colors.black26,
                    fontWeight: FontWeight.w400),
                children: [
                  //帖子发布时间
                  TextSpan(
                    text: "${widget.time}",
                  )
                ]),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          height: 1,
          width: 310,
          decoration: const BoxDecoration(color: Color.fromARGB(10, 0, 0, 0)),
        ),
      ],
    );
  }

  //发表评论
  Widget _commentBar(index) {
    return Column(
      children: [
        const SizedBox(height: 10),
        SizedBox(
          width: 315,
          child: Text.rich(
            TextSpan(
              text: "共 ",
              style: const TextStyle(
                  fontSize: 11,
                  color: Colors.black38,
                  fontWeight: FontWeight.w400),
              children: [
                //评论数目
                TextSpan(
                    text: "${widget.commentunm + _comnum}",
                    style: const TextStyle(
                        fontSize: 11,
                        color: Colors.black38,
                        fontWeight: FontWeight.w400)),
                const TextSpan(
                    text: " 条评论",
                    style: TextStyle(
                        fontSize: 11,
                        color: Colors.black38,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(width: 20),
            SizedBox(
              //用户头像
              height: 30,
              width: 30,
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                    "http://172.20.10.5/images/${widget.account}.png"),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
              width: 280,
              height: 30,
              child: Container(
                width: 120,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  color: Color.fromARGB(17, 0, 0, 0),
                ),
                //评论框
                child: Form(
                  child: Row(
                    children: [
                      SizedBox(
                        width: 240,
                        height: 30,
                        child: TextButton(
                          style: ButtonStyle(overlayColor:
                              MaterialStateProperty.resolveWith((states) {
                            return Colors.transparent;
                          })),
                          child: Container(
                            width: 235,
                            child: const Text(
                              "爱评论的人运气都不会太差哦",
                              style: TextStyle(
                                  color: Color.fromARGB(121, 43, 46, 51),
                                  fontSize: 11,
                                  fontWeight: FontWeight.w300),
                            ),
                          ),
                          onPressed: () {
                            if (mounted) {
                              setState(() {
                                _inputContext = "";
                              });
                            }
                            SystemChannels.textInput
                                .invokeMethod<void>('TextInput.show');
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20)
      ],
    );
  }

  //查看评论
  Widget _commentDetials(index) {
    return ListTile(
      leading: Container(
        transform: Matrix4.translationValues(0.0, -10, 0.0),
        margin: const EdgeInsets.only(left: 8),
        width: 35,
        height: 35,
        //评论人头像
        child: CircleAvatar(
          backgroundImage: NetworkImage(
              "http://172.20.10.5/images/${_commentList[index]["account"]}.png?$imgKey"),
        ),
      ),
      title: Container(
          //修改leading和title之间的距离
          transform: Matrix4.translationValues(-5, 0.0, 0.0),
          child: Row(
            children: [
              SizedBox(
                width: 265,
                child: Column(
                  children: [
                    Container(
                      // decoration: BoxDecoration(color: Colors.black12),
                      width: 265,
                      height: 20,
                      //评论人用户名
                      child: Text(
                        "${_commentList[index]["name"]}",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 154, 154, 154),
                            fontSize: 12,
                            fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(height: 3),
                    SizedBox(
                      width: 265,
                      //评论内容
                      child: Text(
                        "${_commentList[index]["context"]}",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 56, 56, 56),
                            fontSize: 13,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 240,
                          height: 10,
                          //评论时间
                          child: Text(
                            "${_commentList[index]["date"]}",
                            style: const TextStyle(
                                color: Colors.black26,
                                fontSize: 9,
                                fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          width: 20,
                          height: 20,
                          margin: EdgeInsets.only(bottom: 5),
                          child: IconButton(
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onPressed: () {
                              SystemChannels.textInput
                                  .invokeMethod<void>('TextInput.show');
                              if (mounted) {
                                setState(() {
                                  _inputContext =
                                      "@${_commentList[index]["name"]}  ";
                                });
                              }
                            },
                            icon: const Icon(
                              IconData(
                                0xe60a,
                                fontFamily: "MyIcons",
                              ),
                              color: Color.fromARGB(255, 151, 150, 150),
                              size: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 1,
                      width: 265,
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(10, 0, 0, 0)),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
