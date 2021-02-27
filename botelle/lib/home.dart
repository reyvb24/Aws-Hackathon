import 'package:flutter/material.dart';

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
  List<String> merchantList = ["heytea", "sharetea", "starbucks"];
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
      body: Column(children: <Widget>[
        Container(
            height: 160.0,
            margin: EdgeInsets.all(20.0),
            child:
                ListView(scrollDirection: Axis.horizontal, children: <Widget>[
              Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: new BorderRadius.circular(18.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  child: Image(
                    image: AssetImage('assets/heytea.jpg'),
                  ),
                  width: MediaQuery.of(context).size.width * 2 / 3),
              SizedBox(width: MediaQuery.of(context).size.width * 1 / 20),
              Container(
                  color: Colors.white,
                  child: Image(
                    image: AssetImage('assets/starbucks.png'),
                  ),
                  width: MediaQuery.of(context).size.width * 2 / 3),
              SizedBox(width: MediaQuery.of(context).size.width * 1 / 20),
              Container(
                  color: Colors.white,
                  child: Image(
                    image: AssetImage('assets/sharetea.png'),
                  ),
                  width: MediaQuery.of(context).size.width * 2 / 3),
              SizedBox(width: MediaQuery.of(context).size.width * 1 / 20),
              Container(
                  color: Colors.amber,
                  width: MediaQuery.of(context).size.width * 2 / 3),
            ])),
        Center(
            child: Container(
          height: MediaQuery.of(context).size.height * 1 / 4,
          width: MediaQuery.of(context).size.width * 8 / 9,
          color: Colors.amberAccent,
        ))
      ]),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(Icons.attach_money),
        label: Text(
          "Pay",
          style: TextStyle(
            fontSize: 17.0,
            //fontWeight: FontWeight.bold,
            //color: Colors.grey[800],
            //fontFamily: "KronaOne",
          ),
        ),
        backgroundColor: const Color(0xffffa101),
      ),
      //drawer: Drawer(),
    );
  }
}
