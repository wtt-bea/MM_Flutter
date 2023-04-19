import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class MusicPlayer extends StatefulWidget {
  final index;
  const MusicPlayer({super.key, required this.index});

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
    0: "Journey",
    1: "Komorebi",
    2: "Time to love",
    3: "Quiet",
    4: "Merry Christmas",
    5: "Shelter",
    6: "nop",
    7: "Windy Hill",
    8: "City of sky(Piano)",
    9: "Wind lives(Erhu)",
    10: "Tenten's Theme",
    11: "Eternity in Moments",
    12: "Tide chirping"
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
      audioPlayer.onPlayerStateChanged.listen((it) {
        setState(() => streamState = it);
        if (streamState == PlayerState.completed) {
          // dispose();
          if (reflag == 1) {
            if (_index == 12) {
              setState(() {
                _index = 1;
              });
              audioPlayer.stop();
              _play();
            } else {
              setState(() {
                _index = _index + 1;
              });
              audioPlayer.stop();
              _play();
            }
          } else {
            setState(() {
              _index = _index;
            });
            _play();
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
                onPressed: () {
                  if (_index != 0) {
                    print("上一首不为零$_index");
                    setState(() {
                      _index = _index - 1;
                    });
                    audioPlayer.release();
                    _play();
                  } else {
                    print("上一首为零$_index");
                    setState(() {
                      _index = 12;
                    });
                    audioPlayer.release();
                    _play();
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
                onPressed: () {
                  if (_index == 12) {
                    print("下一首为十二$_index");
                    setState(() {
                      _index = 0;
                    });
                    audioPlayer.release();
                    _play();
                  } else {
                    print("下一首不为十二$_index");
                    setState(() {
                      _index = _index + 1;
                    });
                    audioPlayer.release();
                    _play();
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
    print("——play中的index$_index");
    audioPlayer.audioCache.prefix = 'lib/assets/';
    await audioPlayer.play(AssetSource('${_index}.mp3'));
    var time = await audioPlayer.getDuration();
    if (time) {
      setState(() {
        duration = time;
      });
    }
    ;
  }
}
