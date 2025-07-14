import 'package:candy_shop_mvvm/cart_view_model.dart';
import 'package:candy_shop_mvvm/cart_view_model_provider.dart';
import 'package:candy_shop_mvvm/widgets/cart_list_item.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late final CartViewModel _cartViewModel;
  @override
  void initState() {
    super.initState();
    _cartViewModel = CartViewModelProvider.read(context);
    _cartViewModel.addListener(_onCartViewModelStateChanged);
  }

  @override
  void dispose() {
    _cartViewModel.removeListener(_onCartViewModelStateChanged);
    super.dispose();
  }

  void _onCartViewModelStateChanged() {
    if (_cartViewModel.state.error != null) {
      _cartViewModel.clearError();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${_cartViewModel.state.error!.toString()}'),
          duration: const Duration(seconds: 2),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: _cartViewModel,
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
                    'Total: ${_cartViewModel.state.totalPrice.toStringAsFixed(2)}₺',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Items: ${_cartViewModel.state.totalItems}',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
          body: ListView.builder(
            itemCount: _cartViewModel.state.cart.length,
            itemBuilder: (context, index) {
              final cartItem = _cartViewModel.state.cart.values.elementAt(
                index,
              );
              return CartListItem(
                cart: cartItem,
                add: () {
                  _cartViewModel.addToCart(cartItem.product);
                },
                remove: () {
                  _cartViewModel.removeFromCart(cartItem);
                },
              );
            },
          ),
        );
      },
    );
  }
}
