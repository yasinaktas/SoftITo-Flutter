import 'package:flutter/material.dart';
import 'package:vanilla_state_management/cart_notifier_provider.dart';
import 'package:vanilla_state_management/models/cart.dart';
import 'package:vanilla_state_management/models/product.dart';
import 'package:vanilla_state_management/pages/cart_page.dart';
import 'package:vanilla_state_management/widgets/product_list_item.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({super.key});

  final List<Product> products = [
    Product(
      title: 'Product 1',
      description: 'Description 1',
      price: 29.99,
      id: '1',
    ),
    Product(
      title: 'Product 2',
      description: 'Description 2',
      price: 19.99,
      id: '2',
    ),
    Product(
      title: 'Product 3',
      description: 'Description 3',
      price: 39.99,
      id: '3',
    ),
    Product(
      title: 'Product 4',
      description: 'Description 4',
      price: 49.99,
      id: '4',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final cartNotifier = CartNotifierProvider.of(context);
    return ListenableBuilder(
      listenable: cartNotifier,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Products'),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: Divider(color: Colors.grey.shade300),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CartPage()),
              );
            },
            child: Text(
              _getCartItemCount(
                CartNotifierProvider.of(context).items,
              ).toString(),
              style: TextStyle(fontSize: 20),
            ),
          ),
          body: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return ProductListItem(product: products[index]);
            },
          ),
        );
      },
    );
  }

  int _getCartItemCount(List<Cart> items) {
    return items.fold(0, (sum, item) => sum + item.quantity);
  }
}
