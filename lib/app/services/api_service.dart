import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:web_socket_channel/web_socket_channel.dart';

class ApiService {
  static const String _baseUrl = 'https://api.coincap.io/v2/assets';
  static const String _webSocketUrl = 'wss://ws.coincap.io/prices?assets=';

  Future<Map<String, dynamic>> fetchCrypto(List<String> cryptos) async {
    final url = Uri.parse('$_baseUrl/${cryptos.isNotEmpty ? cryptos : ''}');
    final response = await http.get(url);

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
}
