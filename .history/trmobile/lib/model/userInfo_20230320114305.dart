class UserInfo {
  String account;
  String password;
  UserInfo({required this.account, required this.password});

  @override
  String toString() {
    return 'UserInfo{account: $account, password: $password}';
  }
}
