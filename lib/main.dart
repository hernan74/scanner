import 'package:flutter/material.dart';


import 'package:scanner/src/pages/home_page.dart';
import 'package:scanner/src/pages/mapa_page.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      initialRoute: 'home',
      debugShowCheckedModeBanner: false,
      routes: {
        'home':(context) =>HomePage(),
        'mapa':(context) =>MapaPage(),
      },
    );
  }
}