import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffb3dee5),
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
      body: Column(children: <Widget>[
        Container(
            height: 160.0,
            margin: EdgeInsets.all(20.0),
            child:
                ListView(scrollDirection: Axis.horizontal, children: <Widget>[
              Container(
                  color: Colors.cyanAccent,
                  width: MediaQuery.of(context).size.width * 2 / 3),
              SizedBox(width: MediaQuery.of(context).size.width * 1 / 20),
              Container(
                  color: Colors.black,
                  width: MediaQuery.of(context).size.width * 2 / 3),
              SizedBox(width: MediaQuery.of(context).size.width * 1 / 20),
              Container(
                  color: Colors.blueAccent,
                  width: MediaQuery.of(context).size.width * 2 / 3),
              SizedBox(width: MediaQuery.of(context).size.width * 1 / 20),
              Container(
                  color: Colors.amber,
                  width: MediaQuery.of(context).size.width * 2 / 3),
            ]))
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text("Pay"),
        backgroundColor: const Color(0xffffa101),
      ),
      drawer: Drawer(),
    );
  }
}
