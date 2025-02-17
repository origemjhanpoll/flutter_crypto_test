import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crypto_test/app/injection.dart';
import 'package:flutter_crypto_test/app/models/crypto_model.dart';
import 'package:flutter_crypto_test/app/viewmodel/markets/markets_cubit.dart';
import 'package:flutter_crypto_test/app/viewmodel/markets/markets_state.dart';
import 'package:flutter_crypto_test/app/views/atoms/asset_icon_widget.dart';
import 'package:flutter_crypto_test/core/constants/padding_size.dart';
import 'package:flutter_crypto_test/core/utils/format_price.dart';

class DetailsPage extends StatefulWidget {
  final CryptoModel asset;
  const DetailsPage({super.key, required this.asset});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  late MarketsCubit _cubit;

  @override
  void initState() {
    _cubit = di<MarketsCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BlocProvider(
      create: (context) => _cubit,
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: theme.colorScheme.primary),
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: PaddingSize.small,
            children: [
              AssetIconWidget(symbol: widget.asset.symbol, dimension: 28.0),
              Text(
                widget.asset.name,
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                widget.asset.symbol,
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(size: 28.0, Icons.add)),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            spacing: 1,
            children: [
              Padding(
                padding: EdgeInsets.all(PaddingSize.medium),
                child: Text(
                  'Estatísticas de moedas',
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              StatisticItem(labelStart: 'Rank', labelEnd: widget.asset.rank),
              if (widget.asset.marketCapUsd != null)
                StatisticItem(
                  labelStart: 'Valor de mercado',
                  labelEnd: formatPrice(
                    double.parse(widget.asset.marketCapUsd!),
                  ),
                ),
              if (widget.asset.vwap24Hr != null)
                StatisticItem(
                  labelStart: 'PMPV (24Hr)',
                  labelEnd: formatPrice(double.parse(widget.asset.vwap24Hr!)),
                ),
              if (widget.asset.supply != null)
                StatisticItem(
                  labelStart: 'Fornecimento',
                  labelEnd: formatPrice(double.parse(widget.asset.supply!)),
                ),
              if (widget.asset.volumeUsd24Hr != null)
                StatisticItem(
                  labelStart: 'Volume (24Hr)',
                  labelEnd:
                      '\$${formatMultPrices(double.parse(widget.asset.volumeUsd24Hr!))}',
                ),
              if (widget.asset.changePercent24Hr != null)
                StatisticItem(
                  labelStart: 'Volume (24Hr)',
                  labelEnd:
                      '${double.parse(widget.asset.changePercent24Hr!) > 0 ? '▲' : '▼'} ${double.parse(widget.asset.changePercent24Hr!).toStringAsFixed(2)}%',
                  colorEnd:
                      double.parse(widget.asset.changePercent24Hr!) >= 0
                          ? Colors.green
                          : Colors.red,
                ),
              Padding(
                padding: EdgeInsets.all(PaddingSize.medium),
                child: Text(
                  'Mercados disponíveis',
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Divider(height: 1),
              Padding(
                padding: EdgeInsets.all(PaddingSize.small),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Nome',
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Par',
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Volume (24Hr)',
                        textAlign: TextAlign.end,

                        style: theme.textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BlocBuilder<MarketsCubit, MarketsState>(
                bloc: _cubit..load(widget.asset.id),
                builder: (context, state) {
                  if (state is MarketLoading) {
                    return Padding(
                      padding: EdgeInsets.only(top: PaddingSize.extraLarge),
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is MarketSuccess) {
                    return ListView.separated(
                      primary: false,
                      itemCount: state.markets.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final market = state.markets[index];

                        return StatisticItem(
                          labelStart: market.exchangeId,
                          labelCenter:
                              '${market.baseSymbol}/${market.quoteSymbol}',
                          labelEnd: formatVolumeUsd(
                            double.parse(market.volumeUsd24Hr),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(height: 1),
                    );
                  } else if (state is MarketEmpty) {
                    return const Center(
                      child: Text(
                        'Nenhum crypto encontrado.',
                        textAlign: TextAlign.center,
                      ),
                    );
                  } else if (state is MarketError) {
                    return Center(
                      child: Text(state.message, textAlign: TextAlign.center),
                    );
                  }
                  return const LimitedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StatisticItem extends StatelessWidget {
  const StatisticItem({
    super.key,
    required this.labelStart,
    this.colorStart,
    this.labelCenter,
    this.colorCenter,
    this.labelEnd,
    this.colorEnd,
  });

  final String labelStart;
  final Color? colorStart;
  final String? labelCenter;
  final Color? colorCenter;
  final String? labelEnd;
  final Color? colorEnd;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DecoratedBox(
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer.withValues(alpha: 0.4),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: PaddingSize.small,
          horizontal: PaddingSize.medium,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: PaddingSize.small,
          children: [
            Expanded(
              child: Text(
                labelStart,
                style: theme.textTheme.bodyMedium!.copyWith(color: colorStart),
              ),
            ),
            if (labelCenter != null)
              Expanded(
                child: Text(
                  labelCenter!,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    color: colorCenter,
                  ),
                ),
              ),
            if (labelEnd != null)
              Expanded(
                child: Text(
                  labelEnd!,
                  textAlign: TextAlign.end,

                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorEnd,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
