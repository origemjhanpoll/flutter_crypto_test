import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../services/crypto_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CryptoService _cryptoService = CryptoService();
  WebSocketChannel? _channel;
  Map<String, dynamic>? _cryptoData;
  Map<String, dynamic> _realTimePrices = {};
  bool _isLoading = true;
  String? _errorMessage;
  double? _previousPrice;

  @override
  void initState() {
    super.initState();
    _loadCryptoData();
  }

  void _loadCryptoData() async {
    try {
      final data = await _cryptoService.fetchCrypto('bitcoin');
      setState(() {
        _cryptoData = data;
        _isLoading = false;
      });

      _channel = _cryptoService.connectToWebSocket('bitcoin');
      _channel!.stream.listen((message) {
        final realTimeData = Map<String, dynamic>.from(jsonDecode(message));
        debugPrint('Received WebSocket message: $realTimeData');
        setState(() {
          _previousPrice =
              _realTimePrices['bitcoin'] != null
                  ? double.parse(_realTimePrices['bitcoin'])
                  : null;
          _realTimePrices = realTimeData;
        });
      });
    } catch (error) {
      setState(() {
        _errorMessage = 'Erro ao carregar dados';
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _channel?.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dados de Criptomoedas')),
      body:
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : _errorMessage != null
              ? Center(
                child: Text(
                  _errorMessage!,
                  style: TextStyle(color: Colors.red),
                ),
              )
              : _cryptoData != null
              ? BuildCryptoInfo(
                name: _cryptoData!['name'],
                symbol: _cryptoData!['symbol'],
                price: double.parse(_realTimePrices['bitcoin'] ?? "0.0"),
                previousPrice: _previousPrice,
                change: double.parse(_cryptoData!['changePercent24Hr']),
                volume: double.parse(_cryptoData!['volumeUsd24Hr']),
              )
              : Center(child: Text('Nenhum dado encontrado')),
    );
  }
}

class BuildCryptoInfo extends StatelessWidget {
  final String name;
  final String symbol;
  final double price;
  final double? previousPrice;
  final double change;
  final double volume;

  const BuildCryptoInfo({
    super.key,
    required this.name,
    required this.symbol,
    required this.price,
    this.previousPrice,
    required this.change,
    required this.volume,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '$name ($symbol)',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Preço: \$$price', style: TextStyle(fontSize: 20)),
              SizedBox(width: 8),
              if (previousPrice != null)
                Icon(
                  price > previousPrice!
                      ? Icons.arrow_upward
                      : Icons.arrow_downward,
                  color: price > previousPrice! ? Colors.green : Colors.red,
                ),
            ],
          ),
          Text(
            'Variação 24h: $change%',
            style: TextStyle(
              fontSize: 18,
              color: change >= 0 ? Colors.green : Colors.red,
            ),
          ),
          Text('Volume 24h: \$$volume', style: TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}
