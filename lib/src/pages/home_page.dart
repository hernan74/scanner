import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanner/src/pages/direcciones_page.dart';
import 'package:scanner/src/pages/mapas_page.dart';
import 'package:scanner/src/providers/ui_provider.dart';

import 'package:scanner/src/widget/custom_navigationBar.dart';
import 'package:scanner/src/widget/scanner_floatingButton.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
         title: Text('Scanner'),
          centerTitle: true,
          actions:  [
            Icon(Icons.delete) 
          ],
      ),
      body: _cambiarVentana(context),
      bottomNavigationBar: CustomNavigationBar(),
      floatingActionButton: ScannerFloatingButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation .centerDocked,
    );
  }


  Widget _cambiarVentana(BuildContext context){
    final ventanaSeleccionada=Provider.of<UiProvider>(context);

    switch(ventanaSeleccionada.ventanaSeleccionada){
      case 0:
      return MapasPage();
      case 1:
      return DireccionesPage();
      default:
      return MapasPage();
    }
  }
}