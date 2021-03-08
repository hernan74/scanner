

import 'package:flutter/cupertino.dart';
import 'package:scanner/models/scan_model.dart';
import 'package:scanner/providers/db_provider.dart';

class ScanListProvider extends ChangeNotifier{

String tipo='http';
List<ScanModel> scanList=[];


nuevoScan(String valor)async {

    final nuevoScan=new ScanModel(valor: valor);
    nuevoScan.id=  await DBProvider.db.crearNuevoScan(nuevoScan);

      scanList.add(nuevoScan);
      notifyListeners();
}

  scanPorTipo(String valor)async {

      final lista=await DBProvider.db.obtenerScanPorTipo(valor);
      
      this.scanList=[...lista];
      notifyListeners();
    
      
  }

  eliminarScansPorTipo(int tipo){
    DBProvider.db.borrarTodosLosScanPorTipo(tipo==0?'geo':'http');

    this.scanList.clear();
    notifyListeners();
  }

   eliminarScansPorId(int id){
     DBProvider.db.borrarScanPorId(id);
     scanList.removeWhere((element)=> id==element.id);
     notifyListeners();
  }
}