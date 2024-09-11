import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'screens/counter_notifier.dart';
import 'screens/counter_state.dart';

void main() {
  /// The main entry point for the application.
  ///
  /// This function is the starting point for the entire application. It
  /// configures the ProviderScope and runs the MyApp widget.
  ///
  /// The ProviderScope is the root of the widget tree when using Riverpod.
  /// It is used to manage the state of the application.
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Returns the root widget of the application, which is a MaterialApp with the
    /// debug banner disabled and the home set to a MainApp widget.
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Returns the root widget of the MainApp, which is a Scaffold with the
    /// title of "Main App", and a body that contains a Column of two
    /// ElevatedButtons. The first button navigates to the CounterState screen
    /// and the second button navigates to the CounterNotifier screen.
    return Scaffold(
      appBar: AppBar(title: const Text('Main App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CounterState(),
                  ),
                );
              },
              child: const Text('Go To Counter App With State Provider'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CounterNotifier(),
                  ),
                );
              },
              child: const Text('Go To Counter App With State Notifier'),
            ),
          ],
        ),
      ),
    );
  }
}
