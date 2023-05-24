import 'package:api_service/src/enums/user_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  SharedPrefs({required SharedPreferences sharedPrefs}) : super() {
    _sharedPrefs = sharedPrefs;
  }

  late SharedPreferences _sharedPrefs;

  bool get isNewMenu {
    return _sharedPrefs.getBool('isNewMenu') ?? false;
  }

  set isNewMenu(bool value) {
    _sharedPrefs.setBool('isNewMenu', value);
  }

  String get currentTimestamp {
    return _sharedPrefs.getString('currentTimestamp') ??
        DateTime.now().millisecondsSinceEpoch.toString();
  }

  set currentTimestamp(String value) {
    _sharedPrefs.setString('currentTimestamp', value);
  }

  String get subscriptionId {
    return _sharedPrefs.getString('subscriptionId') ?? '';
  }

  set subscriptionId(String value) {
    _sharedPrefs.setString(
      'subscriptionId',
      value,
    );
  }

  String get contactId {
    return _sharedPrefs.getString(UserPrefsEnum.contactId.name) ?? '';
  }

  set contactId(String value) {
    _sharedPrefs.setString(
      UserPrefsEnum.contactId.name,
      value,
    );
  }

  Future<void> clearSharedPrefs() async {
    await _sharedPrefs.clear();
  }

  bool get isTaskSimpleView {
    return _sharedPrefs.getBool('isTaskSimpleView') ?? true;
  }

  set isTaskSimpleView(bool value) {
    _sharedPrefs.setBool('isTaskSimpleView', value);
  }

  String get currentEndpointUrl {
    return _sharedPrefs.getString('currentEndpointUrl') ??
        "https://app.nextminute.com/api";
  }

  set currentEndpointUrl(String value) {
    _sharedPrefs.setString('currentEndpointUrl', value);
  }

  String get defaultMaps {
    return _sharedPrefs.getString('defaultMaps') ?? "";
  }

  set defaultMaps(String value) {
    _sharedPrefs.setString('defaultMaps', value);
  }

  String get authStatus {
    return _sharedPrefs.getString('authStatus') ?? "unauthenticated";
  }

  set authStatus(String value) {
    _sharedPrefs.setString('authStatus', value);
  }

  String get token =>
      _sharedPrefs.getString(UserPrefsEnum.token.name)?.toString() ?? "";

  set token(String value) {
    _sharedPrefs.setString(UserPrefsEnum.token.name, value);
  }

  String get username =>
      _sharedPrefs.getString(UserPrefsEnum.username.name)?.toString() ?? "";

  set username(String value) {
    _sharedPrefs.setString(UserPrefsEnum.username.name, value);
  }

  String get password =>
      _sharedPrefs.getString(UserPrefsEnum.password.name)?.toString() ?? "";

  set password(String value) {
    _sharedPrefs.setString(UserPrefsEnum.password.name, value);
  }

  String get subscriberEmail =>
      _sharedPrefs.getString(UserPrefsEnum.subscriberEmail.name)?.toString() ??
      "";

  set subscriberEmail(String value) {
    _sharedPrefs.setString(UserPrefsEnum.subscriberEmail.name, value);
  }

  String get subscriberNameDisplay =>
      _sharedPrefs
          .getString(UserPrefsEnum.subscriberNameDisplay.name)
          ?.toString() ??
      "";

  set subscriberNameDisplay(String value) {
    _sharedPrefs.setString(UserPrefsEnum.subscriberNameDisplay.name, value);
  }

  String get userPin =>
      _sharedPrefs.getString(UserPrefsEnum.userPin.name)?.toString() ?? "";

  set userPin(String value) {
    _sharedPrefs.setString(UserPrefsEnum.userPin.name, value);
  }

  // int get jobSubId => _sharedPrefs.getInt('jobSubId') ?? -1;

  // set jobSubId(int value) {
  //   _sharedPrefs.setInt('jobSubId', value);
  // }
}
