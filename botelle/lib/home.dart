import 'package:botelle/subscriptions.dart';
import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'merchants.dart';
import 'qrscanner.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class Merchant {
  String name;
  String imagePath;

  Merchant({this.name, this.imagePath});
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  var tabs = [Merchants(), QRScanner(), Subscriptions()];
  var titles = ['Merchants', 'QRScanner', 'Subscriptions'];

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
        // centerTitle: true,
        backgroundColor: const Color(0xfffae6b1),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.account_circle),
            color: Colors.grey[800],
            tooltip: "Show profile",
            onPressed: () {},
          )
        ],
      ),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              title: Text(titles[0]),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.zoom_in),
              title: Text(titles[1]),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.star_border),
              title: Text(titles[2]),
            )
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          }),
    );
  }
}
