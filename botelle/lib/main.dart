import 'package:flutter/material.dart';
import 'home.dart';
import 'loading.dart';
import 'login.dart';

void main() {
  runApp(Botelle());
}

class Botelle extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Botelle",
      home: LogIn(),
    );
  }
}
