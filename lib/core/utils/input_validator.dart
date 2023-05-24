class InputValidator {
  static String? isEmpty(String? value) {
    if (value == null || value.isEmpty) {
      return 'Required*';
    }
    return null;
  }

  static String? isEmail(String email) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
    );
    if (!emailRegex.hasMatch(email)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? isPassword(String password) {
    return password.length < 8
        ? 'Password must be at least 8 characters'
        : null;
  }
}
