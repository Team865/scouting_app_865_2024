import 'package:flutter/material.dart';
import 'package:scouting_app_865_2024/compnenets/text-field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomTextField(labelText: 'Hello'),
      ),
    );
  }
}
