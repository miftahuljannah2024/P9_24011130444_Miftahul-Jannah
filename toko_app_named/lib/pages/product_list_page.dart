import 'package:flutter/material.dart';
import '../models/product.dart';
import '../routes/app_routes.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({super.key});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final List<Product> _cart = [];

  Future<void> _openDetail(Product product) async {
    final result = await Navigator.pushNamed(
      context,
      AppRoutes.productDetail,
      arguments: product,
    );

    if (!mounted) return;
    if (result is! Product) return;

    setState(() => _cart.add(result));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${result.name} ditambahkan ke keranjang')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Produk'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Badge(
              label: Text('${_cart.length}'),
              isLabelVisible: _cart.isNotEmpty,
              child: const Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: ListView.separated(
        itemCount: dummyProducts.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          final product = dummyProducts[index];
          return ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                product.imageUrl,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const SizedBox(
                  width: 56,
                  height: 56,
                  child: Icon(Icons.image_not_supported),
                ),
              ),
            ),
            title: Text(product.name),
            subtitle: Text(product.formattedPrice),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _openDetail(product),
          );
        },
      ),
    );
  }
}