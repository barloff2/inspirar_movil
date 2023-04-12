import 'package:flutter/material.dart';

class arbol extends StatefulWidget {
  const arbol({super.key});

  @override
  State<arbol> createState() => _arbolState();
}

class _arbolState extends State<arbol> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(155, 162, 205, 240),
      appBar: AppBar(
        title: const Center(
          child: Text("Tarea"),
        ),
        backgroundColor: Colors.black45,
      ),
      body: Container(
        margin: EdgeInsets.all(30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.accessible_rounded,
                    color: Color.fromARGB(190, 255, 0, 221)),
                Container(
                  child: const Text(
                    "Izquierda",
                    style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        decorationStyle: TextDecorationStyle.dashed),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add_to_photos_sharp),
                Container(
                  child: const Text(
                    "Centro",
                    style: TextStyle(
                        color: Colors.amber,
                        decorationStyle: TextDecorationStyle.dotted),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.pause_sharp),
                Container(
                  child: const Text(
                    "Derecha",
                    style: TextStyle(
                        color: Colors.brown,
                        decorationStyle: TextDecorationStyle.solid),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
