import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:scanner/src/pages/home_page.dart';
import 'package:scanner/src/pages/mapa_page.dart';
import 'package:scanner/src/providers/ui_provider.dart';
 
void main() => runApp(MyApp());
 

class MyApp extends StatelessWidget {
  
 static final Color colorApp=Colors.cyan.shade700;

  @override
  Widget build(BuildContext context) {
    //Permite utilizar multiples providers en la app
    return MultiProvider(
      //Creacion de providers
      providers: [
        ChangeNotifierProvider(create:(_)=> UiProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Material App',
        initialRoute: 'home',
        debugShowCheckedModeBanner: false,
        routes: {
          'home':(context) =>HomePage(),
          'mapa':(context) =>MapaPage(),
        },
        theme: ThemeData(
            primaryColor:colorApp ,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor:colorApp,
            ),
        ),
      ),
    );
  }
}