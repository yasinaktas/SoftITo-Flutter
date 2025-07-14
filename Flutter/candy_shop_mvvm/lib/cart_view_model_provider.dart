import 'package:candy_shop_mvvm/cart_view_model.dart';
import 'package:flutter/widgets.dart';

class CartViewModelProvider extends InheritedWidget {
  final CartViewModel cartViewModel;
  const CartViewModelProvider({
    super.key,
    required super.child,
    required this.cartViewModel,
  });

  static CartViewModel of(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<CartViewModelProvider>();
    if (provider == null) {
      throw Exception('CartViewModelProvider not found in context');
    }
    return provider.cartViewModel;
  }

  static CartViewModel read(BuildContext context) {
    final provider = context
        .getInheritedWidgetOfExactType<CartViewModelProvider>();
    if (provider == null) {
      throw Exception('CartViewModelProvider not found in context');
    }
    return provider.cartViewModel;
  }

  @override
  bool updateShouldNotify(CartViewModelProvider oldWidget) {
    return cartViewModel != oldWidget.cartViewModel;
  }
}
