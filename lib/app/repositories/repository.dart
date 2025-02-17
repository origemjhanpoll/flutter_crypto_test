import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_crypto_test/app/models/crypto_markets_model.dart';
import 'package:flutter_crypto_test/app/models/crypto_model.dart';
import 'package:flutter_crypto_test/app/models/crypto_price_history.dart';
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

      return jsonData.map((json) => CryptoModel.fromJson(json)).toList();
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
          return {};
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

      return jsonData.map((json) => CryptoMarketsModel.fromJson(json)).toList();
    } catch (e) {
      debugPrint('Erro ao buscar mercado: $e');
      rethrow;
    }
  }

  @override
  Future<List<CryptoPriceHistory>> getHistory({
    required String id,
    required String interval,
  }) async {
    try {
      final jsonData = await _apiService.history(id: id, interval: interval);

      return jsonData.map((json) => CryptoPriceHistory.fromJson(json)).toList();
    } catch (e) {
      debugPrint('Erro ao buscar intervalo: $e');
      rethrow;
    }
  }

  @override
  Future<void> saveFavorite(CryptoModel asset) async {
    try {
      final json = jsonEncode(asset.toJson());
      await _localService.saveFavorite(json);
    } catch (e) {
      debugPrint('Erro ao salvar asset de favoritos: $e');
      rethrow;
    }
  }

  @override
  Future<void> removeFavorite(String id) async {
    try {
      await _localService.removeFavorite(id);
    } catch (e) {
      debugPrint('Erro ao remover asset de favoritos: $e');
      rethrow;
    }
  }

  @override
  Future<List<CryptoModel>> getFavorites() async {
    try {
      final jsonList = await _localService.getFavorites();

      return jsonList
          .map((element) => CryptoModel.fromJson(jsonDecode(element)))
          .toList();
    } catch (e) {
      debugPrint('Erro ao obter favoritos: $e');
      rethrow;
    }
  }
}
