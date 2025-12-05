class User {

  String _userName;
  String _email;
  String _password;

  User ( this._userName, this._email, this._password);

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get userName => _userName;

  set userName(String value) {
    _userName = value;
  }
}