import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scanner/providers/scan_list_provider.dart';
import 'package:scanner/utils/utils.dart';

class CustomListView extends StatelessWidget {

  final String tipo;

  const CustomListView({ @required this.tipo});

  @override
  Widget build(BuildContext context) {

  final scanListProvider=Provider.of<ScanListProvider>(context);

    return ListView.builder(
        itemCount: scanListProvider.scanList.length,
        itemBuilder: (_,i){
            return Dismissible(
                 key: UniqueKey(),
                 onDismissed: (DismissDirection dir)async{
                // DBProvider.db.borrarScanPorId( scanListProvider.scanList[i].id);   
               await scanListProvider.eliminarScansPorId(scanListProvider.scanList[i].id);        
              }  ,
              child: ListTile(
                 title: Text(scanListProvider.scanList[i].valor),
                 subtitle: Text(scanListProvider.scanList[i].tipo),
                 leading:Icon(Icons.map) ,
                 onTap: ()async{
                   launchURL(context, scanListProvider.scanList[i]);
                    },
              )
           );
        }
    );
  }
}