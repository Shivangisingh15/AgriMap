import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:table_calendar/table_calendar.dart';

class anlysefarm extends StatefulWidget {
  const anlysefarm({super.key});

  @override
  State<anlysefarm> createState() => _anlysefarmState();
}

// ignore: camel_case_types
class _anlysefarmState extends State<anlysefarm> {
  Completer<GoogleMapController> _controller = Completer();
  // ignore: prefer_const_declarations
  static final CameraPosition _kgooglePlex = const CameraPosition(
    target: LatLng(20.3000, -40.2990),
    zoom: 14,
    tilt: 3,
  );
  List<Marker> _marker = [];
  List<Marker> _list = const [
    Marker(
      markerId: MarkerId('1'),
      position: LatLng(20.3000, -40.2990),
    )
  ];
  @override
  void initState() {
    super.initState();
    _marker.addAll(_list);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _kgooglePlex,
        markers: Set.of(_marker),
        mapType: MapType.hybrid,
        compassEnabled: true,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
    );
  }
}
