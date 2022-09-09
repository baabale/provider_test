import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/providers/cart.dart';
import 'package:provider_test/providers/user.dart';

import 'cart.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final cartProvider = Provider.of<CartProvider>(context);
    return Consumer2<CartProvider, UserProvider>(
      builder: (context, cartValue, userValue, child) => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            Badge(
              position: BadgePosition.topEnd(end: 2, top: 5),
              badgeContent: Text(
                '${cartValue.quantity}',
                style: const TextStyle(color: Colors.white),
              ),
              child: IconButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartScreen()),
                ),
                icon: const Icon(Icons.shopping_basket_rounded),
              ),
            )
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                '${userValue.name}, You have pushed the button this many times:',
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              Text(
                '${cartValue.quantity}',
                style: Theme.of(context).textTheme.headline4,
              ),
            ],
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
      ),
    );
  }
}
