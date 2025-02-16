import 'package:flutter_crypto_test/app/models/crypto_model.dart';

abstract class IRepository {
  Future<List<CryptoModel>> searchCrypto(String query);
  Stream<Map<String, String>> getPricesStream(List<String> ids);
  Future<void> saveCryptoIds(List<String> ids);
  Future<List<String>> getCryptoIds();
}
