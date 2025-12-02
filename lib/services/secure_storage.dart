import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const storage = FlutterSecureStorage();
  static const _keyToken = "token";

  static Future<void> saveToken(String token) async {
    await storage.write(key: _keyToken, value: token);
  }

  static Future<String?> getToken() async {
    return await storage.read(key: _keyToken);
  }

  static Future<void> clearToken() async {
    await storage.delete(key: _keyToken);
  }
}
