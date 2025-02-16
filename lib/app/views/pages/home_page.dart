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
    _cubit.load(query: '');
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
            return ListView.builder(
              itemCount: state.cryptos.length,
              itemBuilder: (context, index) {
                final asset = state.cryptos[index];

                return AssetWidget(
                  cubit: _cubit,
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
                );
              },
            );
          } else if (state is CryptoEmpty) {
            return const Center(child: Text('Nenhum crypto encontrado.'));
          } else if (state is CryptoError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
