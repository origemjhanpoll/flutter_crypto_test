import 'package:flutter/material.dart';
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
  int _selectedIndex = 0;

  void _onNavigationTapped(int index) {
    _pageController.animateToPage(
      index,
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: [HomePage(), FavoritesPage()],
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: _selectedIndex,
        onTap: (index) => _onNavigationTapped(index),
      ),
    );
  }
}
