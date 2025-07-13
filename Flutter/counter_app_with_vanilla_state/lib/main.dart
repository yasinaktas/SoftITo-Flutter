import 'package:counter_app_with_vanilla_state/counter_notifier.dart';
import 'package:counter_app_with_vanilla_state/counter_notifier_provider.dart';
import 'package:counter_app_with_vanilla_state/increase_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CounterNotifierProvider(
      counterNotifier: CounterNotifier(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IncreasePage(),
      ),
    );
  }
}
