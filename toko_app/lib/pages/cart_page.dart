import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/product.dart';
import '../state/cart_state.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key, required this.cartState});

  final CartState cartState;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: cartState,
      builder: (context, child) {
        final items = cartState.items;
        return Scaffold(
          appBar: AppBar(title: const Text('Keranjang')),
          body: items.isEmpty
              ? const Center(child: Text('Keranjang masih kosong'))
              : ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text(items[index].name),
                    subtitle: Text(items[index].formattedPrice),
                  ),
                ),
          bottomNavigationBar: items.isEmpty
              ? null
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: FilledButton(
                      onPressed: () => context.go('/cart/checkout'),
                      child: Text(
                        'Checkout (${formatRupiah(cartState.total)})',
                      ),
                    ),
                  ),
                ),
        );
      },
    );
  }
}