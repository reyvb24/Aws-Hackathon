import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Botelle"),
        centerTitle: true,
        backgroundColor: Colors.deepOrange[600],
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("Pay"),
        backgroundColor: Colors.deepOrange[600],
      ),
      drawer: Drawer(),
    );
  }
}
