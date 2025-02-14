import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  static const String _cryptoIdsKey = 'crypto_ids';

  Future<void> saveCryptoIds(List<String> ids) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_cryptoIdsKey, ids);
  }

  Future<List<String>> getCryptoIds() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_cryptoIdsKey) ?? [];
  }
}
