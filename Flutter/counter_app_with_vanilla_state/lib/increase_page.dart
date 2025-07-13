import 'package:counter_app_with_vanilla_state/counter_notifier_provider.dart';
import 'package:counter_app_with_vanilla_state/decrease_page.dart';
import 'package:flutter/material.dart';

class IncreasePage extends StatelessWidget {
  const IncreasePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterNotifier = CounterNotifierProvider.of(context).counterNotifier;
    return ListenableBuilder(
      listenable: counterNotifier,
      builder: (context, _) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Increase Page'),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(1.0),
              child: Divider(height: 1.0, color: Colors.grey.shade300),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              counterNotifier.increment();
            },
            child: Icon(Icons.add),
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
                  "Total Clicks Inc: ${counterNotifier.totalClicksIncrement}",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DecreasePage(),
                      ),
                    );
                  },
                  child: Text("Go to Decrease Page"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
