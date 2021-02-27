import 'package:flutter/material.dart';

class Subscriptions extends StatefulWidget {
  @override
  _SubscriptionsState createState() => _SubscriptionsState();
}

class _SubscriptionsState extends State<Subscriptions> {
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
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return Card(
                child: ListTile(
              onTap: () {},
              title: Text("Plan A"),
            ));
          }),
    );
  }
}
