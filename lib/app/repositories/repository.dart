import 'package:flutter/foundation.dart';
import 'package:flutter_crypto_test/app/models/crypto_model.dart';
import 'package:flutter_crypto_test/app/repositories/i_repository.dart';
import 'package:flutter_crypto_test/app/services/api_service.dart';
import 'package:flutter_crypto_test/app/services/local_service.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class Repository implements IRepository {
  Repository({
    required ApiService apiService,
    required LocalService localService,
  }) : _apiService = apiService,
       _localService = localService;

  final ApiService _apiService;
  final LocalService _localService;

  @override
  Future<List<CryptoModel>> fetchCrypto(List<String> cryptos) async {
    try {
      final jsonData = _apiService.fetchCrypto(cryptos);
      final response =
          (jsonData as List)
              .map((cryptoJson) => CryptoModel.fromJson(cryptoJson))
              .toList();
      return response;
    } catch (e) {
      debugPrint('Erro ao buscar criptos: $e');
      rethrow;
    }
  }

  @override
  WebSocketChannel updatePrices(List<String> cryptos) {
    try {
      return _apiService.connectToWebSocket(cryptos);
    } catch (e) {
      debugPrint('Erro ao conectar ao WebSocket: $e');
      rethrow;
    }
  }

  @override
  Future<void> saveCryptoIds(List<String> ids) async {
    try {
      await _localService.saveCryptoIds(ids);
    } catch (e) {
      debugPrint('Erro ao salvar IDs de criptos: $e');
      rethrow;
    }
  }

  @override
  Future<List<String>> getCryptoIds() async {
    try {
      return await _localService.getCryptoIds();
    } catch (e) {
      debugPrint('Erro ao obter IDs de criptos: $e');
      rethrow;
    }
  }
}
