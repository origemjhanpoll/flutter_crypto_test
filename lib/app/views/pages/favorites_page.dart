import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crypto_test/app/injection.dart';
import 'package:flutter_crypto_test/app/viewmodel/favorites/favorite_cubit.dart';
import 'package:flutter_crypto_test/app/viewmodel/favorites/favorite_state.dart';
import 'package:flutter_crypto_test/app/viewmodel/price/price_cubit.dart';
import 'package:flutter_crypto_test/app/views/molecules/asset_widget.dart';
import 'package:flutter_crypto_test/app/views/pages/details_page.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  late FavoriteCubit _favoriteCubit;
  late PriceCubit _priceCubit;

  final showDelete = ValueNotifier<bool>(false);

  @override
  void initState() {
    _favoriteCubit = di<FavoriteCubit>()..load();
    _priceCubit = di<PriceCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _favoriteCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Seus Favoritos'),
        actions: [
          IconButton(
            color: theme.colorScheme.primary,
            onPressed: () {
              showDelete.value = !showDelete.value;
            },
            icon: ValueListenableBuilder(
              valueListenable: showDelete,
              builder: (context, show, child) {
                return Icon(show ? Icons.close : Icons.delete);
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        bottom: false,
        child: BlocConsumer<FavoriteCubit, FavoriteState>(
          bloc: _favoriteCubit,
          listener: (context, state) {
            if (state is FavoriteSuccess) {
              final ids = state.favorites.map((element) => element.id).toList();
              _priceCubit.startPriceUpdates(ids: ids);
            }
          },
          builder: (context, state) {
            if (state is FavoriteLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is FavoriteSuccess) {
              return ListView.separated(
                itemCount: state.favorites.length,
                itemBuilder: (context, index) {
                  final favorite = state.favorites[index];

                  return Row(
                    children: [
                      Flexible(
                        child: AssetWidget(
                          onTap:
                              () => {
                                Navigator.of(context)
                                    .push(
                                      MaterialPageRoute(
                                        builder:
                                            (_) => DetailsPage(asset: favorite),
                                      ),
                                    )
                                    .whenComplete(() {
                                      _favoriteCubit.load();
                                      if (showDelete.value) {
                                        showDelete.value = false;
                                      }
                                    }),
                              },
                          bloc: _priceCubit,
                          id: favorite.id,
                          rank: favorite.rank,
                          symbol: favorite.symbol,
                          name: favorite.name,
                          supply: favorite.supply,
                          maxSupply: favorite.maxSupply,
                          marketCapUsd: favorite.marketCapUsd,
                          volumeUsd24Hr: favorite.volumeUsd24Hr,
                          priceUsd: favorite.priceUsd,
                          changePercent24Hr: favorite.changePercent24Hr,
                          vwap24Hr: favorite.vwap24Hr,
                        ),
                      ),
                      ValueListenableBuilder(
                        valueListenable: showDelete,
                        builder: (context, show, child) {
                          if (show) {
                            return IconButton.filledTonal(
                              onPressed: () {
                                _favoriteCubit.remove(favorite);
                              },
                              icon: Icon(Icons.delete_forever),
                            );
                          } else {
                            return LimitedBox();
                          }
                        },
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => Divider(),
              );
            } else if (state is FavoriteEmpty) {
              return const Center(
                child: Text(
                  'Nenhum crypto encontrado.',
                  textAlign: TextAlign.center,
                ),
              );
            } else if (state is FavoriteError) {
              return Center(
                child: Text(state.message, textAlign: TextAlign.center),
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
