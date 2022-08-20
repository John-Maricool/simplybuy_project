class ValidationMixin {
  String validateEmail(String value) {
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return 'Valid Email';
  }

  String validatePassword(String value) {
    if (value.length < 6) {
      return 'Password too small';
    }
    return 'Valid Password';
  }
}
