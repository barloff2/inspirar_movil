import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Pacifico'),
      home: const MyHomePage(title: 'Inspirar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _count = 0;

  void _incrementCounter() {
    setState(() {
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(mainAxisSpacing: 20.0, crossAxisCount: 3, children: [
        Container(
          child: Column(
            children: [
              Image.network('https://picsum.photos/200'),
              Text(
                'Image 1',
                style: TextStyle(fontFamily: 'Pacifico'),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.network('https://picsum.photos/200'),
              Text(
                'Image 2',
                style: TextStyle(fontFamily: 'Pacifico'),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.network('https://picsum.photos/200'),
              Text(
                'Image 3',
                style: TextStyle(fontFamily: 'Pacifico'),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.network('https://picsum.photos/200'),
              Text(
                'Image 4',
                style: TextStyle(fontFamily: 'Pacifico'),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.network('https://picsum.photos/200'),
              Text(
                'Image 5',
                style: TextStyle(fontFamily: 'Pacifico'),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.network('https://picsum.photos/200'),
              Text(
                'Image 6',
                style: TextStyle(fontFamily: 'Pacifico'),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.network('https://picsum.photos/200'),
              Text(
                'Image 7',
                style: TextStyle(fontFamily: 'Pacifico'),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.network('https://picsum.photos/200'),
              Text(
                'Image 8',
                style: TextStyle(fontFamily: 'Pacifico'),
              ),
            ],
          ),
        ),
        Container(
          child: Column(
            children: [
              Image.network('https://picsum.photos/200'),
              Text(
                'Image 9',
                style: TextStyle(fontFamily: 'Pacifico'),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
