import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/product.dart';
import '../state/auth_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.authState});

  final AuthState authState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout',
            onPressed: () {
              authState.logout();
              context.go('/login');
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Halo, ${authState.username}!',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: 4),
          const Text('Produk pilihan untuk Anda:'),
          const SizedBox(height: 12),
          for (final product in dummyProducts)
            Card(
              child: ListTile(
                leading: const Icon(Icons.shopping_bag),
                title: Text(product.name),
                subtitle: Text(product.formattedPrice),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.go('/home/product/${product.id}'),
              ),
            ),
        ],
      ),
    );
  }
}