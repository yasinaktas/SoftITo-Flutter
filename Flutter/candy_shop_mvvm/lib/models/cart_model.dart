import 'dart:async';

import 'package:candy_shop_mvvm/models/cart.dart';
import 'package:candy_shop_mvvm/models/cart_info.dart';
import 'package:candy_shop_mvvm/models/product.dart';

class CartModel {
  final CartInfo _cartInfo = CartInfo(cart: {}, totalPrice: 0, totalItems: 0);
  CartInfo get cartInfo => _cartInfo;

  final StreamController<CartInfo> _cartInfoController = StreamController<CartInfo>();
  Stream<CartInfo> get cartInfoStream => _cartInfoController.stream;
  Future<CartInfo> get cartInfoFuture async {
    return _cartInfo;
  }

  Future<void> addToCart(Product product) async {
    await Future.delayed(Duration(seconds: 3)); // Simulate network delay
    if (_cartInfo.cart.containsKey(product.id)) {
      _cartInfo.cart[product.id]!.quantity++;
    } else {
      _cartInfo.cart[product.id] = Cart(product: product);
    }
    calculateTotal();
    _cartInfoController.add(_cartInfo);
  }

  Future<void> removeFromCart(Cart cartItem) async {
    await Future.delayed(Duration(seconds: 3)); // Simulate network delay
    if (cartItem.quantity > 1) {
      cartItem.quantity--;
      _cartInfo.cart[cartItem.product.id] = cartItem;
    } else {
      _cartInfo.cart.remove(cartItem.product.id);
    }
    calculateTotal();
    _cartInfoController.add(_cartInfo);
  }

  void calculateTotal() {
    _cartInfo.totalPrice = _cartInfo.cart.values.fold(
      0,
      (sum, item) => sum + (item.product.price * item.quantity),
    );
    _cartInfo.totalItems = _cartInfo.cart.values.fold(0, (sum, item) => sum + item.quantity);
  }

  void dispose() {
    _cartInfoController.close();
  }
}
