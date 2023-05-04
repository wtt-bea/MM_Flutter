import 'package:flutter/material.dart';
import '../../net/NetRequester.dart';
import '../../net/TtApi.dart';
import 'gamePanel.dart';

class GamePage extends StatefulWidget {
  final account;
  const GamePage({super.key, required this.account});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  final GlobalKey _gamePanelKey = GlobalKey<Game2048PanelState>();
  @override
  initState() {
    super.initState();
    _getScore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
          padding: const EdgeInsets.only(top: 30),
          color: const Color.fromARGB(255, 235, 230, 220),
          child: Column(
            children: [
              Row(
                children: [
                  _topBackBar(),
                ],
              ),
              Flexible(child: gameHeader()),
              Flexible(
                  flex: 2,
                  child: Game2048Panel(
                    key: _gamePanelKey,
                    onScoreChanged: (score) async {
                      setState(() {
                        currentScore = score;
                        if (currentScore > highestScore) {
                          highestScore = currentScore;
                        }
                      });
                      await NetRequester.request(
                          Apis.updateScore(widget.account, highestScore));
                    },
                  ))
            ],
          )),
    );
  }

  /// 当前分数
  int currentScore = 0;

  /// 历史最高分
  int highestScore = 0;

  //返回按钮
  Widget _topBackBar() {
    return SizedBox(
      width: 48,
      child: Row(
        children: [
          IconButton(
            onPressed: () async {
              await NetRequester.request(
                  Apis.addPoint(widget.account, highestScore));
              Navigator.pop(context);
            },
            icon: const Icon(const IconData(0xe8ef, fontFamily: "MyIcons"),
                size: 25, color: Colors.black),
          )
        ],
      ),
    );
  }

  Widget gameHeader() {
    return Row(children: [
      const SizedBox(
        width: 20,
      ),
      Column(
        children: const [
          SizedBox(
            width: 220,
            child: Text(
              "2048",
              style: TextStyle(
                  fontSize: 57,
                  fontWeight: FontWeight.w700,
                  color: Color.fromARGB(255, 123, 115, 87)),
            ),
          ),
          SizedBox(height: 5),
          SizedBox(
            width: 220,
            child: Text(
              "获取到2048分视为游戏胜利",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 123, 115, 87)),
            ),
          ),
          SizedBox(height: 5),
          SizedBox(
            width: 220,
            child: Text(
              "刷新最高分也能获取积分",
              style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 123, 115, 87)),
            ),
          ),
        ],
      ),
      Column(children: [
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 100,
          height: 60,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 189, 175, 153),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 12),
                const Text(
                  "分数",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
                const SizedBox(height: 5),
                Text(
                  currentScore.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          width: 100,
          height: 60,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 189, 175, 153),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 12),
                const Text(
                  "最高分",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
                const SizedBox(height: 5),
                Text(
                  highestScore.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: 100,
          child: ElevatedButton(
            onPressed: () {
              (_gamePanelKey.currentState as Game2048PanelState).reStartGame();
            },
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 130, 119, 103))),
            child: const Text(
              "新游戏",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ),
        )
      ]),
    ]);
  }

  //获取个人最高分
  void _getScore() async {
    var result = await NetRequester.request(Apis.queryScore(widget.account));
    if (mounted) {
      setState(() {
        highestScore = result["data"];
      });
    }
  }
}
