import 'package:botelle/qrscanner.dart';
import 'package:botelle/subscriptions.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'loading.dart';
import 'login.dart';
import 'profile.dart';
import 'service.dart';

void main() {
  var service_test = Service();
  service_test.httpRequest();
  runApp(MaterialApp(home: Home()));
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Botelle",
      home: LogIn(),
    );
  }
}
