import 'package:flutter/material.dart';
import 'package:flutter_animations/reso_coder/basic_animation_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Ninja Trips',
      home: Home(),
    );
  }
}
