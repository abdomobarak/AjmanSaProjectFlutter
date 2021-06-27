
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';




class AcademyLocation extends StatefulWidget {
  const AcademyLocation({Key key}) : super(key: key);

  @override
  _AcademyLocationState createState() => _AcademyLocationState();
}



class _AcademyLocationState extends State<AcademyLocation> {
  GoogleMapController myMapController;
  final Set<Marker> markers = new Set();
  LatLng mainLocation = const LatLng(25.414171991620158, 55.471508711641555);



  Set<Marker> myMarker() {
    setState(() {
      markers.add(Marker(
        // This marker id can be anything that uniquely identifies each marker.
        markerId: MarkerId(mainLocation.toString()),
        position: mainLocation,
        icon: BitmapDescriptor.defaultMarker,
      ));
    });

    return markers;
  }



  @override
  Widget build(BuildContext context) {


    return  Container(
        height: MediaQuery.of(context).size.height ,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: mainLocation,
              zoom: 10.0,
            ),
            markers: this.myMarker(),
            mapType: MapType.normal,
            onMapCreated: (controller) {
              setState(() {
                myMapController = controller;
              });
            },
          ),

    );
  }





}


