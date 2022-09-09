import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/providers/cart.dart';
import 'package:provider_test/providers/user.dart';
import 'package:provider_test/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: CartProvider()),
        ChangeNotifierProvider.value(value: UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Provider Test App',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const HomeScreen(title: 'Home Screen'),
      ),
    );
  }
}
