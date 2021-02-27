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
        title: Text(
          "BOTELLE",
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
            color: Colors.grey[800],
            fontFamily: "KronaOne",
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xfffae6b1),
      ),
      body: Container(
        color: const Color(0xffb3dee5),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("Pay"),
        backgroundColor: const Color(0xffffa101),
      ),
      drawer: Drawer(),
    );
  }
}
