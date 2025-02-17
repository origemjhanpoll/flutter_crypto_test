import 'package:flutter_crypto_test/app/models/crypto_markets_model.dart';
import 'package:flutter_crypto_test/app/models/crypto_model.dart';
import 'package:flutter_crypto_test/app/models/crypto_price_history.dart';

abstract class IRepository {
  Future<List<CryptoModel>> searchCrypto(String query);
  Future<List<CryptoMarketsModel>> getAssetMarket(String query);
  Future<List<CryptoPriceHistory>> getHistory({
    required String id,
    required String interval,
  });
  Stream<Map<String, String>> getPricesStream(List<String> ids);
  Future<void> saveCryptoIds(List<String> ids);
  Future<List<String>> getCryptoIds();
}
