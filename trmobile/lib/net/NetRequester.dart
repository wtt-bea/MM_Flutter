import '../config/net_config.dart';
import 'package:dio/dio.dart';
import 'package:oktoast/oktoast.dart';

class NetRequester {
  static var options = BaseOptions(
    baseUrl: NetConfig.ip,
    contentType: Headers.formUrlEncodedContentType,
  );

  static Future request(String url, {FormData? file, Map? data}) async {
    Dio dio = Dio(options);
    Response _response;
    try {
      if (data != null) {
        _response = await dio.post(url, data: data);
      } else if (file != null) {
        _response = await dio.post(url, data: file);
      } else {
        _response = await dio.post(url);
      }
    } on DioError catch (e) {
      print('dioError:::::' + e.toString());
      switch (e.type) {
        case DioErrorType.cancel:
          print('请求已取消');
          break;
        case DioErrorType.connectionTimeout:
          print('连接超时');
          break;
        case DioErrorType.receiveTimeout:
          print('接收数据超时');
          break;
        case DioErrorType.sendTimeout:
          print('发送请求超时');
          break;
        case DioErrorType.badResponse:
          print('网络出错');
          break;
      }
      throw e;
    }
    return _response.data;
  }
}
