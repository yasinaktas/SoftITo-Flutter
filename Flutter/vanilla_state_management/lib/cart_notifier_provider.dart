import 'package:flutter/widgets.dart';
import 'package:vanilla_state_management/cart_notifier.dart';

class CartNotifierProvider extends InheritedWidget {
  final CartNotifier cartNotifier;
  const CartNotifierProvider({
    super.key,
    required super.child,
    required this.cartNotifier,
  });

  static CartNotifier of(BuildContext context) {
    final provider = context
        .dependOnInheritedWidgetOfExactType<CartNotifierProvider>();
    if (provider == null) {
      throw Exception('CartNotifierProvider not found in context');
    }
    return provider.cartNotifier;
  }

  @override
  bool updateShouldNotify(CartNotifierProvider oldWidget) {
    return cartNotifier != oldWidget.cartNotifier;
  }
}
