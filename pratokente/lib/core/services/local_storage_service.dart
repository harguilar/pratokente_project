import 'package:pratokente/core/datamodels/user/user_models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LocalStorageService {
  static const String Userkey = 'user';
  static const String AppLanguagesKey = 'languages';
  static const String DarkModeKey = 'darkmode';
  User? noUser;

  static LocalStorageService? _instance;
  static SharedPreferences? _preferences;

  static Future<LocalStorageService> getInstance() async {
    try {
      if (_instance == null) {
        _instance = LocalStorageService();
      }

      if (_preferences == null) {
        _preferences = await SharedPreferences.getInstance();
      }

      return _instance!;
    } catch (e) {
      // SharedPreferences.setMockInitialValues({});
      print(e.toString());
      throw ' ';
    }
  }

  User? get user {
    var userJson = getFromDisk(Userkey);
    if (userJson == null) {
      return noUser!;
    }
    return User.fromJson(json.decode(userJson));
  }

  set user(User? userToSave) {
    saveStringToDisk(Userkey, json.encode(userToSave!.toJson()));
  }

  dynamic getFromDisk(String key) {
    //SharedPreferences.setMockInitialValues({});
    var value = _preferences!.get(key);
    print(
        '(TRACE) LocalStorageService: _getFromDisk. Key $key value: $value.toString()');
    return value.toString();
  }

  void saveStringToDisk(String? key, String? content) {
    //SharedPreferences.setMockInitialValues({'key':content});

    print(
        '(TRACE) LocalStorageService: _getFromDisk. Key $key value: $content');
    _preferences!.setString(Userkey, content!);
  }

  bool get darkMode => getFromDisk(DarkModeKey) ?? false;

  set darkMode(bool value) => saveToDisk(DarkModeKey, value);

  List<String> get languages => getFromDisk(AppLanguagesKey);

  set languages(List<String> appLanguages) =>
      saveToDisk(AppLanguagesKey, appLanguages);

  // updated _saveToDisk function that handles all types
  void saveToDisk<T>(String? key, T content) {
    //SharedPreferences.setMockInitialValues({});
    //SharedPreferences.setMockInitialValues({});

    print('(TRACE) LocalStorageService:_saveToDisk. key: $key value: $content');

    if (content is String) {
      _preferences!.setString(key!, content);
    }
    if (content is bool) {
      _preferences!.setBool(key!, content);
    }
    if (content is int) {
      _preferences!.setInt(key!, content);
    }
    if (content is double) {
      _preferences!.setDouble(key!, content);
    }
    if (content is List<String>) {
      _preferences!.setStringList(key!, content);
    }
  }
}
