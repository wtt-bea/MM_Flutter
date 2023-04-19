import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPlayer extends StatefulWidget {
  final musicName;
  const MusicPlayer({super.key, required this.musicName});

  @override
  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer>
    with SingleTickerProviderStateMixin {
  final Color _blackColor = const Color.fromARGB(255, 43, 46, 51);
  final Color _whiteColor = Colors.white;
  final Color _pinkColor = const Color.fromARGB(255, 253, 183, 200);

  /// 会重复播放的控制器
  late final AnimationController _repeatController;

  /// 线性动画
  late final Animation<double> _animation;
  var url = "../../assets/music/easy/Journey.mp3";
  AudioCache audioCache = AudioCache();
  AudioPlayer audioPlayer = AudioPlayer(); //播放器对象

  Duration duration = Duration(); //Duration对象代表音乐时长
  Duration position = Duration(); //Duration对象代表音乐播放时长
  bool playing = false; //bool对象-标记音乐是否在播放
  @override
  void initState() {
    super.initState();

    /// 动画持续时间是 3秒，此处的this指 TickerProviderStateMixin
    _repeatController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(); // 设置动画重复播放
    // 创建一个从0到360弧度的补间动画 v * 2 * π
    _animation = Tween<double>(begin: 0, end: 1).animate(_repeatController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: _blackColor),
        child: Column(children: [
          const SizedBox(height: 25),
          _topBackBar(),
          const SizedBox(height: 50),
          _rotationTransition(),
          const SizedBox(height: 40),
          _musicName(),
          _musicBtn()
        ]),
      ),
    );
  }

  Widget _topBackBar() {
    return SizedBox(
      child: Row(
        children: [
          const SizedBox(width: 5),
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(const IconData(0xe8ef, fontFamily: "MyIcons"),
                size: 25, color: _pinkColor),
          )
        ],
      ),
    );
  }

  Widget _rotationTransition() {
    return SizedBox(
        height: 220,
        width: 220,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 220,
              width: 220,
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(150)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    offset: Offset(0.0, 4.0),
                    blurRadius: 10,
                    spreadRadius: 2,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 140,
              width: 140,
              child: RotationTransition(
                  turns: _animation,
                  child: const CircleAvatar(
                    backgroundImage: AssetImage("lib/assets/images/clock.png"),
                  )),
            )
          ],
        ));
  }

  Widget _musicName() {
    return SizedBox(
      child: Text(
        "大海",
        style: TextStyle(
            color: _whiteColor, fontSize: 30, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _musicBtn() {
    return SizedBox(
      child: Row(children: [
        const SizedBox(width: 85),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: _pinkColor,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(0.0, 4.0),
                blurRadius: 5,
                spreadRadius: 2,
              )
            ],
          ),
          child: IconButton(
            onPressed: () {},
            icon:
                Icon(Icons.skip_previous_rounded, size: 28, color: _whiteColor),
          ),
        ),
        const SizedBox(width: 20),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: _pinkColor,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(0.0, 4.0),
                blurRadius: 5,
                spreadRadius: 2,
              )
            ],
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.pause_rounded, size: 28, color: _whiteColor),
          ),
        ),
        const SizedBox(width: 20),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: _pinkColor,
            borderRadius: const BorderRadius.all(Radius.circular(50)),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                offset: Offset(0.0, 4.0),
                blurRadius: 5,
                spreadRadius: 2,
              )
            ],
          ),
          child: IconButton(
            onPressed: () {},
            icon: Icon(Icons.skip_next_rounded, size: 28, color: _whiteColor),
          ),
        )
      ]),
    );
  }

  // void initPlayer() {
  //   audioPlayer = new AudioPlayer();

  //   audioPlayer.durationHandler = (d) => setState(() {
  //         duration = d;
  //       });

  //   audioPlayer.positionHandler = (p) => setState(() {
  //         position = p;
  //       });
  // }
  playLocal() {
    audioCache.fixedPlayer = advancedPlayer;
    audioCache.play('yequ.mp3');
  }

  platStop() {
    audioPlayer.stop();
  }
}
