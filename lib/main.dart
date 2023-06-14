import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

//Stateless
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Pacifico'),
      home: const MyHomePage(title: 'Parcial 3'),
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

  void _onTap() {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('Presionado')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(mainAxisSpacing: 20.0, crossAxisCount: 2, children: [
        Container(
          child: Column(
            children: [
              GestureDetector(
                onTap: _onTap,
                child: Image.network('https://picsum.photos/id/12/2500/1667'),
              ),
              Text(
                'Image 1',
                style: TextStyle(fontFamily: 'Pacifico'),
              ),
            ],
          ),
        ),
        Container(
          child: Column(children: <Widget>[
            GestureDetector(
              onTap: _onTap,
              child: Image.network('https://picsum.photos/id/29/4000/2670'),
            ),
            Text(
              'Image 2',
              style: TextStyle(fontFamily: 'Pacifico'),
            ),
          ]),
        ),
        Container(
          child: Column(
            children: [
              GestureDetector(
                onTap: _onTap,
                child: Image.network('https://picsum.photos/id/2/5000/3333'),
              ),
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
              GestureDetector(
                onTap: _onTap,
                child: Image.network('https://picsum.photos/id/1/5000/3333'),
              ),
              Text(
                'Image 4',
                style: TextStyle(fontFamily: 'Pacifico'),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
