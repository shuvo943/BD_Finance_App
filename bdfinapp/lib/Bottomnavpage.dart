import 'package:bdfinapp/AllFeaturePage.dart';
import 'package:bdfinapp/ClientAppointment.dart';
import 'package:bdfinapp/CustomerDetailsPage.dart';
import 'package:bdfinapp/Product.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
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
        title: Text('All Visits'),
      ),
      body: _children[_currentIndex],
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
