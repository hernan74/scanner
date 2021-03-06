import 'package:flutter/material.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScannerFloatingButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.qr_code_rounded),
      onPressed: ()async{
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
                                                    //Color de la raya del lector
                                                    '#3D8BEF', 
                                                    'Cancelar', 
                                                    false, 
                                                    ScanMode.QR
        );
        print(barcodeScanRes);
      }
      );
  }
}