import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../widgets/button.dart';

final counterStateProvider = StateProvider<int>((ref) => 0);

class CounterState extends ConsumerWidget {
  const CounterState({super.key});

  @override

  /// A [Scaffold] that displays the current value of the counter state
  /// and provides buttons to increment, decrement and reset the counter.
  ///
  /// This widget is intended to be used in a [MaterialApp] as the home
  /// widget.
  ///
  /// The [context] parameter is passed to the [Scaffold] constructor.
  ///
  /// The [ref] parameter is used to watch the [counterStateProvider]
  /// and read the current value of the counter state.
  Widget build(BuildContext context, WidgetRef ref) {
    final int counter = ref.watch(counterStateProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Counter With Direct State provider'),
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
                        ref.read(counterStateProvider.notifier).state--;
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
                          ref.read(counterStateProvider.notifier).state = 0;
                        }),
              const SizedBox(width: 10),
              floatingActionButtons(
                  heroTag: 'increment',
                  tooltip: "Increase Count",
                  iconData: Icons.add,
                  onPressed: () {
                    ref.read(counterStateProvider.notifier).state++;
                  })
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat);
  }
}
