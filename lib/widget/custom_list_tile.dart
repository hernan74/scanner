import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanner/providers/scan_list_provider.dart';

class CustomListTile extends StatelessWidget {

  final String tipo;

  const CustomListTile({ @required this.tipo});

  @override
  Widget build(BuildContext context) {

  final scanListProvider=Provider.of<ScanListProvider>(context);

    return ListView.builder(
        itemCount: scanListProvider.scanList.length,
        itemBuilder: (_,i){
            return Dismissible(
                 key: UniqueKey(),
              onDismissed: (DismissDirection dir){
                  scanListProvider.eliminarScansPorId(
                  scanListProvider.scanList[i].id);
              },
              child: ListTile(
                 title: Text(scanListProvider.scanList[i].valor),
                 subtitle: Text(scanListProvider.scanList[i].tipo),
                 leading:Icon(Icons.map) ,
              )
           );
        }
    );
  }
}