import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crypto_test/app/viewmodel/price/price_cubit.dart';
import 'package:flutter_crypto_test/app/views/atoms/asset_icon_widget.dart';
import 'package:flutter_crypto_test/core/utils/format_price.dart';

class AssetWidget extends StatelessWidget {
  final PriceCubit bloc;
  final String id;
  final String rank;
  final String symbol;
  final String name;
  final String? supply;
  final String? maxSupply;
  final String? marketCapUsd;
  final String? volumeUsd24Hr;
  final String priceUsd;
  final String? changePercent24Hr;
  final String? vwap24Hr;

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
    required this.priceUsd,
    this.changePercent24Hr,
    this.vwap24Hr,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      dense: true,
      visualDensity: VisualDensity.compact,
      leading: AssetIconWidget(symbol: symbol),
      title: Text(
        symbol,
        style: theme.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        name,
        style: theme.textTheme.bodyMedium!.copyWith(color: theme.dividerColor),
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<PriceCubit, Map<String, String>>(
            bloc: bloc,
            builder: (context, prices) {
              final price = prices[id] ?? priceUsd;
              return Text(
                '\$${formatPrice(double.parse(price))}',
                style: theme.textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              );
            },
          ),
          if (changePercent24Hr != null)
            Text(
              '${double.parse(changePercent24Hr!) > 0 ? '▲' : '▼'} ${double.parse(changePercent24Hr!).toStringAsFixed(2)}%',
              style: theme.textTheme.labelMedium!.copyWith(
                color:
                    double.parse(changePercent24Hr!) >= 0
                        ? Colors.green
                        : Colors.red,
              ),
            ),
        ],
      ),
    );
  }
}
