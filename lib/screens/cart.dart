import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/providers/cart.dart';
import 'package:provider_test/providers/user.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final cartProvider = Provider.of<CartProvider>(context);
    return Consumer2<CartProvider, UserProvider>(
        builder: (_, cartValue, userValue, child) {
      return Scaffold(
        appBar: AppBar(title: const Text('Cart Screen')),
        body: Center(
          child: Text(
            '${userValue.name}, You have ${cartValue.quantity} products in your cart!',
            style: const TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              heroTag: 'removeFromCart',
              onPressed: cartValue.removeFromCart,
              tooltip: 'Remove from Cart',
              child: const Icon(Icons.remove),
            ),
            const SizedBox(width: 10),
            FloatingActionButton(
              heroTag: 'addToCart',
              onPressed: cartValue.addToCart,
              tooltip: 'Add to Cart',
              child: const Icon(Icons.add),
            ),
          ],
        ),
      );
    });
  }
}
