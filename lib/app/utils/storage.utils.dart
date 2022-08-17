import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageUtils {

  static Future<String> getStringByKey(String key) async => await FlutterSecureStorage().read(key: key) ?? '';

  static void setStringKey(String key, String value) async => await FlutterSecureStorage().write(key: key, value: value);

  static void removeAll() async => await FlutterSecureStorage().deleteAll();

  static Future<void> removeByKey(String key) async => await FlutterSecureStorage().delete(key: key);

}
