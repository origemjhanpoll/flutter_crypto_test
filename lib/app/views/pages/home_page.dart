import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_crypto_test/app/services/api_service.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ApiService _apiService = ApiService();
  WebSocketChannel? _channel;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _loadCryptoData();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _channel?.sink.close();
    super.dispose();
  }

  void _loadCryptoData() async {
    try {
      _channel = _apiService.connectToWebSocket(['bitcoin']);
      _channel!.stream.listen((message) {
        final Map<String, dynamic> priceUpdate = jsonDecode(message);
        debugPrint(priceUpdate.toString());
      });
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AppBar Home")),
      body: Center(child: Text('Home Page')),
      // body: BuildCryptoInfo(
      //   name: _cryptoData!['name'],
      //   symbol: _cryptoData!['symbol'],
      //   price: double.parse(_cryptoData!['price']),
      //   previousPrice: _previousPrice,
      //   change: double.parse(_cryptoData!['changePercent24Hr']),
      //   volume: double.parse(_cryptoData!['volumeUsd24Hr']),
      // ),
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
