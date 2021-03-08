import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:scanner/providers/scan_list_provider.dart';
import 'package:scanner/providers/ui_provider.dart';

class ScannerFloatingButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
     
    return FloatingActionButton(
      child: Icon(Icons.qr_code_rounded),
      onPressed: ()async{
       // String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
       //                                           //Color de la raya del lector
       //                                         '#3D8BEF', 
       //                                       'Cancelar', 
       //                                     false, 
       //                                   ScanMode.QR
       // );

      final scanListProvider=Provider.of<ScanListProvider>(context,listen: false);
      final uiProvider=Provider.of<UiProvider>(context,listen: false);

       String barCode=uiProvider.ventanaSeleccionada==0? 'geo:-26.411671,-54.583593':'https://flutter.dev';
       
       if(barCode=='-1'){
       return  ; 
      }
       scanListProvider.nuevoScan(barCode);
       
      }
      );
  }
}