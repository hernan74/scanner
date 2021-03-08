import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'package:scanner/providers/scan_list_provider.dart';
import 'package:scanner/providers/ui_provider.dart';
import 'package:scanner/widget/custom_list_tile.dart';
import 'package:scanner/widget/custom_navigationBar.dart';
import 'package:scanner/widget/scanner_floatingButton.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar:AppBar(
         title: Text('Scanner'),
          centerTitle: true,
          actions:  [
            IconButton(
              icon: Icon(Icons.delete) ,
              onPressed: (){
                final scanListProvider=Provider.of<ScanListProvider>(context,listen: false);
                final uiProvider=Provider.of<UiProvider>(context,listen: false);
   
                scanListProvider.eliminarScansPorTipo(uiProvider.ventanaSeleccionada);
              },
            )
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
    final scanListProvider=Provider.of<ScanListProvider>(context,listen: false);

    switch(ventanaSeleccionada.ventanaSeleccionada){
      case 0:
      scanListProvider.scanPorTipo('geo');
      return  CustomListTile(tipo: 'geo');
      case 1:
      scanListProvider.scanPorTipo('http');
      return  CustomListTile(tipo: 'http');
      default:
      return  CustomListTile(tipo: 'geo');
    }
  }
}