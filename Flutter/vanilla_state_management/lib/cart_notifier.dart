import 'package:flutter/material.dart';
import 'package:vanilla_state_management/models/cart.dart';
import 'package:vanilla_state_management/models/product.dart';

class CartNotifier extends ChangeNotifier {
  final Map<String, Cart> _cart = {};
  double _totalPrice = 0;
  int _totalItems = 0;

  List<Cart> get items => _cart.values.toList();
  double get totalPrice => _totalPrice;
  int get totalItems => _totalItems;

  void addToCart(Product product) {
    if (_cart.containsKey(product.id)) {
      _cart[product.id]!.quantity++;
    } else {
      _cart[product.id] = Cart(product: product);
    }
    calculateTotal();
    notifyListeners();
  }

  void removeFromCart(Cart cartItem) {
    if (cartItem.quantity > 1) {
      cartItem.quantity--;
      _cart[cartItem.product.id] = cartItem;
    } else {
      _cart.remove(cartItem.product.id);
    }
    calculateTotal();
    notifyListeners();
  }

  void calculateTotal() {
    _totalPrice = _cart.values.fold(
      0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );
    _totalItems = _cart.values.fold(0, (sum, item) => sum + item.quantity);
    notifyListeners();
  }
}
