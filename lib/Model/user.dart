class User{
  String _FirstName;
  String _LastName;
  String _email;
  String _password;
  String _photoUrl;

  String get FirstName => _FirstName;

  set FirstName(String value) {
    _FirstName = value;
  }

  String _phoneNumber;

  String get LastName => _LastName;

  set LastName(String value) {
    _LastName = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get photoUrl => _photoUrl;

  set photoUrl(String value) {
    _photoUrl = value;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  @override
  String toString() {
    return 'User{_FirstName: $_FirstName, _LastName: $_LastName, _email: $_email, _password: $_password, _photoUrl: $_photoUrl, _phoneNumber: $_phoneNumber}';
  }
}