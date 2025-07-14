import 'package:candy_shop_mvvm/models/cart.dart';

class CartInfo {
  final Map<String, Cart> cart;
  double totalPrice;
  int totalItems;

  CartInfo({
    required this.cart,
    required this.totalPrice,
    required this.totalItems,
  });
}
