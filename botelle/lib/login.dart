import 'package:flutter/material.dart';
import 'loading.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.blue[100],
            appBar: AppBar(
                backgroundColor: Colors.blue[300],
                elevation: 20.0,
                title: Text('Sign in to Botelle'),
                actions: <Widget>[
                  FlatButton.icon(
                      icon: Icon(Icons.person),
                      label: Text('Register'),
                      onPressed: () {
                        // widget.toggleView();
                      })
                ]),
          );
  }
}
