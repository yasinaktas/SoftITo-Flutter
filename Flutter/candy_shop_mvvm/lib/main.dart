import 'package:candy_shop_mvvm/cart_view_model.dart';
import 'package:candy_shop_mvvm/cart_view_model_provider.dart';
import 'package:candy_shop_mvvm/pages/products_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CartViewModelProvider(
      cartViewModel: CartViewModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ProductsPage(),
      ),
    );
  }
}
