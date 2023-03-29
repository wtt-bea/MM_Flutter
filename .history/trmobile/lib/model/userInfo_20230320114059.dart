class UserInfo {
  String account;
  String password;
  UserInfo({this.account, this.password});
  @override
  String toString() {
    return 'UserInfo{account: $account, password: $password}';
  }
}
