import 'package:flutter/material.dart';

import './screens/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData(
      primarySwatch: Colors.deepPurple,
    );
    return MaterialApp(
      title: 'APOD',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
            secondary: const Color.fromARGB(255, 166, 58, 183),
            tertiary: const Color.fromARGB(255, 58, 75, 183)),
      ),
      home: Dashboard(),
    );
  }
}
