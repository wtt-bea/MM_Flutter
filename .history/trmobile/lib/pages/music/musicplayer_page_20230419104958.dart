import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

enum PlayerState { stopped, playing, paused }

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
  var duration = null;
  var position = null;

  late StreamSubscription _positionSubscription;
  late StreamSubscription _audioPlayerStateSubscription;
  @override
  void dispose() {
    _positionSubscription.cancel();
    _audioPlayerStateSubscription.cancel();
    audioPlayer.stop();
    _repeatController.dispose();
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

  Widget _musicBtn() => SizedBox(
          child: Column(
        children: [
          Row(children: [
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
                icon: Icon(Icons.skip_previous_rounded,
                    size: 28, color: _whiteColor),
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
                onPressed: () async {
                  if (flag == 1) {
                    audioPlayer.pause();
                    _repeatController.stop();
                    var _position = await audioPlayer.getCurrentPosition();
                    setState(() {
                      flag = 0;
                      position = _position;
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
                icon:
                    Icon(Icons.skip_next_rounded, size: 28, color: _whiteColor),
              ),
            )
          ]),
          if (duration != null)
            Slider(
                value: position?.inMilliseconds?.toDouble() ?? 0.0,
                onChanged: (double value) {
                  // return audioPlayer.seek((value / 1000).roundToDouble());
                },
                min: 0.0,
                max: duration.inMilliseconds.toDouble()),
        ],
      ));

  _play() async {
    audioPlayer.audioCache.prefix = 'lib/assets/';
    await audioPlayer.play(AssetSource('nop.mp3'));
    var _duration = await audioPlayer.getDuration();
    setState(() {
      duration = _duration;
      print("我的妈呀$duration");
    });
  }

  // Widget _buildPlayer() => Container(
  //       padding: EdgeInsets.all(16.0),
  //       child: Column(
  //         mainAxisSize: MainAxisSize.min,
  //         children: [
  //           Row(mainAxisSize: MainAxisSize.min, children: [
  //             IconButton(
  //               onPressed: isPlaying ? null : () => play(),
  //               iconSize: 64.0,
  //               icon: Icon(Icons.play_arrow),
  //               color: Colors.cyan,
  //             ),
  //             IconButton(
  //               onPressed: isPlaying ? () => pause() : null,
  //               iconSize: 64.0,
  //               icon: Icon(Icons.pause),
  //               color: Colors.cyan,
  //             ),
  //             IconButton(
  //               onPressed: isPlaying || isPaused ? () => stop() : null,
  //               iconSize: 64.0,
  //               icon: Icon(Icons.stop),
  //               color: Colors.cyan,
  //             ),
  //           ]),
  //           if (duration != null)
  //             Slider(
  //                 value: position?.inMilliseconds?.toDouble() ?? 0.0,
  //                 onChanged: (double value) {
  //                   return audioPlayer.seek((value / 1000).roundToDouble());
  //                 },
  //                 min: 0.0,
  //                 max: duration.inMilliseconds.toDouble()),
  //           if (position != null) _buildMuteButtons(),
  //           if (position != null) _buildProgressView()
  //         ],
  //       ),
  //     );

  // Row _buildProgressView() => Row(mainAxisSize: MainAxisSize.min, children: [
  //       Padding(
  //         padding: EdgeInsets.all(12.0),
  //         child: CircularProgressIndicator(
  //           value: position != null && position.inMilliseconds > 0
  //               ? (position?.inMilliseconds?.toDouble() ?? 0.0) /
  //                   (duration?.inMilliseconds?.toDouble() ?? 0.0)
  //               : 0.0,
  //           valueColor: AlwaysStoppedAnimation(Colors.cyan),
  //           backgroundColor: Colors.grey.shade400,
  //         ),
  //       ),
  //       Text(
  //         position != null
  //             ? "${positionText ?? ''} / ${durationText ?? ''}"
  //             : duration != null
  //                 ? durationText
  //                 : '',
  //         style: TextStyle(fontSize: 24.0),
  //       )
  //     ]);

  // Row _buildMuteButtons() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //     children: <Widget>[
  //       if (!isMuted)
  //         FlatButton.icon(
  //           onPressed: () => mute(true),
  //           icon: Icon(
  //             Icons.headset_off,
  //             color: Colors.cyan,
  //           ),
  //           label: Text('Mute', style: TextStyle(color: Colors.cyan)),
  //         ),
  //       if (isMuted)
  //         FlatButton.icon(
  //           onPressed: () => mute(false),
  //           icon: Icon(Icons.headset, color: Colors.cyan),
  //           label: Text('Unmute', style: TextStyle(color: Colors.cyan)),
  //         ),
  //     ],
  //   );
  // }
}
