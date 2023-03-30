import 'package:flutter/material.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_swiper/flutter_swiper.dart';
// ignore: depend_on_referenced_packages
import 'package:english_words/english_words.dart';

class DetialPage extends StatefulWidget {
  final List recipeImageList; //传来的图片
  const DetialPage({
    super.key,
    required this.recipeImageList,
  });

  @override
  State<DetialPage> createState() => _DetialPageState();
}

class _DetialPageState extends State<DetialPage> {
  static const loadingTag = "##loading##"; //表尾标记
  final _words = <String>[loadingTag];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 15),
            _topNavBar(context),
            _pageDisplay(context),
          ],
        ),
      ),
    );
  }

  void _retrieveData() {
    Future.delayed(const Duration(seconds: 2)).then((e) {
      if (mounted) {
        setState(() {
          //重新构建列表
          _words.insertAll(
            _words.length - 1,
            //每次生成20个单词
            generateWordPairs().take(2).map((e) => e.asPascalCase).toList(),
          );
        });
      }
    });
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
                Navigator.of(context).pop();
              },
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const SizedBox(
            height: 40,
            width: 40,
            //发帖人头像
            child: CircleAvatar(
              backgroundImage:
                  NetworkImage("https://www.itying.com/images/flutter/2.png"),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const SizedBox(
            width: 210,
            //用户名
            child: Text(
              "我的名字yia",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 25,
            width: 50,
            //关注按钮
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.only(bottom: 2),
                side: const BorderSide(
                    width: 1.0, color: Color.fromARGB(255, 253, 183, 200)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () {},
              child: const Text(
                "关注",
                style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 253, 183, 200)),
              ),
            ),
          )
        ],
      ),
    );
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
                  itemCount: _words.length + 2,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return _contentDetials(context);
                    } else if (index == 1) {
                      return _commentBar(context);
                    } else if (_words[index - 2] == loadingTag) {
                      if (_words.length - 1 < 4) {
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
                    }
                    //评论内容现实列表
                    return _commentDetials(context);
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
  Widget _contentDetials(context) {
    return Column(
      children: [
        SizedBox(
          //图片设置为轮播图
          width: double.infinity,
          child: AspectRatio(
            // 配置宽高比
            aspectRatio: 1 / 1,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                // 配置图片地址
                return Image.asset(
                  widget.recipeImageList[index],
                  fit: BoxFit.contain,
                );
              },
              // 配置图片数量
              itemCount: widget.recipeImageList.length,
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
            children: const [
              SizedBox(
                width: 10,
              ),
              SizedBox(
                width: 320,
                //文字内容
                child: Text(
                  '''轻轻的我走了，
                  zhengjiavj
                  asjidjai
                  jajdio
                  cascas''',
                  style: TextStyle(
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
        const SizedBox(
          height: 13,
          width: 315,
          child: Text.rich(
            TextSpan(
                text: "发布于  ",
                style: TextStyle(
                    fontSize: 10,
                    color: Colors.black26,
                    fontWeight: FontWeight.w400),
                children: [
                  //帖子发布时间
                  TextSpan(
                    text: "2022/11/22  23:09",
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
  Widget _commentBar(context) {
    return Column(
      children: [
        const SizedBox(height: 10),
        const SizedBox(
          width: 315,
          child: Text.rich(
            TextSpan(
              text: "共 ",
              style: TextStyle(
                  fontSize: 11,
                  color: Colors.black38,
                  fontWeight: FontWeight.w400),
              children: [
                //评论数目
                TextSpan(
                    text: "10",
                    style: TextStyle(
                        fontSize: 11,
                        color: Colors.black38,
                        fontWeight: FontWeight.w400)),
                TextSpan(
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
            const SizedBox(width: 25),
            const SizedBox(
              //用户头像
              height: 30,
              width: 30,
              child: CircleAvatar(
                backgroundImage:
                    NetworkImage("https://www.itying.com/images/flutter/3.png"),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Container(
              width: 270,
              height: 30,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
                color: Color.fromARGB(17, 0, 0, 0),
              ),
              child: SizedBox(
                width: 260,
                height: 30,
                //评论框
                child: TextFormField(
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.only(left: 10, bottom: 15),
                    border: InputBorder.none,
                    hintText: '爱评论的人运气都不会太差',
                    hintStyle: TextStyle(
                        color: Color.fromARGB(146, 53, 53, 53),
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                  ),
                  style: const TextStyle(
                      color: Color.fromARGB(255, 43, 46, 51),
                      fontSize: 12,
                      fontWeight: FontWeight.w300),
                  cursorColor: const Color.fromARGB(255, 43, 46, 51),
                  cursorHeight: 16,
                  // onSaved: (v) => _searchContext = v!,
                ),
              ),
            )
          ],
        ),
        const SizedBox(height: 20)
      ],
    );
  }

  //查看评论
  Widget _commentDetials(context) {
    return ListTile(
      leading: Container(
        transform: Matrix4.translationValues(0.0, -10, 0.0),
        margin: const EdgeInsets.only(left: 8),
        width: 32,
        height: 32,
        //评论人头像
        child: const CircleAvatar(
          backgroundImage:
              NetworkImage("https://www.itying.com/images/flutter/4.png"),
        ),
      ),
      title: Container(
        //修改leading和title之间的距离
        transform: Matrix4.translationValues(-5, 0.0, 0.0),
        child: Column(
          children: [
            const SizedBox(
              width: 270,
              //评论人用户名
              child: Text(
                "ni的名字yia",
                style: TextStyle(
                    color: Color.fromARGB(255, 154, 154, 154),
                    fontSize: 12,
                    fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(height: 3),
            const SizedBox(
              width: 270,
              //评论内容
              child: Text(
                "能不能告诉我 30,width:",
                style: TextStyle(
                    color: Color.fromARGB(255, 56, 56, 56),
                    fontSize: 13,
                    fontWeight: FontWeight.w400),
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(
              width: 270,
              //评论时间
              child: Text(
                "2022/12/2 18:00",
                style: TextStyle(
                    color: Colors.black26,
                    fontSize: 9,
                    fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(height: 5),
            Container(
              height: 1,
              width: 270,
              decoration:
                  const BoxDecoration(color: Color.fromARGB(10, 0, 0, 0)),
            )
          ],
        ),
      ),
    );
  }
}
