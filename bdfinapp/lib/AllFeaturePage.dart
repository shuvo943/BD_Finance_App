import 'dart:ui';

import 'package:bdfinapp/ClientAppointment.dart';
import 'package:bdfinapp/CustomerDetailsPage.dart';
import 'package:bdfinapp/Product.dart';
import 'package:flutter/material.dart';

class AllFeaturesPage extends StatefulWidget {
  @override
  _AllFeaturesPageState createState() => _AllFeaturesPageState();
}

class _AllFeaturesPageState extends State<AllFeaturesPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    AllFeaturesPage(),
    ProductsPage(),
    CustomerDetailPage(),
    ClientAppointPage(),
  ];

  void OnTappedOnNB(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, '/settingspage');
            },
            child: Padding(
              padding: const EdgeInsets.only(right: 15.0),
              child: Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ),
          ),
        ],
        centerTitle: true,
        title: Text(
          'Sales Force',
          style: TextStyle(color: Colors.grey[700], fontSize: 20),
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(25),
        child: GridView.count(
          crossAxisCount: 2,
          scrollDirection: Axis.vertical,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 10.0,
          childAspectRatio: 1.0,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/productspage');
              },
              child: Container(
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 52,
                        width: 52,
                        margin: EdgeInsets.only(top: 30),
                        child: CircleAvatar(
                          child: Image.asset('assets/images/de.png'),
                          backgroundColor: Colors.grey[400],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Text('Deposits'),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.grey[200],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/productspage');
              },
              child: Container(
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 52,
                        width: 52,
                        margin: EdgeInsets.only(top: 30),
                        child: CircleAvatar(
                          child: Image.asset(
                            'assets/images/loan.png',
                            height: 24,
                            width: 24,
                          ),
                          backgroundColor: Colors.grey[400],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Text('Loans'),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.grey[200],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/customerdetailspage'),
              child: Container(
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 52,
                        width: 52,
                        margin: EdgeInsets.only(top: 30),
                        child: CircleAvatar(
                          child: Image.asset('assets/images/custo.png',
                              height: 24, width: 24),
                          backgroundColor: Colors.grey[400],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Text('Customer Info'),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.grey[200],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/productspage');
              },
              child: Container(
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 52,
                        width: 52,
                        margin: EdgeInsets.only(top: 30),
                        child: CircleAvatar(
                          child: Image.asset('assets/images/visits.png',
                              height: 24, width: 24),
                          backgroundColor: Colors.grey[400],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Text('All Visit'),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.grey[200],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/clientapppage');
              },
              child: Container(
                child: Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 52,
                        width: 52,
                        margin: EdgeInsets.only(top: 30),
                        child: CircleAvatar(
                          child: Image.asset('assets/images/appo.png',
                              height: 24, width: 24),
                          backgroundColor: Colors.grey[400],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Text('Appointment'),
                      ),
                    ],
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  color: Colors.grey[200],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: OnTappedOnNB,
        currentIndex: _currentIndex,
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
