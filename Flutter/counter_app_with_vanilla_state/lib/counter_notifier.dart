import 'package:flutter/material.dart';

class CounterNotifier extends ChangeNotifier {
  int _counter = 0;
  int _totalClicksIncrement = 0;
  int _totalClicksDecrement = 0;

  int get counter => _counter;
  int get totalClicks => _totalClicksIncrement + _totalClicksDecrement;
  int get totalClicksIncrement => _totalClicksIncrement;
  int get totalClicksDecrement => _totalClicksDecrement;

  void increment() {
    _counter++;
    _totalClicksIncrement++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    _totalClicksDecrement++;
    notifyListeners();
  }
}
