import 'package:bdfinapp/AllFeaturePage.dart';
import 'package:bdfinapp/Bottomnavpage.dart';
import 'package:bdfinapp/ClientAppointment.dart';
import 'package:bdfinapp/CustomerDetailsPage.dart';
import 'package:bdfinapp/Product.dart';
import 'package:bdfinapp/loginPage.dart';
import 'package:bdfinapp/settings.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BdFinApp());
}

class BdFinApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BD Finance',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.grey,
        accentColor: Colors.white70,
        bottomNavigationBarTheme:
         BottomNavigationBarThemeData(backgroundColor: Colors.grey[300])
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => LogInPage(),
        '/allfeaturespage': (context) => AllFeaturesPage(),
        '/productspage': (context) => ProductsPage(),
        '/customerdetailspage': (context) => CustomerDetailPage(),
        '/clientapppage': (context)=> ClientAppointPage(),
        '/settingspage' : (context) => SettingsPage(),
        '/bottom' :(context)=> BottomNav(),
      },
    );
  }
}
