import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../net/NetRequester.dart';
import '../../net/TtApi.dart';
import 'home_page.dart';
import '../community/community_page.dart';
import 'infochange_page.dart';
import 'clock_page.dart';
import '../music/music_page.dart';
import '../letter/letter_page.dart';

class RemindPage extends StatefulWidget {
  final account;
  const RemindPage({
    super.key,
    required this.account,
  });

  @override
  State<RemindPage> createState() => _RemindPageState();
}

class _RemindPageState extends State<RemindPage> {
  final Color _blackColor = const Color.fromARGB(255, 43, 46, 51);
  final Color _whiteColor = Colors.white;
  final Color _pinkColor = const Color.fromARGB(255, 253, 183, 200);
  List _todoList = [];
  final GlobalKey _formKey = GlobalKey<FormState>();
  var _context = "";
  TextEditingController _textcontroller = TextEditingController();
  bool keyboard = false; //键盘的弹起、收回状态
  @override
  initState() {
    super.initState();
    _retrieveData();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        // MediaQuery.of(context).viewInsets.bottom大于0就是代表键盘弹起，0位收回
        keyboard = MediaQuery.of(context).viewInsets.bottom > 0;
      });
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
              _remindView(context),
              _bottomNav(context),
              _bottomInput(context),
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

  //信息更改按钮
  Widget _infoChange(context) {
    return Container(
      height: 35,
      width: 130,
      margin: EdgeInsets.only(right: 260),
      decoration: BoxDecoration(
        color: Color.fromARGB(40, 255, 255, 255),
        border: Border.all(color: _whiteColor, width: 2), // border
        borderRadius: BorderRadius.horizontal(right: Radius.circular(5)),
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
                      )));
        },
      ),
    );
  }

  //事项提醒按钮
  Widget _itemRemind(context) {
    return Container(
      height: 35,
      width: 130,
      margin: EdgeInsets.only(right: 240),
      decoration: BoxDecoration(
        color: Color.fromARGB(40, 255, 255, 255),
        border: Border.all(color: _pinkColor, width: 2), // border
        borderRadius: BorderRadius.horizontal(right: Radius.circular(5)),
      ),
      child: TextButton(
        child: Text(
          "事项提醒",
          style: TextStyle(
              color: _pinkColor, fontWeight: FontWeight.w400, fontSize: 13),
        ),
        onPressed: () {},
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
                      )));
        },
      ),
    );
  }

  //事项提醒
  Widget _remindView(context) {
    return Container(
      height: 550,
      width: 340,
      decoration: BoxDecoration(
        color: const Color.fromARGB(230, 255, 255, 255),
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
            const SizedBox(height: 20),
            SizedBox(
              height: 455,
              width: 300,
              child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: ListView.builder(
                  itemCount: _todoList.length + 1,
                  itemBuilder: (context, index) {
                    if (_todoList == []) {
                      return Container(
                        padding: const EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: const SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: CircularProgressIndicator(strokeWidth: 2.0),
                        ),
                      );
                    } else if (index == _todoList.length) {
                      return Container(
                        height: 50,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: _blackColor, width: 3), // border
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                        ),
                        child: IconButton(
                          onPressed: () {
                            SystemChannels.textInput
                                .invokeMethod<void>('TextInput.show');
                          },
                          icon: const Icon(
                            Icons.add,
                            size: 22,
                            color: Color.fromARGB(103, 0, 0, 0),
                          ),
                        ),
                      );
                    } else {
                      return _todoListdisplay(index);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _todoListdisplay(index) {
    return SizedBox(
      height: 60,
      child: Column(children: [
        _todoListShow(index),
        const SizedBox(height: 10),
      ]),
    );
  }

  //事项框
  Widget _todoListShow(index) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: _blackColor, width: 3), // border
        borderRadius: const BorderRadius.all(Radius.circular(5)),
      ),
      child: Row(
        children: [
          SizedBox(
            child: Checkbox(
              value: _todoList[index]["finish"] == 1 ? true : false,
              onChanged: (value) {
                if (_todoList[index]["finish"] == 0) {
                  setState(() {
                    _todoList[index]["finish"] = 1;
                    _finishData(index);
                  });
                }
              },
            ),
          ),
          SizedBox(
            width: 200,
            child: Text(
              "${_todoList[index]['context']}",
              style: _todoList[index]["finish"] == 0
                  ? TextStyle(color: _blackColor)
                  : const TextStyle(
                      color: Color.fromARGB(103, 0, 0, 0),
                      decoration: TextDecoration.lineThrough,
                      overflow: TextOverflow.ellipsis,
                    ),
              maxLines: 1,
            ),
          ),
          Container(
              width: 35,
              child: IconButton(
                icon: const Icon(
                  Icons.delete,
                  size: 19,
                  color: Color.fromARGB(103, 0, 0, 0),
                ),
                onPressed: () {
                  _deleteData(index);
                },
              )),
        ],
      ),
    );
  }

  //获取个人所有事项
  void _retrieveData() async {
    var result = await NetRequester.request(Apis.queryTodo(widget.account));
    print("_retrieveData${result['data']}");
    if (mounted) {
      setState(() {
        _todoList = result["data"];
      });
    }
  }

  //改变finish状态
  void _finishData(index) async {
    var result = await NetRequester.request(
        Apis.updateTodo(_todoList[index]["list_id"]));
    print("_finishData$result");
  }

  //删除todolist
  void _deleteData(index) async {
    var result = await NetRequester.request(
        Apis.deleteTodo(_todoList[index]["list_id"]));
    _retrieveData();
  }

  //新增todolist
  void _addData() async {
    var result =
        await NetRequester.request(Apis.insertTodo(widget.account, _context));
    print("_adddata$result");
    _retrieveData();
  }

  Widget _bottomInput(context) {
    double height = MediaQuery.of(context).padding.bottom;
    return Offstage(
      offstage: !keyboard,
      child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Container(
                height: 1,
                decoration:
                    BoxDecoration(color: Color.fromARGB(255, 233, 233, 233)),
                padding: EdgeInsets.only(bottom: height),
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
                              border: Border.all(
                                  width: 0.5, color: Colors.black38)),
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
                              decoration: const InputDecoration(
                                //设置提示内容，字体颜色、大小等
                                border: InputBorder.none,
                                hintText: "请输入提醒事项",
                                hintStyle: const TextStyle(
                                  fontSize: 13,
                                  color: Colors.black26,
                                ),
                              ),
                              cursorHeight: 17,
                              cursorColor:
                                  const Color.fromARGB(255, 43, 46, 51),
                              onChanged: (text) {
                                // 获取时时输入框的内容
                                _context = text;
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
                              if (_context != "") {
                                SystemChannels.textInput
                                    .invokeMethod<void>('TextInput.hide');
                                _addData();
                                if (mounted) {
                                  setState(() {
                                    _textcontroller.clear();
                                    _context = "";
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
          )),
    );
  }
}
