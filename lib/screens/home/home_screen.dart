import 'package:cart_with_riverpod/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:cart_with_riverpod/shared/cart_icon.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(allProductProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sale Products'),
        actions: const [CartIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: allProducts.length,
          gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder:(context, index) {
            final product = allProducts[index];
            return Container(
                padding: const EdgeInsets.all(20),
                color: Colors.blueGrey.withOpacity(0.05),
                child: Column(
                    children: [
                      Image.asset(product.image, width: 60, height: 60),
                      Text(product.title),
                      Text('\$${product.price}'),
                    ]
                )
            );
          },
        ),
      ),
    );
  }
}


