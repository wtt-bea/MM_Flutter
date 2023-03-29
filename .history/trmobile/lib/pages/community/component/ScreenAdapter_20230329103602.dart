import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenAdapter {
  static heigth(num value) {
    return ScreenUtil().setHeight(value);
  }

  static width(num value) {
    return ScreenUtil().setWidth(value);
  }

  static size(num value) {
    return ScreenUtil().setSp(value);
  }

  static getScreenWidth() {
    return ScreenUtil().screenWidth; //获取设备的物理宽度
  }

  static getScreenHigth() {
    return ScreenUtil().screenHeight; //获取设备的物理高度
  }
}
