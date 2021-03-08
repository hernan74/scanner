import 'package:flutter/material.dart';
import 'dart:async';

import 'package:scanner/models/scan_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatefulWidget {


 
  @override
  _MapaPageState createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  
  Completer<GoogleMapController> _controller = Completer();
  LatLng latLangSeleccionado;
  MapType tipoMapa=MapType.normal;

  @override
  Widget build(BuildContext context) {
    
    ScanModel model=ModalRoute.of(context).settings.arguments;
    latLangSeleccionado=model.getLatLgn();
  
    final CameraPosition _kGooglePlex = CameraPosition(
    target:latLangSeleccionado ,
    zoom: 14.4746,
    );

    Set<Marker> marker=new Set<Marker>();
      marker.add(new Marker(
        markerId:MarkerId('geo-location'),
        position:latLangSeleccionado
         )
      );

    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa'),
        actions: [
          IconButton(
            icon:Icon(Icons.location_on_outlined) ,
            onPressed: ()async{
                final GoogleMapController controller = await _controller.future;
                controller.animateCamera(
                  CameraUpdate.newCameraPosition(
                   CameraPosition(target: latLangSeleccionado,
                   zoom: 14.4746,)
                )
               );
            },)
        ],
      ),
      body: GoogleMap(
        mapType: tipoMapa,
        initialCameraPosition: _kGooglePlex,
        markers: marker,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
             tipoMapa=tipoMapa==MapType.normal ?MapType.satellite:MapType.normal;

          });
        },
        child: Icon(Icons.map_outlined),
      ),
    );
  }

}