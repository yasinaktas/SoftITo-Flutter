import 'package:counter_app_with_vanilla_state/counter_notifier.dart';
import 'package:flutter/widgets.dart';

class CounterNotifierProvider extends InheritedWidget {
  final CounterNotifier counterNotifier;

  const CounterNotifierProvider({
    required super.child,
    required this.counterNotifier,
    super.key,
  });

  static CounterNotifierProvider of(BuildContext context) {
    final provider = context.dependOnInheritedWidgetOfExactType<CounterNotifierProvider>();
    if (provider == null) {
      throw Exception('CounterNotifierProvider not found in context');
    }
    return provider;
  }

  @override
  bool updateShouldNotify(CounterNotifierProvider oldWidget) {
    return counterNotifier != oldWidget.counterNotifier;
  }
}
