import 'package:botelle/subscriptions.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'loading.dart';
import 'login.dart';
import 'profile.dart';

void main() {
  runApp(MaterialApp(home: Subscriptions()));
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Botelle",
      home: LogIn(),
    );
  }
}
