import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final ValueChanged<int>? onTap;
  final int currentIndex;
  const BottomNavigationBarWidget({
    super.key,
    this.onTap,
    this.currentIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      selectedItemColor: theme.colorScheme.primary,
      unselectedItemColor: theme.colorScheme.secondary,
      items: [
        BottomNavigationBarItem(label: 'Criptos', icon: Icon(Icons.token)),
        BottomNavigationBarItem(label: 'Favoritos', icon: Icon(Icons.favorite)),
      ],
    );
  }
}
