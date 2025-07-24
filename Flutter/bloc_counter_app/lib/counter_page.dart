import 'package:bloc_counter_app/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeBloc counterBloc = BlocProvider.of<HomeBloc>(context);
    return BlocBuilder<HomeBloc, CounterState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text("BloC Counter App"),
            centerTitle: true,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(1),
              child: Divider(color: Colors.grey.shade200, height: 0),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  counterBloc.add(CounterResetPressed());
                },
                icon: Icon(Icons.exposure_zero),
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              counterBloc.add(CounterIncrementPressed());
            },
            child: Icon(Icons.add, color: Colors.black),
          ),
          body: Column(
            children: [
              Visibility(
                visible: state.queue.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(),
                      ),
                      SizedBox(width: 16),
                      Text("Arttırılıyor..."),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Counter: ${state.counter}",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
