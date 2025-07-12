import 'package:flutter/material.dart';
import 'package:vanilla_state_management/cart_notifier_provider.dart';
import 'package:vanilla_state_management/widgets/cart_list_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cartNotifier = CartNotifierProvider.of(context);
    return ListenableBuilder(
      listenable: cartNotifier,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Cart'),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: Divider(color: Colors.grey.shade300),
            ),
          ),
          bottomNavigationBar: BottomAppBar(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total: ${cartNotifier.totalPrice.toStringAsFixed(2)}₺',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Items: ${cartNotifier.totalItems}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          body: ListView.builder(
            itemCount: cartNotifier.items.length,
            itemBuilder: (context, index) {
              final cartItem = cartNotifier.items.elementAt(index);
              return CartListItem(
                cart: cartItem,
                add: () {
                  cartNotifier.addToCart(cartItem.product);
                },
                remove: () {
                  cartNotifier.removeFromCart(cartItem);
                },
              );
            },
          ),
        );
      },
    );
  }
}
