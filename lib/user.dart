class User {

  String _userName;
  String _email;
  String _password;
  DateTime _dateOfBierth;
  String _gender;

  User ( this._userName, this._email, this._password,this._dateOfBierth,this._gender);

  String get gender => _gender;

  set gender(String value) {
    _gender = value;
  }

  DateTime get dateOfBierth => _dateOfBierth;

  set dateOfBierth(DateTime value) {
    _dateOfBierth = value;
  }

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