import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Subscriptions extends StatefulWidget {
  @override
  _SubscriptionsState createState() => _SubscriptionsState();
}

class Plan {
  String name;
  String price;
  String imagePath;
  bool subscribed;

  Plan({this.name, this.price, this.imagePath, this.subscribed});
}

class _SubscriptionsState extends State<Subscriptions> {
  bool subscribed = false;
  List<Plan> plans = [
    Plan(
        name: "Coffee-holic",
        price: "HK\$100",
        imagePath: "coffee.png",
        subscribed: false),
    Plan(
        name: "Stay Hydrated!",
        price: "HK\$50",
        imagePath: "water.png",
        subscribed: false)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
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
      //   centerTitle: true,
      //   backgroundColor: const Color(0xfffae6b1),
      // ),
      body: ListView.builder(
          itemCount: plans.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xffb3dee5),
                      borderRadius: new BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0.0, 1.0),
                            blurRadius: 6)
                      ],
                      image: DecorationImage(
                          alignment: Alignment(1.0, 1.0),
                          image:
                              AssetImage('assets/${plans[index].imagePath}'))),
                  child:
                      // Column(
                      //   children: [
                      ListTile(
                    onTap: () {
                      if (subscribed == false) {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                new CupertinoAlertDialog(
                                  title: Text('Confirmation',
                                      style: TextStyle(
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold)),
                                  content: new Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(""),
                                        Text(
                                            "Do you want to subscribe to this plan?",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 16,
                                            ))
                                      ]),
                                  actions: <Widget>[
                                    new FlatButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        // textColor: Theme.of(context).primaryColor,
                                        child: const Text('No',
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 20))),
                                    new FlatButton(
                                      child: const Text('Yes',
                                          style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 20)),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                new CupertinoAlertDialog(
                                                    content: new Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: <Widget>[
                                                          Text(
                                                              "You have subscribed to a plan!",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                              ))
                                                        ]),
                                                    actions: <Widget>[
                                                      new FlatButton(
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            setState(() {
                                                              plans[index]
                                                                      .subscribed =
                                                                  true;
                                                              subscribed = true;
                                                            });
                                                          },
                                                          child: const Text(
                                                              'OK',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .green,
                                                                  fontSize:
                                                                      20))),
                                                    ]));
                                      },
                                    ),
                                  ],
                                ));
                      }
                    },
                    contentPadding: EdgeInsets.fromLTRB(15.0, 10.0, 0, 50),
                    title: Padding(
                      padding: const EdgeInsets.fromLTRB(2.0, 10.0, 0, 0),
                      child: Text(
                        plans[index].name,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // padding: const EdgeInsets.fromLTRB(2.0, 5.0, 10, 0),
                        children: [
                          Text(
                            " " + plans[index].price,
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 16,
                            ),
                          ),
                          if (plans[index].subscribed == true)
                            Text(" You have subscribed to this plan",
                                style: TextStyle(
                                  color: Colors.grey[700],
                                  fontSize: 16,
                                ))
                        ]),
                  )
                  // ],
                  ),
            );
          }),
    );
  }
}
