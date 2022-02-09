class User {
  String _username;
  String? _email;
  DateTime _firstLogin;
  DateTime? _birthday;
  List? _wishes;
  bool _isFirstLogin;

  User(
    this._username,
    this._email,
    this._firstLogin,
    this._birthday,
    this._wishes,
    this._isFirstLogin,
  );

  factory User.fromObject(userdata) {
    return User(userdata['username'], null, userdata['firstLogin'], null, null,
        userdata['isFirstLogin']);
  }

  String getUsername() => this._username;
  String? getEmail() => this._email;
  DateTime getFirstLogin() => this._firstLogin;
  DateTime? getBirthday() => this._birthday;
  List? getWishes() => this._wishes;
  bool isFirstTime() => this._isFirstLogin;

  void setUsername(username) => this._username = username;
  void setEmail(username) => this._email = username;
  void changeFirstTime(val) => this._isFirstLogin = val;
  void setWishes(wishes) => this._wishes = wishes;
}
