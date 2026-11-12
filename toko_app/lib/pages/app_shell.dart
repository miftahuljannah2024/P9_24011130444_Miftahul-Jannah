import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../state/cart_state.dart';

class AppShell extends StatelessWidget {
  const AppShell({
    super.key,
    required this.navigationShell,
    required this.cartState,
  });

  final StatefulNavigationShell navigationShell;
  final CartState cartState;

  void _onTabSelected(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: ListenableBuilder(
        listenable: cartState,
        builder: (context, child) => NavigationBar(
          selectedIndex: navigationShell.currentIndex,
          onDestinationSelected: _onTabSelected,
          destinations: [
            const NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            const NavigationDestination(
              icon: Icon(Icons.search),
              label: 'Cari',
            ),
            NavigationDestination(
              icon: Badge(
                label: Text('${cartState.count}'),
                isLabelVisible: cartState.count > 0,
                child: const Icon(Icons.shopping_cart),
              ),
              label: 'Keranjang',
            ),
            const NavigationDestination(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
      ),
    );
  }
}