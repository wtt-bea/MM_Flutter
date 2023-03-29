import 'package:flutter/material.dart';

class FloatButton extends StatefulWidget {
  // const FloatButton({required Key key}) : super(key: key);

  @override
  _FloatButtonState createState() => _FloatButtonState();
}

class _FloatButtonState extends State<FloatButton> {
  Offset offsetA = Offset(20, kToolbarHeight + 100); //按钮的初始位置

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      body: Stack(children: <Widget>[
        Positioned(
            left: offsetA.dx,
            top: offsetA.dy,
            child: Draggable(
                //创建可以被拖动的Widget
                child: FloatingActionButton(
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                  onPressed: () {},
                ),
                //拖动过程中的Widget
                feedback: FloatingActionButton(
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                  onPressed: () {},
                ),
                //拖动过程中，在原来位置停留的Widget，设定这个可以保留原本位置的残影，如果不需要可以直接设置为Container()
                childWhenDragging: Container(),

                // FloatingActionButton(
                //   tooltip: 'Increment',
                //   child: Icon(Icons.add), onPressed: () {},
                // ),
                //拖动结束后的Widget
                onDraggableCanceled: (Velocity velocity, Offset offset) {
                  // 计算组件可移动范围  更新位置信息
                  setState(() {
                    var x = offset.dx;
                    var y = offset.dy;
                    if (offset.dx < 0) {
                      x = 20;
                    }

                    if (offset.dx > 375) {
                      x = 335;
                    }

                    if (offset.dy < kBottomNavigationBarHeight) {
                      y = kBottomNavigationBarHeight;
                    }

                    if (offset.dy > height - 100) {
                      y = height - 100;
                    }

                    offsetA = Offset(x, y);
                  });
                }))
      ]),
    );
  }
}
