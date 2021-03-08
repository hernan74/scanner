import 'package:flutter/material.dart';


class UiProvider extends ChangeNotifier{

  int _ventanaSeleccionada=0;

  get ventanaSeleccionada=>this._ventanaSeleccionada;

  set ventanaSeleccionada(int i){
    this._ventanaSeleccionada=i;
    notifyListeners();
  }
}