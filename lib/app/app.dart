import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_crypto_test/app/injection.dart';
import 'package:flutter_crypto_test/app/viewmodel/cryptos/cryptos_cubit.dart';
import 'package:flutter_crypto_test/app/viewmodel/favorites/favorite_cubit.dart';
import 'package:flutter_crypto_test/app/viewmodel/price/price_cubit.dart';
import 'package:flutter_crypto_test/app/views/pages/favorites_page.dart';
import 'package:flutter_crypto_test/app/views/pages/home_page.dart';
import 'package:flutter_crypto_test/core/shared/bottom_navigation_bar_widget.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final PageController _pageController = PageController();
  late CryptosCubit _cryptosCubit;
  late FavoriteCubit _favoriteCubit;
  late PriceCubit _priceCubit;
  int _selectedIndex = 0;

  void _onNavigationTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    _cryptosCubit = di<CryptosCubit>();
    _priceCubit = di<PriceCubit>();
    _favoriteCubit = di<FavoriteCubit>();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _cryptosCubit.close();
    _priceCubit.close();
    _favoriteCubit.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider<CryptosCubit>.value(value: _cryptosCubit),
          BlocProvider<PriceCubit>.value(value: _priceCubit),
          BlocProvider<FavoriteCubit>.value(value: _favoriteCubit),
        ],
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: [HomePage(), FavoritesPage()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: _selectedIndex,
        onTap: (index) => _onNavigationTapped(index),
      ),
    );
  }
}
