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
            height: 2,
            width: 340,
            decoration: BoxDecoration(color: Colors.black12),
          )
        ],
      ),
    );
  }
}
