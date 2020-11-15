import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  Widget circularImageWithBorder(
      String imgPath, double rad, double borderWidth, Color borderColor) {
    return CircleAvatar(
        radius: rad + borderWidth,
        backgroundColor: borderColor,
        child: CircleAvatar(
          backgroundImage: AssetImage(imgPath),
          radius: rad,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 30),
                      width: double.infinity,
                      child: Card(
                          color: Colors.white,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(
                                    top: 40, bottom: 0, left: 10, right: 10),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "BD Finance",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Text(
                                        "Bd Finance is a top finance banking/non banking company in Indianapolis, Indiana and is affiliated with multiple hospitals in the area. He has been in practice for more than 20 years.",
                                        style: TextStyle()),
                                    ButtonBar(
                                      children: <Widget>[
                                        FlatButton(
                                          child: Text(
                                            "APPOINTMENT",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/clientapppage');
                                          },
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          )),
                    ),
                    circularImageWithBorder(
                        'assets/images/bdlogo.png', 30, 2, Colors.black),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 10.5,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(top: 17, left: 10),
                    child: Text('01723452176',style:TextStyle(fontWeight: FontWeight.bold,color:Colors.grey)),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 10.5,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: Colors.grey,
                  child: Padding(
                    padding: EdgeInsets.only(top: 17, left: 10),
                    child: Text('Customer Details'),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                width: MediaQuery.of(context).size.width,
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.only(top: 17, left: 0),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 200),
                          
                            child: Text(
                                'Customer Details')),
                        SizedBox(height: 10),
                        Container(
                            child: Text(
                       'Customer Details bafdasfqerwefsdfefasdfa dfafasdf .Its very Important to have some kind of this to initiate in avery nearest possible time.')),
                      Container(
                          margin: EdgeInsets.only(right: 200),
                          
                            child: Text(
                                'Customer Details')),
                        SizedBox(height: 10),
                        Container(
                            child: Text(
                                'Customer Details bafdasfqerwefsdfefasdfa dfafasdf .Its very Important to have some kind of this to initiate in avery nearest possible time.')),
                                ],
                    ),
                  ),
                ),
              ),
               SizedBox(
                   width: 300,
                   child:RaisedButton(onPressed: (){},
                   color: Colors.grey[400],
                   child: Text('Submit',style: TextStyle(fontWeight: FontWeight.bold),),) ,
                 ), 
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.addchart), label: 'Products'),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'Appointments'),
          BottomNavigationBarItem(
              icon: Icon(Icons.visibility), label: 'Visits'),
        ],
      ),
    );
  }
}
