import '../config/net_config.dart';
import '../util/logger.dart';
import '../util/toast.dart';
import 'package:dio/dio.dart';
import 'package:oktoast/oktoast.dart';

class NetRequester {
  static var options = BaseOptions(
    baseUrl: NetConfig.ip,
    contentType: Headers.formUrlEncodedContentType,
  );

  static Dio dio = Dio(options);
  //再修改ip或端口后直接重设dio实例的baseUrl，不然请求的链接是不正确的，是旧的配置并没有更新
  // static resetDio() {
  //   var newOptions = BaseOptions(
  //     baseUrl: Global.profile.ip ?? NetConfig.ip,
  //     contentType: Headers.formUrlEncodedContentType,
  //   );
  //   dio = Dio(newOptions);
  //   print(dio.options.headers);
  // }

  static Future request(String url,
      {String method = 'get',
      Map<String, dynamic> params,
      dynamic data,
      String token}) async {
    //print('### url=$url');
    try {
      if (data != null) {
        Response _response = await dio.post(url, data: data);
        return _response.data;
      } else if (file != null) {
        Response _response = await dio.post(url, data: file);
        return _response.data;
      } else {
        Response _response = await dio.post(url);
        return _response.data;
      }
    } on DioError catch (e) {
      print('dioError:::::' + e.toString());
      switch (e.type) {
        case DioErrorType.cancel:
          Toast.popToast('请求已取消');
          break;
        case DioErrorType.connectionTimeout:
          Toast.popToast('连接超时', ToastPosition.center);
          break;
        case DioErrorType.receiveTimeout:
          Toast.popToast('接收数据超时', ToastPosition.center);
          break;
        case DioErrorType.sendTimeout:
          Toast.popToast('发送请求超时', ToastPosition.center);
          break;
        case DioErrorType.connectionError:
          Toast.popToast('连接出错', ToastPosition.center);
          break;
        case DioErrorType.badResponse:
          Toast.popToast('错误请求', ToastPosition.center);
      }
      throw e;
    }
    //Log().i('返回的数据：' + _response.data.toString());
  }
}
