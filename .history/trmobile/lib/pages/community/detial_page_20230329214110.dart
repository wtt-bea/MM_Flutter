import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/rendering.dart';

class DetialPage extends StatefulWidget {
  final List ImageList;
  const DetialPage({
    super.key,
    required this.ImageList,
  });

  @override
  State<DetialPage> createState() => _DetialPageState();
}

class _DetialPageState extends State<DetialPage> {
  static const loadingTag = "##loading##"; //表尾标记
  var _words = <String>[loadingTag];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: topNavBar(),
        backgroundColor: Color.fromARGB(255, 252, 252, 252),
        elevation: 0,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: ShowContext(),
      ),
    );
  }

  Widget topNavBar() {
    return SizedBox(
      width: double.infinity,
      height: 80,
      child: Row(children: [
        SizedBox(
          //返回
          height: 40,
          width: 25,
          // decoration: const BoxDecoration(
          //     color: Color.fromARGB(255, 64, 249, 255)),
          child: IconButton(
            padding: EdgeInsets.all(0),
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
          width: 5,
        ),
        const SizedBox(
          //头像
          height: 40,
          width: 40,
          // decoration: const BoxDecoration(
          //     color: Color.fromARGB(255, 64, 249, 255)),
          child: CircleAvatar(
            backgroundImage:
                NetworkImage("https://www.itying.com/images/flutter/2.png"),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const SizedBox(
          width: 195,
          child: Text(
            "我的名字yia",
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
          ),
        ),
        SizedBox(
          height: 25,
          width: 50,
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
      ]),
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

  // ignore: non_constant_identifier_names
  Widget ShowContext() {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            //图片设置为轮播图
            width: 340,
            // decoration: const BoxDecoration(
            //     color: Color.fromARGB(255, 131, 255, 64)),
            child: AspectRatio(
              // 配置宽高比
              aspectRatio: 1 / 1,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  // 配置图片地址
                  return Image.asset(
                    widget.ImageList[index],
                    fit: BoxFit.contain,
                  );
                },
                // 配置图片数量
                itemCount: widget.ImageList.length,
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
          //文字
          SizedBox(
            width: 335,
            child: Row(
              children: const [
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  //文章内容
                  width: 320,
                  child: Text(
                    '''轻轻的我走了，
正如我轻轻的来；
我轻轻的招手，
作别西天的云彩。''',
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
            //帖子发布时间
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
          const SizedBox(height: 10),
          //评论数目
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
          //评论bar
          Row(
            children: [
              const SizedBox(width: 25),
              const SizedBox(
                //头像
                height: 30,
                width: 30,
                // decoration: const BoxDecoration(
                //     color: Color.fromARGB(255, 64, 249, 255)),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://www.itying.com/images/flutter/3.png"),
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
                    //输入后字体
                    style: const TextStyle(
                        color: Color.fromARGB(255, 43, 46, 51),
                        fontSize: 12,
                        fontWeight: FontWeight.w300),
                    cursorColor: const Color.fromARGB(255, 43, 46, 51),
                    // cursorRadius: const Radius.circular(5),
                    cursorHeight: 16,
                    // onSaved: (v) => _searchContext = v!,
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 340,
            height: 500,
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
                          child: Column(
                            children: [
                              Container(
                                width: 300,
                                height: 1,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(13, 0, 0, 0)),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                "- The End -",
                                style: TextStyle(
                                    color: Colors.black26, fontSize: 11),
                              ),
                            ],
                          ));
                    }
                  }
                  //社区内容现实列表
                  return Container(
                    decoration: BoxDecoration(color: Colors.black26),
                    child: Row(children: [
                      const SizedBox(
                        //头像
                        height: 20,
                        width: 20,
                        // decoration: const BoxDecoration(
                        //     color: Color.fromARGB(255, 64, 249, 255)),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://www.itying.com/images/flutter/4.png"),
                        ),
                      ),
                    ]),
                  );
                },
                separatorBuilder: (context, index) => const Divider(height: .0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
