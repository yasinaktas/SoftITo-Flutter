import 'package:candy_shop_mvvm/models/cart.dart';

class CartState {
  final Map<String, Cart> cart;
  final double totalPrice;
  final int totalItems;
  final bool isLoading;
  final Exception? error;

  CartState({
    required this.cart,
    required this.totalPrice,
    required this.totalItems,
    this.isLoading = false,
    this.error,
  });

  CartState copyWith({
    Map<String, Cart>? cart,
    double? totalPrice,
    int? totalItems,
    bool? isLoading,
    Exception? error,
  }) {
    return CartState(
      cart: cart ?? this.cart,
      totalPrice: totalPrice ?? this.totalPrice,
      totalItems: totalItems ?? this.totalItems,
      isLoading: isLoading ?? this.isLoading,
      error: error ?? this.error,
    );
  }
}