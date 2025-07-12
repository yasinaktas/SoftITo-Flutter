import 'package:flutter/material.dart';
import 'package:vanilla_state_management/cart_notifier.dart';
import 'package:vanilla_state_management/cart_notifier_provider.dart';
import 'package:vanilla_state_management/pages/products_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CartNotifierProvider(cartNotifier: CartNotifier(),child: MaterialApp(debugShowCheckedModeBanner: false, home: ProductsPage()));
  }
}
