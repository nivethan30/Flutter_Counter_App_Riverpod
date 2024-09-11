import 'package:counter_riverpod/provider/counter_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/button.dart';

final counterNotifierProvider =
    StateNotifierProvider<CounterStateNotifier, int>(
        (ref) => CounterStateNotifier());

class CounterNotifier extends ConsumerWidget {
  const CounterNotifier({super.key});

  @override

  /// A [Scaffold] that displays the current value of the counter notifier
  /// and provides buttons to increment, decrement and reset the counter.
  ///
  /// This widget is intended to be used in a [MaterialApp] as the home
  /// widget.
  ///
  /// The [context] parameter is passed to the [Scaffold] constructor.
  ///
  /// The [ref] parameter is used to watch the [counterNotifierProvider]
  /// and read the current value of the counter notifier.
  Widget build(BuildContext context, WidgetRef ref) {
    final int counter = ref.watch(counterNotifierProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter With State Notifier Provider'),
        ),
        body: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: 'Counter Value is :\n ',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.normal),
                children: [
                  TextSpan(
                      text: '$counter',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                          fontWeight: FontWeight.bold))
                ]),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              floatingActionButtons(
                heroTag: 'decrement',
                tooltip: "Decrease Count",
                iconData: Icons.remove,
                onPressed: counter == 0
                    ? null
                    : () {
                        ref.read(counterNotifierProvider.notifier).decrement();
                      },
              ),
              const SizedBox(width: 10),
              floatingActionButtons(
                  heroTag: 'reset',
                  tooltip: "Reset Count",
                  iconData: Icons.refresh,
                  onPressed: counter == 0
                      ? null
                      : () {
                          ref.read(counterNotifierProvider.notifier).reset();
                        }),
              const SizedBox(width: 10),
              floatingActionButtons(
                  heroTag: 'increment',
                  tooltip: "Increase Count",
                  iconData: Icons.add,
                  onPressed: () {
                    ref.read(counterNotifierProvider.notifier).increment();
                  })
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
