import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_crypto_test/app/views/atoms/asset_icon_widget.dart';
import 'package:flutter_crypto_test/app/viewmodel/cryptos/cryptos_cubit.dart';
import 'package:flutter_crypto_test/core/utils/format_price.dart';

class AssetWidget extends StatefulWidget {
  final CryptosCubit cubit;
  final String id;
  final String rank;
  final String symbol;
  final String name;
  final String supply;
  final String? maxSupply;
  final String? marketCapUsd;
  final String? volumeUsd24Hr;
  final String priceUsd;
  final String? changePercent24Hr;
  final String? vwap24Hr;

  const AssetWidget({
    super.key,
    required this.cubit,
    required this.id,
    required this.rank,
    required this.symbol,
    required this.name,
    required this.supply,
    this.maxSupply,
    this.marketCapUsd,
    this.volumeUsd24Hr,
    required this.priceUsd,
    this.changePercent24Hr,
    this.vwap24Hr,
  });

  @override
  State<AssetWidget> createState() => _AssetWidgetState();
}

class _AssetWidgetState extends State<AssetWidget> {
  late ValueNotifier<String> _priceNotifier;
  late StreamSubscription<Map<String, String>> _priceSubscription;

  @override
  void initState() {
    super.initState();
    _priceNotifier = ValueNotifier(widget.priceUsd);

    _priceSubscription = widget.cubit.allPricesStream.listen((prices) {
      final newPrice = prices[widget.id] ?? widget.priceUsd;
      if (_priceNotifier.value != newPrice) {
        _priceNotifier.value = newPrice;
      }
    });
  }

  @override
  void dispose() {
    _priceSubscription.cancel();
    _priceNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      leading: AssetIconWidget(symbol: widget.symbol),
      title: Text(
        widget.symbol,
        style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        widget.name,
        style: theme.textTheme.bodyMedium!.copyWith(color: theme.dividerColor),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ValueListenableBuilder<String>(
            valueListenable: _priceNotifier,
            builder: (context, price, child) {
              return Text(
                '\$${formatPrice(double.parse(price))}',
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
          if (widget.changePercent24Hr != null)
            Text(
              '${double.parse(widget.changePercent24Hr!) > 0 ? '▲' : '▼'} ${double.parse(widget.changePercent24Hr!).toStringAsFixed(2)}%',
              style: theme.textTheme.labelMedium!.copyWith(
                color:
                    double.parse(widget.changePercent24Hr!) >= 0
                        ? Colors.green
                        : Colors.red,
              ),
            ),
        ],
      ),
    );
  }
}
