import 'package:flutter/material.dart';
import 'editor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flatzon Editor',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: EditorPage(),
    );
  }
}
