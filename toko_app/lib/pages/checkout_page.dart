import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/product.dart';
import '../state/cart_state.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({super.key, required this.cartState});

  final CartState cartState;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Jumlah barang: ${cartState.count}'),
            const SizedBox(height: 8),
            Text(
              'Total bayar: ${formatRupiah(cartState.total)}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () {
                  cartState.clear();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Pembayaran berhasil. Terima kasih!'),
                    ),
                  );
                  context.go('/cart');
                },
                child: const Text('Bayar Sekarang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}