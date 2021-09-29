import 'package:pratokente/app/app.logger.dart';
import 'package:pratokente/core/datamodels/merchants/merchant_data.dart';
import 'package:pratokente/core/datamodels/user/user_models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class LocalStorageService {
  final log = getLogger('LocalStorageService');
  static const String Userkey = 'user';
  static const String Merchantskey = 'merchants';
  static const String AppLanguagesKey = 'languages';
  static const String DarkModeKey = 'darkmode';
  User? noUser;

  static LocalStorageService? _instance;
  static SharedPreferences? _preferences;

  static Future<LocalStorageService?>? getInstance() async {
    try {
      if (_instance == null) {
        _instance = LocalStorageService();
      }

      if (_preferences == null) {
        _preferences = await SharedPreferences.getInstance();
      }

      return _instance!;
    } catch (e) {
      print(e.toString());
      return null;
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

  void saveMerchantToDisk({List<MerchantData>? content}) {
    if (content != null && content.isNotEmpty) {
      //log.i(content);
      final _listMerchant = json.encode(content);
      if (_listMerchant != null || _listMerchant.isNotEmpty) {
        log.i(
            '(TRACE) LocalStorageService: saveMerchantToDisk. Key $Merchantskey value: $_listMerchant');
        _preferences!.setString(Merchantskey, _listMerchant);
      } else {
        log.wtf('I do not accept empty Values in $_listMerchant');
      }
    } else {
      log.wtf('I do not except Null Values');
    }
  }

  bool get darkMode => getFromDisk(DarkModeKey) ?? false;

  set darkMode(bool value) => saveToDisk(DarkModeKey, value);

  List<String> get languages => getFromDisk(AppLanguagesKey);

  set languages(List<String> appLanguages) =>
      saveToDisk(AppLanguagesKey, appLanguages);

  // updated _saveToDisk function that handles all types
  void saveToDisk<T>(String? key, T content) {
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
