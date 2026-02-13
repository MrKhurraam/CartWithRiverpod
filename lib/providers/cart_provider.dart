

import 'package:cart_with_riverpod/models/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends Notifier<Set<Product>>{

  /// By default we have empty cart
  Set<Product> build(){
    return {};
  }

  /// Below state is the default Set<Product>
  void addToCart(Product product){
    state.add(product);
  }

  void removeFromCart(Product product){
    state.remove(product);
  }
}


final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>((){
  return CartNotifier();
});