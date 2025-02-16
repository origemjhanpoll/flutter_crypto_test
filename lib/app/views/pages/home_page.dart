import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crypto_test/app/injection.dart';
import 'package:flutter_crypto_test/app/viewmodel/cryptos/cryptos_cubit.dart';
import 'package:flutter_crypto_test/app/viewmodel/cryptos/cryptos_state.dart';
import 'package:flutter_crypto_test/app/viewmodel/price/price_cubit.dart';
import 'package:flutter_crypto_test/app/views/molecules/asset_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late TextEditingController _controller;
  late FocusNode _focusNode;

  late CryptosCubit _cubit;
  late PriceCubit _priceCubit;

  Timer? _debounce;

  @override
  void initState() {
    _cubit = di<CryptosCubit>()..load();
    _priceCubit = di<PriceCubit>();
    _controller = TextEditingController();
    _focusNode = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    _priceCubit.close();
    super.dispose();
  }

  void _onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      _cubit.load(query: value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBar(
          focusNode: _focusNode,
          controller: _controller,
          onTapOutside: (_) => _focusNode.unfocus(),
          onSubmitted: (_) => _cubit.load(query: _controller.text),
          leading: Icon(Icons.search),
          constraints: BoxConstraints.tight(Size.fromHeight(40)),
          onChanged: (value) => _onSearchChanged(value),
          trailing: [
            ValueListenableBuilder(
              valueListenable: _controller,
              builder: (context, value, child) {
                if (value.text.isNotEmpty) {
                  return IconButton(
                    onPressed: () {
                      _controller.clear();
                      _cubit.load();
                    },
                    icon: Icon(Icons.close),
                  );
                } else {
                  return LimitedBox();
                }
              },
            ),
          ],
        ),
      ),
      body: BlocConsumer<CryptosCubit, CryptosState>(
        bloc: _cubit,
        listener: (context, state) {
          if (state is CryptoSuccess) {
            _priceCubit.startPriceUpdates();
          }
        },
        builder: (context, state) {
          if (state is CryptoLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CryptoSuccess) {
            return ListView.separated(
              itemCount: state.cryptos.length,
              itemBuilder: (context, index) {
                final asset = state.cryptos[index];

                return AssetWidget(
                  onTap: (id) => () {},
                  bloc: _priceCubit,
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
              separatorBuilder: (context, index) => Divider(),
            );
          } else if (state is CryptoEmpty) {
            return const Center(
              child: Text(
                'Nenhum crypto encontrado.',
                textAlign: TextAlign.center,
              ),
            );
          } else if (state is CryptoError) {
            return Center(
              child: Text(state.message, textAlign: TextAlign.center),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
