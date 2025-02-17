import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crypto_test/app/viewmodel/price/price_cubit.dart';
import 'package:flutter_crypto_test/app/views/atoms/asset_icon_widget.dart';
import 'package:flutter_crypto_test/core/utils/format_price.dart';

class AssetWidget extends StatefulWidget {
  final PriceCubit bloc;
  final String id;
  final String rank;
  final String symbol;
  final String name;
  final String? supply;
  final String? maxSupply;
  final String? marketCapUsd;
  final String? volumeUsd24Hr;
  final String? priceUsd;
  final String? changePercent24Hr;
  final String? vwap24Hr;
  final VoidCallback? onTap;

  const AssetWidget({
    super.key,
    required this.bloc,
    required this.id,
    required this.rank,
    required this.symbol,
    required this.name,
    required this.supply,
    this.maxSupply,
    this.marketCapUsd,
    this.volumeUsd24Hr,
    this.priceUsd,
    this.changePercent24Hr,
    this.vwap24Hr,
    this.onTap,
  });

  @override
  State<AssetWidget> createState() => _AssetWidgetState();
}

class _AssetWidgetState extends State<AssetWidget> {
  String? lastPrice;

  @override
  void initState() {
    lastPrice = widget.priceUsd;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      onTap: widget.onTap,
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
          BlocBuilder<PriceCubit, Map<String, String>>(
            bloc: widget.bloc,
            builder: (context, prices) {
              final price = prices[widget.id];

              if (price != null) {
                lastPrice = price;
              }

              return Text(
                lastPrice != null
                    ? '\$${formatMultPrices(double.parse(lastPrice!))}'
                    : '--',
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
