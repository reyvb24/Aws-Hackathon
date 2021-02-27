import 'package:flutter/material.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Merchants extends StatefulWidget {
  @override
  int bottleSaved = 0;
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

  void Incrementor(int n) {
    widget.bottleSaved += 1;
  }

  @override
  Widget build(BuildContext context) {
    int currentBottle = widget.bottleSaved;
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
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          SizedBox(
            height: 20,
          ),
          Card(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 2, 8, 2),
              child: Text(
                'Our Merchants',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 160.0,
            margin: EdgeInsets.fromLTRB(20.0, 10, 20, 10),
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
          Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 8.0, 8.0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 5, 0, 5),
                    child: Text(
                      "How you helped",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 0, 10, 5),
                    child: Text(
                        "Scroll down to check out these amazing statistics below. You can consider donating too if you're feeling generous"),
                  ),
                ],
              ),
            ),
            // color: Colors.blue[100],
          ),
          Container(
            height: 354.0,
            margin: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height * 1 / 4,
                  width: MediaQuery.of(context).size.width * 8 / 9,
                  decoration: BoxDecoration(
                      color: const Color(0xff31525b),
                      borderRadius: new BorderRadius.circular(18),
                      image: DecorationImage(
                          image: AssetImage('assets/citrus2.jpg'),
                          fit: BoxFit.fill)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 20.0, 100, 0),
                    child: Text(
                      "You have helped eliminate\n100\nplastic bottles!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 1 / 4,
                  width: MediaQuery.of(context).size.width * 8 / 9,
                  decoration: BoxDecoration(
                      color: const Color(0xff31525b),
                      borderRadius: new BorderRadius.circular(18),
                      image: DecorationImage(
                          image: AssetImage('assets/citrus.jpg'),
                          fit: BoxFit.fill)),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20.0, 120.0, 100, 0),
                    child: Text(
                      "Donate now!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
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
