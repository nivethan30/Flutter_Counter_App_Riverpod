import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterStateNotifier extends StateNotifier<int> {
  CounterStateNotifier() : super(0);

  void increment() => state++;

  void reset() => state = 0;

  /// Decrement the counter if it is greater than 0.
  ///
  /// If the counter is already 0, this does nothing.
  ///
  /// This is a no-op if the counter is already 0.
  void decrement() {
    if (state > 0) {
      state--;
    }
  }
}
