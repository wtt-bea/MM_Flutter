// ignore: file_names
import 'dart:math';
import 'package:flutter/material.dart';

class Game2048Panel extends StatefulWidget {
  final ValueChanged<int>? onScoreChanged;

  const Game2048Panel({Key? key, this.onScoreChanged}) : super(key: key);

  @override
  Game2048PanelState createState() => Game2048PanelState();
}

class Game2048PanelState extends State<Game2048Panel> {
  /// 每行每列的个数
  static const int SIZE = 4;

  /// 判断是否游戏结束
  bool _isGameOver = false;
  final List _gameMap =
      List.generate(SIZE, (_) => List<int>.generate(SIZE, (_) => 0));
  final Map<int, Color> _mapValueToColor = {
    0: Color.fromARGB(255, 189, 175, 153),
    2: Color.fromARGB(255, 234, 227, 214),
    4: Color.fromARGB(255, 227, 217, 190),
    8: Color.fromARGB(255, 242, 177, 121),
    16: Color.fromARGB(255, 245, 149, 99),
    32: Color.fromARGB(255, 246, 124, 95),
    64: const Color.fromARGB(255, 246, 95, 64),
    128: const Color.fromARGB(255, 235, 208, 117),
    256: const Color.fromARGB(255, 237, 203, 103),
    512: const Color.fromARGB(255, 236, 201, 85),
    1024: const Color.fromARGB(255, 229, 194, 90),
    2048: const Color.fromARGB(255, 232, 192, 70),
  };

  //左右方向的偏移应该小于这个阈值
  final double _crossAxisMaxLimit = 20.0;

  //上下方向的偏移应该大于这个阈值
  final double _mainAxisMinLimit = 60.0;

  bool _firstValidPan = true;
  // ignore: prefer_typing_uninitialized_variables
  late Offset lastPosition;
  bool _noMoveInSwipe = true;

  /// 当前分数
  int currentScore = 0;
  int _currentScore = 0;

  /// 历史最高分
  int highestScore = 0;
  @override
  void initState() {
    super.initState();
    _initGameMap();
  }

  /// 初始化数据
  void _initGameMap() {
    /// 执行两次随机
    _randomNewCellData(2);
    _randomNewCellData(4);
  }

  @override
  Widget build(BuildContext context) {
    if (_isGameOver) {
      return Stack(
        children: [
          _buildGamePanel(context),
          _buildGameOverMask(context),
        ],
      );
    } else {
      return _buildGamePanel(context);
    }
  }

  Widget _buildGamePanel(BuildContext context) {
    return GestureDetector(
      //手指落下的坐标
      onPanDown: (DragDownDetails details) {
        lastPosition = details.globalPosition;
        _firstValidPan = true;
      },
      //当前的坐标
      onPanUpdate: (DragUpdateDetails details) {
        final currentPosition = details.globalPosition;

        // 区分是垂直方向还是水平方向滑动
        if ((currentPosition.dx - lastPosition.dx).abs() > _mainAxisMinLimit &&
            (currentPosition.dy - lastPosition.dy).abs() < _crossAxisMaxLimit) {
          // 水平方向滑动
          if (_firstValidPan) {
            debugPrint("水平方向滑动");
            // 区分是向左滑还是向右滑
            if (currentPosition.dx - lastPosition.dx > 0) {
              // 向右滑
              debugPrint("向右滑");
              setState(() {
                _joinGameMapDataToRight();
                if (!_noMoveInSwipe) {
                  _randomNewCellData(2);
                }
              });
            } else {
              // 向左滑
              setState(() {
                // 合并相同的块，移动非0的块到最左边
                _joinGameMapDataToLeft();
                if (!_noMoveInSwipe) {
                  _randomNewCellData(2);
                }
                // _checkGameState();
              });
            }
            _firstValidPan = false;
          }
        } else if ((currentPosition.dy - lastPosition.dy).abs() >
                _mainAxisMinLimit &&
            (currentPosition.dx - lastPosition.dx).abs() < _crossAxisMaxLimit) {
          // 垂直方向滑动
          if (_firstValidPan) {
            debugPrint("垂直方向滑动");

            // 然后区分是向上滑还是向下滑
            if (currentPosition.dy - lastPosition.dy > 0) {
              // 向下滑
              debugPrint("向下滑");
              setState(() {
                // 合并相同的块，移动非0的块到最左边
                _joinGameMapDataToBottom();
                if (!_noMoveInSwipe) {
                  _randomNewCellData(2);
                }
                // _checkGameState();
              });
            } else {
              // 向上滑
              debugPrint("向上滑");
              setState(() {
                // 合并相同的块，移动非0的块到最左边
                _joinGameMapDataToTop();
                if (!_noMoveInSwipe) {
                  _randomNewCellData(2);
                }
                // _checkGameState();
              });
            }
            _firstValidPan = false;
          }
        }
      },
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          padding: const EdgeInsets.only(top: 10, left: 10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color.fromARGB(255, 170, 158, 138),
          ),
          margin: const EdgeInsets.all(5),
          child: MediaQuery.removePadding(
            //删除顶部 padding
            removeTop: true,
            context: context,
            child: GridView.builder(
              // 禁用 GridView 的滑动
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: SIZE,
              ),
              itemCount: SIZE * SIZE,
              itemBuilder: (context, int index) {
                int indexI = index ~/ SIZE;
                int indexJ = index % SIZE;
                return _buildGameCell(_gameMap[indexI][indexJ]);
              },
            ),
          ),
        ),
      ),
    );
  }

  /// GridView 中的子组件，表示每个小块
  Widget _buildGameCell(int value) {
    return Container(
      decoration: BoxDecoration(
          color: _mapValueToColor[value],
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      margin: const EdgeInsets.only(bottom: 10, right: 10),
      child: Center(
        child: Text(
          value == 0 ? "" : value.toString(),
          style: const TextStyle(
              fontSize: 27,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(
                  255, 130, 119, 103)), // 如果数字是0，展示空字符串，效果上就是空格，否则展示数字
        ),
      ),
    );
  }

  /// 游戏结束蒙层
  Widget _buildGameOverMask(BuildContext context) {
    return AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          color: Color.fromARGB(139, 255, 255, 255),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Game Over",
                style: TextStyle(
                    color: Color.fromARGB(255, 78, 73, 55),
                    fontSize: 30,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.amber)),
                  onPressed: () {
                    // 重新开始游戏
                    reStartGame();
                  },
                  child: const Text(
                    "ReStart",
                    style: TextStyle(color: Color.fromARGB(255, 78, 73, 55)),
                  ))
            ],
          ),
        ));
  }

  void _randomNewCellData(int data) {
    /// 如果都不为0，就直接return，不产生新数字
    if (isGameMapAllNotZero()) {
      debugPrint("gameMap中都不是0，不能生成");
      return;
    }
    while (true) {
      Random random = Random();
      int randomI = random.nextInt(SIZE);
      int randomJ = random.nextInt(SIZE);
      if (_gameMap[randomI][randomJ] == 0) {
        _gameMap[randomI][randomJ] = data;
        break;
      }
    }
  }

  /// 判断Map中的数字是否都不为0
  bool isGameMapAllNotZero() {
    bool isAllNotZero = true;
    for (int i = 0; i < SIZE; i++) {
      for (int j = 0; j < SIZE; j++) {
        if (_gameMap[i][j] == 0) {
          isAllNotZero = false;
          break;
        }
      }
    }
    return isAllNotZero;
  }

  void _joinGameMapDataToLeft() {
    /// 开始改变map中的数据时，先将noMoveInSwipe置为true
    _noMoveInSwipe = true;

    /// 每一行都要计算，所以用 for 循环遍历每一行
    for (int i = 0; i < SIZE; i++) {
      int j1 = 0;
      while (j1 < SIZE - 1) {
        if (_gameMap[i][j1] == 0) {
          j1++;
          continue;
        }
        for (int j2 = j1 + 1; j2 < SIZE; j2++) {
          if (_gameMap[i][j2] == 0) {
            continue;
          } else if (_gameMap[i][j2] != _gameMap[i][j1]) {
            break;
          } else {
            _gameMap[i][j1] = 2 * _gameMap[i][j1];
            _gameMap[i][j2] = 0;

            //增加分数
            _currentScore += (_gameMap[i][j1] as int);

            //分数回调给外界
            widget.onScoreChanged?.call(_currentScore);

            /// 这行要写在记录score之后，不然gameMap[i][j1]实际是gameMap[i][j2]，就是0了
            j1 = j2;

            /// 有块的合并，说明有移动
            _noMoveInSwipe = false;
          }
        }
        j1++;
      }
      int notZeroCount = 0;
      for (int k = 0; k < SIZE; k++) {
        if (_gameMap[i][k] != 0) {
          if (k != notZeroCount) {
            _gameMap[i][notZeroCount] = _gameMap[i][k];
            _gameMap[i][k] = 0;
            // 有移动
            _noMoveInSwipe = false;
          }
          notZeroCount++;
        }
      }
    }
    _checkGameState();
  }

  void _joinGameMapDataToRight() {
    /// 开始改变map中的数据时，先将noMoveInSwipe置为true
    _noMoveInSwipe = true;

    /// 每一行都要计算，所以用 for 循环遍历每一行
    for (int i = 0; i < SIZE; i++) {
      int j1 = 3;
      while (j1 >= 1) {
        if (_gameMap[i][j1] == 0) {
          j1--;
          continue;
        }
        for (int j2 = j1 - 1; j2 >= 0; j2--) {
          if (_gameMap[i][j2] == 0) {
            continue;
          } else if (_gameMap[i][j2] != _gameMap[i][j1]) {
            break;
          } else {
            _gameMap[i][j1] = 2 * _gameMap[i][j1];
            _gameMap[i][j2] = 0;
            //增加分数
            _currentScore += (_gameMap[i][j1] as int);
            //分数回调给外界
            widget.onScoreChanged?.call(_currentScore);

            /// 这行要写在记录score之后，不然gameMap[i][j1]实际是gameMap[i][j2]，就是0了
            j1 = j2;

            /// 有块的合并，说明有移动
            _noMoveInSwipe = false;
          }
        }
        j1--;
      }
      int notZeroCount = 3;
      for (int k = 3; k >= 0; k--) {
        if (_gameMap[i][k] != 0) {
          if (k != notZeroCount) {
            _gameMap[i][notZeroCount] = _gameMap[i][k];
            _gameMap[i][k] = 0;
            // 有移动
            _noMoveInSwipe = false;
          }
          notZeroCount--;
        }
      }
    }
    _checkGameState();
  }

  void _joinGameMapDataToTop() {
    /// 开始改变map中的数据时，先将noMoveInSwipe置为true
    _noMoveInSwipe = true;

    /// 每一行都要计算，所以用 for 循环遍历每一行
    for (int i = 0; i < SIZE; i++) {
      int j1 = 0;
      while (j1 < SIZE - 1) {
        if (_gameMap[j1][i] == 0) {
          j1++;
          continue;
        }
        for (int j2 = j1 + 1; j2 < SIZE; j2++) {
          if (_gameMap[j2][i] == 0) {
            continue;
          } else if (_gameMap[j2][i] != _gameMap[j1][i]) {
            break;
          } else {
            _gameMap[j1][i] = 2 * _gameMap[j1][i];
            _gameMap[j2][i] = 0;

            //增加分数
            _currentScore += (_gameMap[j1][i] as int);

            //分数回调给外界
            widget.onScoreChanged?.call(_currentScore);

            /// 这行要写在记录score之后，不然gameMap[i][j1]实际是gameMap[i][j2]，就是0了
            j1 = j2;

            /// 有块的合并，说明有移动
            _noMoveInSwipe = false;
          }
        }
        j1++;
      }
      int notZeroCount = 0;
      for (int k = 0; k < SIZE; k++) {
        if (_gameMap[k][i] != 0) {
          if (k != notZeroCount) {
            _gameMap[notZeroCount][i] = _gameMap[k][i];
            _gameMap[k][i] = 0;
            // 有移动
            _noMoveInSwipe = false;
          }
          notZeroCount++;
        }
      }
    }
    _checkGameState();
  }

  void _joinGameMapDataToBottom() {
    /// 开始改变map中的数据时，先将noMoveInSwipe置为true
    _noMoveInSwipe = true;

    /// 每一行都要计算，所以用 for 循环遍历每一行
    for (int i = 0; i < SIZE; i++) {
      int j1 = 3;
      while (j1 >= 1) {
        if (_gameMap[j1][i] == 0) {
          j1--;
          continue;
        }
        for (int j2 = j1 - 1; j2 >= 0; j2--) {
          if (_gameMap[j2][i] == 0) {
            continue;
          } else if (_gameMap[j2][i] != _gameMap[j1][i]) {
            break;
          } else {
            _gameMap[j1][i] = 2 * _gameMap[j1][i];
            _gameMap[j2][i] = 0;
            //增加分数
            _currentScore += (_gameMap[j1][i] as int);
            //分数回调给外界
            widget.onScoreChanged?.call(_currentScore);

            /// 这行要写在记录score之后，不然gameMap[i][j1]实际是gameMap[i][j2]，就是0了
            j1 = j2;

            /// 有块的合并，说明有移动
            _noMoveInSwipe = false;
          }
        }
        j1--;
      }
      int notZeroCount = 3;
      for (int k = 3; k >= 0; k--) {
        if (_gameMap[k][i] != 0) {
          if (k != notZeroCount) {
            _gameMap[notZeroCount][i] = _gameMap[k][i];
            _gameMap[k][i] = 0;
            // 有移动
            _noMoveInSwipe = false;
          }
          notZeroCount--;
        }
      }
    }
    _checkGameState();
  }

  void _checkGameState() {
    if (!isGameMapAllNotZero()) {
      return;
    }

    /// 如果 Map 中数字都不为0，则需要判断横纵方向上是否存在可以合并的数字，
    /// 如果有，则游戏不算结束，都没有的话，游戏结束
    bool canMerge = false;
    for (int i = 0; i < SIZE; i++) {
      for (int j = 0; j < SIZE - 1; j++) {
        if (_gameMap[i][j] == _gameMap[i][j + 1]) {
          canMerge = true;
          break;
        }
      }
      if (canMerge) {
        break;
      }
    }
    for (int j = 0; j < SIZE; j++) {
      for (int i = 0; i < SIZE - 1; i++) {
        if (_gameMap[i][j] == _gameMap[i + 1][j]) {
          canMerge = true;
          break;
        }
      }
      if (canMerge) {
        break;
      }
    }
    // 横纵遍历完后，如果没有可以合并的，游戏结束
    if (!canMerge) {
      setState(() {
        _isGameOver = true;
      });
    }
  }

  void reStartGame() {
    setState(() {
      _resetGameMap();
      _initGameMap();
      // 清空分数
      _currentScore = 0;
      // 将分数回调给父容器
      widget.onScoreChanged?.call(_currentScore);
      // 重置游戏状态，游戏没有结束，不会出现蒙层
      _isGameOver = false;
    });
  }

  /// 清空游戏数据源，全部置为 0
  void _resetGameMap() {
    for (int i = 0; i < SIZE; i++) {
      for (int j = 0; j < SIZE; j++) {
        _gameMap[i][j] = 0;
      }
    }
  }
}
