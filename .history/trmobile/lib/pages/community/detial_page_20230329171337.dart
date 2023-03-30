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
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.centerLeft,
            colors: [
              Color.fromARGB(255, 253, 183, 200),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [],
        ),
      ),
    );
  }
}
