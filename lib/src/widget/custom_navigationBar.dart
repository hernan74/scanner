import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:scanner/src/providers/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
      final ventanaSeleccionada=Provider.of<UiProvider>(context);

    return BottomNavigationBar(
      currentIndex: ventanaSeleccionada.ventanaSeleccionada,
      onTap: (i){
        ventanaSeleccionada.ventanaSeleccionada=i;
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.map),
          label: 'Mapa',
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.room_outlined),
          label: 'Ubicacion'
        )
      ]);
  }
}