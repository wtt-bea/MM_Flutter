import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            topNavBar(),
            ShowContext(),
          ],
        ),
      ),
    );
  }

  Widget topNavBar() {
    return Container(
      width: double.infinity,
      height: 80,
      decoration: const BoxDecoration(color: Colors.black45),
    );
  }

  // ignore: non_constant_identifier_names
  Widget ShowContext() {
    return SingleChildScrollView(
      child: IntrinsicHeight(
          child: Expanded(
        flex: 1,
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
                      fit: BoxFit.fill,
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
            //文字
            Container(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 130, 113, 117)),
              width: 335,
              child: Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    //文章内容
                    width: 320,
                    // height: 40,
                    // decoration: const BoxDecoration(
                    //     color: Color.fromARGB(255, 255, 131, 64)),
                    child: Text(
                      "今天发现了超多好玩的东啊骄傲地阿萨的交接第三今天发现了超多好玩的东西啊啊啊啊啊啊啊啊骄傲地阿萨的交接第三今天发现了超多好玩的东西啊啊啊啊啊啊啊啊骄傲地阿萨的交接第三",
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
            Container(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 130, 113, 117)),
              //帖子发布时间
              height: 13,
              width: 315,
              child: Text(
                "发布于 2022/11/22  23:09",
                style: TextStyle(fontSize: 11, color: Colors.grey),
              ),
            ),
            Container(
              height: 2,
              width: 340,
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 253, 183, 200)),
            ),
            Container(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 130, 113, 117)),
              width: 335,
              child: Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    //文章内容
                    width: 320,
                    // height: 40,
                    // decoration: const BoxDecoration(
                    //     color: Color.fromARGB(255, 255, 131, 64)),
                    child: Text(
                      "今天发现了超多好玩的东啊骄傲地阿萨的交接第三今天发现了超多好玩的东西啊啊啊啊啊啊啊啊骄傲地阿萨的交接第三今天发现了超多好玩的东西啊啊啊啊啊啊啊啊骄傲地阿萨的交接第三",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 130, 113, 117)),
              width: 335,
              child: Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 130, 113, 117)),
              width: 335,
              child: Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    //文章内容
                    width: 320,
                    // height: 40,
                    // decoration: const BoxDecoration(
                    //     color: Color.fromARGB(255, 255, 131, 64)),
                    child: Text(
                      "今天发现了超多好玩的东啊骄傲地阿萨的交接第三今天发现了超多好玩的东西啊啊啊啊啊啊啊啊骄傲地阿萨的交接第三今天发现了超多好玩的东西啊啊啊啊啊啊啊啊骄傲地阿萨的交接第三",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 130, 113, 117)),
              width: 335,
              child: Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    //文章内容
                    width: 320,
                    // height: 40,
                    // decoration: const BoxDecoration(
                    //     color: Color.fromARGB(255, 255, 131, 64)),
                    child: Text(
                      "今天发现了超多好玩的东啊骄傲地阿萨的交接第三今天发现了超多好玩的东西啊啊啊啊啊啊啊啊骄傲地阿萨的交接第三今天发现了超多好玩的东西啊啊啊啊啊啊啊啊骄傲地阿萨的交接第三",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 130, 113, 117)),
              width: 335,
              child: Row(
                children: const [
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    //文章内容
                    width: 320,
                    // height: 40,
                    // decoration: const BoxDecoration(
                    //     color: Color.fromARGB(255, 255, 131, 64)),
                    child: Text(
                      "今天发现了超多好玩的东啊骄傲地阿萨的交接第三今天发现了超多好玩的东西啊啊啊啊啊啊啊啊骄傲地阿萨的交接第三今天发现了超多好玩的东西啊啊啊啊啊啊啊啊骄傲地阿萨的交接第三",
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 14,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
