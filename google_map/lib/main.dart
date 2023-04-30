import 'package:flutter/material.dart';
import 'package:google_map/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title:'Google Map',
      home: Home(),
    );
  }
}