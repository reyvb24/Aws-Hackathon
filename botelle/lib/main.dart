import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(Botelle());
}

class Botelle extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Botelle",
        home: Scaffold(
          appBar: AppBar(
            title: Text("Botelle"),
            centerTitle: true,
          ),
          body: Center(),
          floatingActionButton: FloatingActionButton(
            child: Text("Pay"),
          ),
        ));
  }
}
