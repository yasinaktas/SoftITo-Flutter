import 'package:candy_shop_mvvm/cart_view_model_provider.dart';
import 'package:candy_shop_mvvm/models/product.dart';
import 'package:flutter/material.dart';

class ProductListItem extends StatelessWidget {
  final Product product;
  const ProductListItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final cartNotifier = CartViewModelProvider.of(context);
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300, width: 1),
        ),
      ),
      child: ListTile(
        title: Text(product.title),
        subtitle: Text(product.description),
        leading: CircleAvatar(
          radius: 30,
          child: Text("${product.price.toStringAsFixed(1)}₺"),
        ),
        trailing: IconButton(
          onPressed: () {
            cartNotifier.addToCart(product);
          },
          icon: Icon(Icons.add),
        ),
      ),
    );
  }
}
