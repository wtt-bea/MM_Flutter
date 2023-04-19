import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class NoisePlayer extends StatefulWidget {
  final index;
  const NoisePlayer({super.key, required this.index});

  @override
  State<NoisePlayer> createState() => _NoisePlayerState();
}

class _NoisePlayerState extends State<NoisePlayer>
    with SingleTickerProviderStateMixin {
  final Color _blackColor = const Color.fromARGB(255, 43, 46, 51);
  final Color _whiteColor = Colors.white;
  final Color _pinkColor = const Color.fromARGB(255, 253, 183, 200);

  /// 会重复播放的控制器
  late final AnimationController _repeatController;

  /// 线性动画
  late final Animation<double> _animation;

  var flag = 1;
  var reflag = 1;
  var audioPlayer = AudioPlayer();
  int _index = 0;

  Duration? streamDuration, streamPosition;
  PlayerState? streamState;
  late List<StreamSubscription> streams;

  var duration = null;

  get durationText =>
      streamDuration != null ? streamDuration.toString().substring(2, 7) : '';

  get positionText =>
      streamPosition != null ? streamPosition.toString().substring(2, 7) : '';

  Map musicName = {
    0: "炉火",
    1: "海浪",
    2: "海鸥",
    3: "春日列车",
    4: "林中雨",
    5: "木鱼",
    6: "倾盆大雨",
    7: "大自然",
    8: "泉水",
    9: "吸尘器",
    10: "呦呦鹿鸣",
    11: "云端",
  };

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
    _start();
    _repeatController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    )..repeat(); // 设置动画重复播放
    // 创建一个从0到360弧度的补间动画 v * 2 * π
    _animation = Tween<double>(begin: 0, end: 1).animate(_repeatController);
    //音乐播放
    _play();
    streamState = audioPlayer.state;
    //各种播放流
    audioPlayer.getDuration().then((it) => setState(() => streamDuration = it));
    audioPlayer.getCurrentPosition().then(
          (it) => setState(() => streamPosition = it),
        );
    streams = <StreamSubscription>[
      audioPlayer.onDurationChanged
          .listen((it) => setState(() => streamDuration = it)),
      audioPlayer.onPlayerStateChanged.listen((it) async {
        setState(() => streamState = it);
        if (streamState == PlayerState.completed) {
          if (reflag == 1) {
            if (_index == 11) {
              setState(() {
                _index = 1;
              });
              await audioPlayer.release().then((value) => _play());
            } else {
              setState(() {
                _index = _index + 1;
              });
              await audioPlayer.release().then((value) => _play());
            }
          } else {
            await audioPlayer.release().then((value) => _play());
          }
        }
      }),
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
          _musicBar()
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
                  child: CircleAvatar(
                    backgroundImage:
                        AssetImage("lib/assets/nosie/images/$_index.png"),
                  )),
            )
          ],
        ));
  }

  Widget _musicName() {
    return SizedBox(
      child: Text(
        musicName[_index],
        style: TextStyle(
            color: _whiteColor, fontSize: 30, fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _musicBar() {
    return SizedBox(
      child: Column(
        children: [
          const SizedBox(height: 40),
          //进度条
          SizedBox(
            height: 35,
            child: Row(children: [
              if ((mounted) && (duration != null))
                SizedBox(
                  height: 50,
                  width: 360,
                  child: Slider(
                      activeColor: _pinkColor,
                      inactiveColor: _whiteColor,
                      value: streamPosition?.inMilliseconds.toDouble() ?? 0.0,
                      onChanged: (v) {
                        final position = v.roundToDouble();
                        audioPlayer
                            .seek(Duration(milliseconds: position.round()));
                      },
                      min: 0.0,
                      max: duration.inMilliseconds.toDouble()),
                ),
            ]),
          ),
          //音乐时间
          Row(
            children: [
              const SizedBox(width: 20),
              SizedBox(
                child: Text(
                  positionText != "" ? "${positionText}" : "0:00:00",
                  style: TextStyle(fontSize: 10, color: _whiteColor),
                ),
              ),
              const SizedBox(width: 270),
              SizedBox(
                child: Text(
                  durationText != "" ? "${durationText}" : "0:00:00",
                  style: TextStyle(fontSize: 10, color: _whiteColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 90),
          Row(children: [
            const SizedBox(width: 15),
            //循环按钮
            SizedBox(
              height: 40,
              width: 40,
              child: IconButton(
                onPressed: () {
                  if (reflag == 1) {
                    setState(() {
                      reflag = 0;
                    });
                  } else {
                    setState(() {
                      reflag = 1;
                    });
                  }
                },
                icon: reflag == 1
                    ? Icon(Icons.repeat_rounded, size: 25, color: _whiteColor)
                    : Icon(Icons.repeat_one_rounded,
                        size: 25, color: _whiteColor),
              ),
            ),
            const SizedBox(width: 15),
            //上一首
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
                onPressed: () async {
                  if (_index != 0) {
                    setState(() {
                      _index = _index - 1;
                    });
                    await audioPlayer.release().then((value) => _play());
                  } else {
                    setState(() {
                      _index = 11;
                    });
                    await audioPlayer.release().then((value) => _play());
                  }
                },
                icon: Icon(Icons.skip_previous_rounded,
                    size: 28, color: _whiteColor),
              ),
            ),
            const SizedBox(width: 35),
            //暂停
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
                    setState(() {
                      flag = 0;
                    });
                  } else {
                    audioPlayer.resume();
                    _repeatController.repeat();
                    setState(() {
                      flag = 1;
                    });
                  }
                },
                icon: flag == 1
                    ? Icon(Icons.pause_rounded, size: 35, color: _whiteColor)
                    : Icon(Icons.play_arrow_rounded,
                        size: 35, color: _whiteColor),
              ),
            ),
            const SizedBox(width: 35),
            //下一首
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
                onPressed: () async {
                  if (_index == 11) {
                    setState(() {
                      _index = 0;
                    });
                    await audioPlayer.release().then((value) => _play());
                  } else {
                    setState(() {
                      _index = _index + 1;
                    });
                    await audioPlayer.release().then((value) => _play());
                  }
                },
                icon:
                    Icon(Icons.skip_next_rounded, size: 28, color: _whiteColor),
              ),
            )
          ]),
        ],
      ),
    );
  }

  _start() {
    setState(() {
      _index = widget.index;
    });
  }

  _play() async {
    audioPlayer.audioCache.prefix = 'lib/assets/nosie/music/';
    await audioPlayer.play(AssetSource('$_index.mp3'));
    await audioPlayer.getDuration().then((value) => setState(() {
          duration = value;
        }));
    ;
  }
}
