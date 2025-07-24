import 'package:bloc_counter_app/counter_page.dart';
import 'package:bloc_counter_app/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// flutter_bloc paketi eklendi
// bloc extension eklendi (tek seferlik)
// home klasörü eklendi (lib içinde)
// home sağ tık -> new bloc -> adı home

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(create: (context)=>HomeBloc(),child: CounterPage(),)
    );
  }
}