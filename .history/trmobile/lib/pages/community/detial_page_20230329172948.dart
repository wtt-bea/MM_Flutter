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

  Widget ShowContext() {
    return Expanded(
        child: Column(
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(
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
        )
      ],
    ));
  }

  Widget PublishComment() {
    return Center();
  }

  Widget ShowComment() {
    return Center();
  }
}
