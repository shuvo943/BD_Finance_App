import 'dart:ui';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LogInPage extends StatefulWidget {
  @override
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  TextEditingController contro = TextEditingController();
  TextEditingController c2 = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  final dbRef = FirebaseDatabase.instance.reference().child("petto");
  @override
  void dispose() {
    super.dispose();
    contro.dispose();
    c2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        centerTitle: true,
        title: Text(
          'Log In',
          style: TextStyle(color: Colors.white70, fontSize: 25),
        ),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          reverse: false,
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 26),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 70),
                  child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: Image.asset('assets/images/bdlogo.png'),
                        decoration: BoxDecoration(
                          border: Border.all(
                            style: BorderStyle.solid,
                            width: 5.0,
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                      ),
                      SizedBox(
                        height: 7.0,
                      ),
                      Text(
                        'BD Finance',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                ), //Bd Finance Logo And Label

                Container(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 250),
                        child: Text(
                          'Email',
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        // margin: EdgeInsets.only(right:100),
                        height: 40,
                        width: 300,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: TextFormField(
                          controller: contro,
                          decoration: InputDecoration(
                            hintText: 'eg-yourname@bdfinance.net',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 13),
                            contentPadding:
                                EdgeInsets.only(left: 20, bottom: 15),
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter a valid email';
                            }
                            return null;
                          },
                        ),
                      )
                    ],
                  ),
                ), //Email label & Text form field

                Container(
                  padding: EdgeInsets.only(
                    top: 20,
                  ),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 220),
                        child: Text(
                          'Password',
                        ),
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Container(
                        // margin: EdgeInsets.only(right:100),
                        height: 40,
                        width: 300,
                        decoration: BoxDecoration(
                          border: Border.all(),
                        ),
                        child: TextFormField(
                          controller: c2,
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: '.......',
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 35),
                            contentPadding:
                                EdgeInsets.only(left: 20, bottom: 15, top: 15),
                          ),
                        ),
                      )
                    ],
                  ),
                ), //Password label & Text Form Field
                SizedBox(
                  height: 20,
                ),
                RaisedButton(
                  padding: EdgeInsets.symmetric(horizontal: 0),
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      dbRef.push().set({
                        "name": contro.text,
                        "age": c2.text,
                      }).then((_) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Successfully Added')));
                        contro.clear();
                        c2.clear();
                      }).catchError((onError) {
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text(onError)));
                      });
                    }
                    Navigator.pushNamed(context, '/allfeaturespage');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      border: Border.all(),
                    ),
                    width: 300,
                    height: 40,
                    child: Center(
                      child: Text(
                        'LOG IN',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 17),
                      ),
                    ),
                  ),
                ), // The LogIn Button
              ],
            ),
          ),
        ),
      ),
    );
  }
}
