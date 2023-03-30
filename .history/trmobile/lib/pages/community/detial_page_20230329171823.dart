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
          children: [],
        ),
      ),
    );
  }

  Widget topNavBar() {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: const BoxDecoration(color: Colors.black45),
    );
  }

  Widget ConText() {
    return Center();
  }

  Widget PublishComment() {
    return Center();
  }

  Widget ShowComment() {
    return Center();
  }
}
