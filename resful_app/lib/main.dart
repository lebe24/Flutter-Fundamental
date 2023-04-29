import 'package:flutter/material.dart';
import 'package:resful_app/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Restful',
      home: Home(),
    );
  }
}