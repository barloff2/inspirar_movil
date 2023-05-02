import 'package:flutter/material.dart';
import 'src/arbol.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tarea',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const arbol(),
    );
  }
}
