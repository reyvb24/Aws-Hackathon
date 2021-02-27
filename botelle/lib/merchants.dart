import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Merchants extends StatefulWidget {
  @override
  _MerchantsState createState() => _MerchantsState();
}

class Merchant {
  String name;
  String imagePath;

  Merchant({this.name, this.imagePath});
}

class _MerchantsState extends State<Merchants> {
  List<Merchant> merchantList = [
    Merchant(name: "HeyTea", imagePath: "heytea.jpg"),
    Merchant(name: "ShareTea", imagePath: "sharetea.png"),
    Merchant(name: "Starbucks", imagePath: "starbucks.png")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffb3dee5),
      // appBar: AppBar(
      //   title: Text(
      //     "BOTELLE",
      //     style: TextStyle(
      //       fontSize: 25.0,
      //       fontWeight: FontWeight.bold,
      //       color: Colors.grey[800],
      //       fontFamily: "KronaOne",
      //     ),
      //   ),
      //   // centerTitle: true,
      //   backgroundColor: const Color(0xfffae6b1),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: const Icon(Icons.account_circle),
      //       color: Colors.grey[800],
      //       tooltip: "Show profile",
      //       onPressed: () {},
      //     )
      //   ],
      // ),
      body: Column(children: <Widget>[
        Container(
          height: 160.0,
          margin: EdgeInsets.all(20.0),
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: merchantList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Container(
                    child: ListTile(
                      onTap: () {},
                    ),
                    width: MediaQuery.of(context).size.width * 2 / 3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        // fit: BoxFit.cover, //I assumed you want to occupy the entire space of the card
                        image: AssetImage(
                            'assets/${merchantList[index].imagePath}'),
                      ),
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
                  ),
                );
              }),
        ),
        Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 1 / 4,
            width: MediaQuery.of(context).size.width * 8 / 9,
            color: Colors.amberAccent,
          ),
        ),
      ]),
      // bottomNavigationBar: BottomNavigationBar(

      // ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          print("Paid");
        },
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
    );
    // drawer: Drawer(),
  }
}
