import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_crypto_test/app/models/crypto_markets_model.dart';
import 'package:flutter_crypto_test/app/models/crypto_model.dart';
import 'package:flutter_crypto_test/app/repositories/i_repository.dart';
import 'package:flutter_crypto_test/app/services/api_service.dart';
import 'package:flutter_crypto_test/app/services/local_service.dart';

class Repository implements IRepository {
  Repository({
    required ApiService apiService,
    required LocalService localService,
  }) : _apiService = apiService,
       _localService = localService;

  final ApiService _apiService;
  final LocalService _localService;

  @override
  Future<List<CryptoModel>> searchCrypto(String query) async {
    try {
      final jsonData = await _apiService.searchCrypto(query);

      return jsonData
          .map((cryptoJson) => CryptoModel.fromJson(cryptoJson))
          .toList();
    } catch (e) {
      debugPrint('Erro ao buscar criptos: $e');
      rethrow;
    }
  }

  @override
  Stream<Map<String, String>> getPricesStream(List<String> ids) {
    try {
      return _apiService.connectToWebSocket(ids).stream.map((event) {
        try {
          final Map<String, dynamic> data = jsonDecode(event);
          return data.map((key, value) => MapEntry(key, value.toString()));
        } catch (e) {
          debugPrint('Erro ao decodificar JSON do WebSocket: $e');
          return {}; // Retorna um mapa vazio em caso de erro
        }
      });
    } catch (e) {
      debugPrint('Erro ao conectar ao WebSocket: $e');
      rethrow;
    }
  }

  @override
  Future<List<CryptoMarketsModel>> getAssetMarket(String query) async {
    try {
      final jsonData = await _apiService.availableMarkets(query);

      return jsonData
          .map((cryptoJson) => CryptoMarketsModel.fromJson(cryptoJson))
          .toList();
    } catch (e) {
      debugPrint('Erro ao buscar mercado: $e');
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
