import 'package:flutter/material.dart';
import 'package:flutter_morning_ui/ui_0806.dart';
import 'package:flutter_morning_ui/ui_0819.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Home0819(),
    );
  }
}
