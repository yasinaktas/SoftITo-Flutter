import 'package:counter_app_with_vanilla_state/counter_notifier_provider.dart';
import 'package:flutter/material.dart';

class DecreasePage extends StatelessWidget {
  const DecreasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterNotifier = CounterNotifierProvider.of(context).counterNotifier;
    return ListenableBuilder(
      listenable: counterNotifier,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Decrease Page'),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Divider(height: 1.0, color: Colors.grey.shade300),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              counterNotifier.decrement();
            },
            child: Icon(Icons.remove),
          ),
          body: Center(
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Counter: ${counterNotifier.counter}",
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                Text(
                  "Total Clicks Dec: ${counterNotifier.totalClicksDecrement}",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
