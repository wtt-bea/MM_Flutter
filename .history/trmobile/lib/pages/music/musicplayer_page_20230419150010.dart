import 'dart:async';

import 'package:flutter/foundation.dart';
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

  var flag = 1;
  var audioPlayer = AudioPlayer();

  Duration? streamDuration, streamPosition;
  PlayerState? streamState;
  late List<StreamSubscription> streams;

  var duration = null;

  get durationText =>
      streamDuration != null ? streamDuration.toString().split('.').first : '';

  get positionText =>
      streamPosition != null ? streamPosition.toString().split('.').first : '';

  @override
  void dispose() {
    audioPlayer.stop();
    _repeatController.dispose();
    streams.forEach((it) => it.cancel());
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _repeatController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(); // 设置动画重复播放
    // 创建一个从0到360弧度的补间动画 v * 2 * π
    _animation = Tween<double>(begin: 0, end: 1).animate(_repeatController);
    _play();
    streamState = audioPlayer.state;
    audioPlayer.getDuration().then((it) => setState(() => streamDuration = it));
    audioPlayer.getCurrentPosition().then(
          (it) => setState(() => streamPosition = it),
        );
    streams = <StreamSubscription>[
      audioPlayer.onDurationChanged
          .listen((it) => setState(() => streamDuration = it)),
      audioPlayer.onPlayerStateChanged
          .listen((it) => setState(() => streamState = it)),
      audioPlayer.onPositionChanged
          .listen((it) => setState(() => streamPosition = it)),
    ];
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
                size: 25, color: _whiteColor),
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
      child: Column(
        children: [
          const SizedBox(height: 50),
          SizedBox(
            height: 50,
            child: Row(children: [
              const SizedBox(
                width: 5,
              ),
              if (streamDuration != null)
                SizedBox(
                  height: 50,
                  width: 355,
                  child: Slider(
                      value: streamPosition?.inMilliseconds?.toDouble() ?? 0.0,
                      onChanged: (double value) {
                        // audioPlayer.seek(value);
                      },
                      min: 0.0,
                      max: streamDuration.inMilliseconds?.toDouble()),
                ),
            ]),
          ),
          // if (position != null)
          Row(
            children: [
              const SizedBox(width: 23),
              SizedBox(
                child: Text(
                  positionText != "" ? "${positionText}" : "00:00",
                  style: TextStyle(fontSize: 10, color: _whiteColor),
                ),
              ),
              const SizedBox(width: 263),
              SizedBox(
                child: Text(
                  durationText != "" ? "${durationText}" : "00:00",
                  style: TextStyle(fontSize: 10, color: _whiteColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Row(children: [
            const SizedBox(width: 65),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: _pinkColor,
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(2.0, 3.0),
                    blurRadius: 8,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.skip_previous_rounded,
                    size: 28, color: _whiteColor),
              ),
            ),
            const SizedBox(width: 35),
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: _pinkColor,
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(2.0, 3.0),
                    blurRadius: 8,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: IconButton(
                onPressed: () async {
                  if (flag == 1) {
                    audioPlayer.pause();
                    _repeatController.stop();
                    // var _position = await audioPlayer.getCurrentPosition();
                    // String _positionText = _position.toString().substring(2, 7);
                    setState(() {
                      flag = 0;
                      // position = _position;
                      // positionText = _positionText;
                    });
                  } else {
                    audioPlayer.resume();
                    _repeatController.repeat();
                    setState(() {
                      flag = 1;
                    });
                  }
                },
                icon: Icon(Icons.pause_rounded, size: 28, color: _whiteColor),
              ),
            ),
            const SizedBox(width: 35),
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: _pinkColor,
                borderRadius: const BorderRadius.all(Radius.circular(50)),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    offset: Offset(2.0, 3.0),
                    blurRadius: 8,
                    spreadRadius: 2,
                  )
                ],
              ),
              child: IconButton(
                onPressed: () {},
                icon:
                    Icon(Icons.skip_next_rounded, size: 28, color: _whiteColor),
              ),
            )
          ]),
        ],
      ),
    );
  }

  _play() async {
    audioPlayer.audioCache.prefix = 'lib/assets/';
    await audioPlayer.play(AssetSource('nop.mp3'));
    var _duration = await audioPlayer.getDuration();
    // String _durationText = _duration.toString().substring(2, 7);
    setState(() {
      duration = _duration;
      // durationText = _durationText;
      // print("我的妈呀$duration");
    });
  }
}
