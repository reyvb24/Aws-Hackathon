import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(Botelle());
}

class Botelle extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Botelle",
      home: Home(),
    );
  }
}
