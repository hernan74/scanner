import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:scanner/pages/home_page.dart';
import 'package:scanner/pages/mapa_page.dart';
import 'package:scanner/providers/scan_list_provider.dart';
import 'package:scanner/providers/ui_provider.dart';

 
void main() => runApp(MyApp());
 

class MyApp extends StatelessWidget {
  
 static final Color colorApp=Colors.cyan.shade700;

  @override
  Widget build(BuildContext context) {
    //Permite utilizar multiples providers en la app
    return MultiProvider(
      //Creacion de providers
      providers: [
        ChangeNotifierProvider(create:(_)=> UiProvider()),
        ChangeNotifierProvider(create:(_)=> ScanListProvider())
      ],
      child: MaterialApp(
        title: 'Material App',
        initialRoute: 'home',
        debugShowCheckedModeBanner: false,
        routes: {
          'home':(_) =>HomePage(),
          'mapa':(_) =>MapaPage(),
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