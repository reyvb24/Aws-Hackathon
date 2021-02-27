import 'package:flutter/material.dart';
import 'home.dart';

void main() {
  runApp(MaterialApp(home: Botelle()));
}

class Botelle extends StatefulWidget {
  @override
  _BotelleState createState() => _BotelleState();
}

class _BotelleState extends State<Botelle> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Botelle"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange[600],
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        child: Text("Pay"),
      ),
      drawer: Drawer(),
    );
  }
}
