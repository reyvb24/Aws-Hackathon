import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'loading.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool loading = false;
  String email;
  String password;
  String passwordConfirm;
  TextStyle linkStyle = TextStyle(color: Colors.blue);
  TextStyle defaultStyle = TextStyle(color: Colors.grey, fontSize: 5.0);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: const Color(0xfffae6b1),
            body: Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
              child: Form(
                key: _formKey,
                child: SingleChildScrollView(
                  child: Column(children: <Widget>[
                    SizedBox(height: 100.0),
                    Text(
                      "BOTELLE",
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                        fontFamily: "KronaOne",
                      ),
                    ),
                    SizedBox(height: 25.0),
                    Image(
                      image: AssetImage('assets/bottle_logo.png'),
                      height: 291.3,
                      width: 106,
                    ),
                    SizedBox(height: 40.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: new BorderRadius.circular(18.0),
                      ),
                      // Image(image: AssetImage('assets/patungkuy.png')),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(
                            // decoration:textInputDecoration.copyWith(hintText: 'Email'),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "Email",
                            ),
                            validator: (val) =>
                                val.isEmpty ? "Please enter an email!" : null,
                            onChanged: (val) {
                              setState(() {
                                email = val;
                              });
                            }),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: new BorderRadius.circular(18.0),
                      ),
                      // Image(image: AssetImage('assets/patungkuy.png')),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(
                            // decoration: textInputDecoration.copyWith(hintText: 'Password'),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "Password",
                            ),
                            validator: (val) => val.length < 6
                                ? "Please enter a password of 6 or more characters!"
                                : null,
                            obscureText: true,
                            onChanged: (val) {
                              setState(() {
                                password = val;
                              });
                            }),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: new BorderRadius.circular(18.0),
                      ),
                      // Image(image: AssetImage('assets/patungkuy.png')),
                      child: Padding(
                        padding: EdgeInsets.only(left: 15, right: 15, top: 5),
                        child: TextFormField(
                            // decoration: textInputDecoration.copyWith(hintText: 'Password'),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              labelText: "Confirm Password",
                            ),
                            validator: (val) => val != password
                                ? "Password does not match!"
                                : null,
                            obscureText: true,
                            onChanged: (val) {
                              setState(() {
                                // password = val;
                              });
                            }),
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        child: RaisedButton(
                          color: Colors.green,
                          onPressed: () {
                            // Validate returns true if the form is valid, or false
                            // otherwise.
                            if (_formKey.currentState.validate()) {
                              // If the form is valid, display a Snackbar.
                              Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text('Processing Data')));
                            }
                          },
                          child: Text(
                            'REGISTER',
                            style: TextStyle(color: Colors.white),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(40.0),
                              side: BorderSide(color: Colors.green)),
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ),
          );
  }
}
