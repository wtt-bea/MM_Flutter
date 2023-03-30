import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class DetialPage extends StatefulWidget {
  final List imageList;
  const DetialPage({
    super.key,
    required this.imageList,
  });

  @override
  State<DetialPage> createState() => _DetialPageState(required this.imageList);
}

class _DetialPageState extends State<DetialPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
  }
}
