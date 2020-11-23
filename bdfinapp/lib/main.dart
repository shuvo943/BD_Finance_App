import 'package:bdfinapp/view/AllFeaturePage.dart';
import 'package:bdfinapp/view/Bottomnavpage.dart';
import 'package:bdfinapp/view/ClientAppointment.dart';
import 'package:bdfinapp/view/CustomerDetailsPage.dart';
import 'package:bdfinapp/view/Product.dart';
import 'package:bdfinapp/locator.dart';
import 'package:bdfinapp/view/settings.dart';
import 'package:bdfinapp/view/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

import 'core/viewmodels/CRUDModel.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(BdFinApp());
}

class BdFinApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => locator<CRUDModel>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BD Finance',
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.grey,
            accentColor: Colors.white70,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                backgroundColor: Colors.grey[300])),
        initialRoute: '/',
        routes: <String, WidgetBuilder>{
          '/': (context) => LogInPage(),
          '/allfeaturespage': (context) => AllFeaturesPage(),
          '/productspage': (context) => ProductsPage(),
          '/customerdetailspage': (context) => CustomerDetailPage(),
          '/clientapppage': (context) => ClientAppointPage(),
          '/settingspage': (context) => SettingsPage(),
          '/bottom': (context) => BottomNav(),
        },
      ),
    );
  }
}
