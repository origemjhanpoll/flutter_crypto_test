import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class LocalService {
  static const String _keyFavorites = 'assets';

  Future<void> saveFavorite(String asset) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favorites = prefs.getStringList(_keyFavorites) ?? [];

    if (!favorites.contains(asset)) {
      favorites.add(asset);
      await prefs.setStringList(_keyFavorites, favorites);
    }
  }

  Future<void> removeFavorite(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> favorites = prefs.getStringList(_keyFavorites) ?? [];

    String? itemToRemove;
    for (var item in favorites) {
      final decodedItem = jsonDecode(item) as Map<String, dynamic>;
      if (decodedItem['id'] == id) {
        itemToRemove = item;
        break;
      }
    }

    if (itemToRemove != null) {
      favorites.remove(itemToRemove);
      await prefs.setStringList(_keyFavorites, favorites);
    }
  }

  Future<List<String>> getFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_keyFavorites) ?? [];
  }
}
