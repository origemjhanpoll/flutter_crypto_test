import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crypto_test/app/injection.dart';
import 'package:flutter_crypto_test/app/viewmodel/cryptos/cryptos_cubit.dart';
import 'package:flutter_crypto_test/app/viewmodel/cryptos/cryptos_state.dart';
import 'package:flutter_crypto_test/app/views/molecules/asset_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();

  late CryptosCubit _cubit;

  @override
  void initState() {
    _cubit = di<CryptosCubit>();
    _cubit.load(query: '').whenComplete(() {
      // _cubit.updatePrices();
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AppBar Home")),
      body: BlocBuilder<CryptosCubit, CryptosState>(
        bloc: _cubit,
        builder: (context, state) {
          if (state is CryptoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CryptoSuccess) {
            return ListView.separated(
              itemCount: state.cryptos.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final asset = state.cryptos[index];
                // final assetIds = state.cryptos.map((crypto) => crypto.id);
                return Column(
                  children: [
                    AssetWidget(
                      id: asset.id,
                      rank: asset.rank,
                      symbol: asset.symbol,
                      name: asset.name,
                      supply: asset.supply,
                      maxSupply: asset.maxSupply,
                      marketCapUsd: asset.marketCapUsd,
                      volumeUsd24Hr: asset.volumeUsd24Hr,
                      priceUsd: asset.priceUsd,
                      changePercent24Hr: asset.changePercent24Hr,
                      vwap24Hr: asset.vwap24Hr,
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => Divider(),
            );
          } else if (state is CryptoEmpty) {
            return const Center(child: Text('Nenhum crypto encontrado.'));
          } else if (state is CryptoError) {
            return Center(child: Text(state.message));
          }
          return const LimitedBox();
        },
      ),
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
