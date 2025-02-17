import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';

class ApiService {
  final http.Client client;
  ApiService(this.client);

  static const String _baseUrl = 'https://api.coincap.io/v2/assets';
  static const String _webSocketUrl = 'wss://ws.coincap.io/prices?assets=';

  Future<List<dynamic>> searchCrypto(String query) async {
    final url = Uri.parse(
      '$_baseUrl${query.isNotEmpty ? '?search=$query' : ''}',
    );
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      debugPrint({'http': url.toString()}.toString());
      return data['data'];
    } else {
      throw Exception('Erro ao buscar dados da criptomoeda');
    }
  }

  WebSocketChannel connectToWebSocket(List<String> cryptos) {
    final url = Uri.parse(
      '$_webSocketUrl${cryptos.isNotEmpty ? cryptos.join(",") : 'ALL'}',
    );
    debugPrint({'websocket': url.toString()}.toString());
    return WebSocketChannel.connect(url);
  }

  Future<List<dynamic>> availableMarkets(String id) async {
    final url = Uri.parse('$_baseUrl/$id/markets');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      debugPrint({'http': url.toString()}.toString());
      return data['data'];
    } else {
      throw Exception('Erro ao buscar dados do mercado');
    }
  }

  Future<List<dynamic>> history({
    required String id,
    required String interval,
  }) async {
    final url = Uri.parse('$_baseUrl/$id/history?interval=$interval');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      debugPrint({'http': url.toString()}.toString());
      return data['data'];
    } else {
      throw Exception('Erro ao buscar dados do historico');
    }
  }
}
