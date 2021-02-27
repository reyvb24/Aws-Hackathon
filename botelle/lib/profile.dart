import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Account",
          style: TextStyle(
            fontSize: 25.0,
            //fontWeight: FontWeight.bold,
            color: Colors.grey[800],
            //fontFamily: "KronaOne",
          ),
        ),
        backgroundColor: const Color(0xfffae6b1),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30, 40, 30, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage('assets/scott.jpg'),
                  radius: 50.0,
                ),
                SizedBox(
                  width: 60,
                ),
                Icon(
                  Icons.verified_user,
                  color: Colors.blue,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Verified user'),
                ),
              ],
            ),
            Divider(
              height: 30.0,
            ),
            Text(
              'Email',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'reyvb24@gmail.com',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Balance',
              style: TextStyle(
                fontSize: 17,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Rp 10,000,00',
              style: TextStyle(
                fontSize: 24,
              ),
            ),
            FlatButton.icon(
              onPressed: () {
                // setState(() {
                //   balance += 10000;
                // });
              },
              label: Text(
                'Top Up',
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
    throw UnimplementedError();
  }
}
