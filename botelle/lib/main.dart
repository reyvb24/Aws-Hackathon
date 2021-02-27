import 'package:botelle/subscriptions.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'loading.dart';
import 'login.dart';

void main() {
  runApp(MaterialApp(home: LogIn()));
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Botelle",
      home: LogIn(),
    );
  }
}
