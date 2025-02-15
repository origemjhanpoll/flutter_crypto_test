import 'package:flutter_crypto_test/app/models/crypto_model.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class IRepository {
  Future<List<CryptoModel>> searchCrypto(String query);
  WebSocketChannel updatePrices(List<String> cryptos);
  Future<void> saveCryptoIds(List<String> ids);
  Future<List<String>> getCryptoIds();
}
