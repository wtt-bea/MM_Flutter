import 'dart:convert';
import 'dart:io';

import "../model/user.dart";
import '../model/CommonResult.dart';

class MMApi {
  final HttpClient httpClient;

  MMApi({HttpClient? httpClient})
      : this.httpClient = httpClient ?? HttpClient();
  final host = "172.20.10.3:8080";
  Future<CommonResult> queryUser(String account, String password) async {
    HttpClientRequest request = await httpClient.getUrl(Uri.http(
        host, "/user/login", {'account': "$account", 'password': "$password"}));
    HttpClientResponse response = await request.close();
    var responseBody = await response.transform(Utf8Decoder()).join();
    var json = jsonDecode(responseBody);
    return CommonResult.fromJson(json);
  }
}
