import 'package:flutter/widgets.dart';
import 'package:vanilla_state_management/cart_notifier.dart';

class CartNotifierProvider extends InheritedWidget {
  final CartNotifier cartNotifier;
  const CartNotifierProvider({super.key, required super.child, required this.cartNotifier});

  static CartNotifier of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CartNotifierProvider>()!.cartNotifier;
  }

  @override
  bool updateShouldNotify(CartNotifierProvider oldWidget) {
    return cartNotifier != oldWidget.cartNotifier;
  }

}