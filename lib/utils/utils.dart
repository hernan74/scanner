
import 'package:flutter/cupertino.dart';
import 'package:scanner/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(BuildContext context,ScanModel scan) async{

final url= scan.valor;

  if(scan.tipo=='http'){

     await launch(url);
  }else{
    Navigator.of(context).pushNamed('mapa',arguments: scan);
  }

}
   