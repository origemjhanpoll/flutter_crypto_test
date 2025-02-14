import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';

class CryptoService {
  static const String _baseUrl = 'https://api.coincap.io/v2/assets';
  static const String _webSocketUrl = 'wss://ws.coincap.io/prices?assets=';

  Future<Map<String, dynamic>> fetchCrypto(String cryptoId) async {
    final url = Uri.parse('$_baseUrl/$cryptoId');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      debugPrint({'http': url.toString()}.toString());
      return data['data'];
    } else {
      throw Exception('Erro ao buscar dados da criptomoeda');
    }
  }

  WebSocketChannel connectToWebSocket(String crypto) {
    final url = Uri.parse('$_webSocketUrl$crypto');
    debugPrint({'websocket': url.toString()}.toString());
    return WebSocketChannel.connect(url);
  }
}
