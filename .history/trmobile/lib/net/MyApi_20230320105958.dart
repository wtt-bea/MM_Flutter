class Apis {
  //登录
  static String login(String account, String password) {
    return '/userInfo/login?account=$account&password=$password';
  }
}
