// ignore_for_file: library_private_types_in_public_api, unnecessary_this, prefer_const_constructors, file_names, use_build_context_synchronously, deprecated_member_use, unused_field, prefer_final_fields, constant_identifier_names, non_constant_identifier_names, unused_local_variable

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// create global lat long variables for each service
const LatLng location_autoSchunn =
    LatLng(45.77420730285651, 21.295807103557618);
const LatLng location_autoKlass = LatLng(45.76957885761992, 21.22032364121554);
const LatLng location_RMBCasaAutoTimisoaraMercedesBenz =
    LatLng(45.71379374151405, 21.192336844678014);
const LatLng location_BmwServiceTimisoara =
    LatLng(45.69643151051833, 21.176931556005574);
const LatLng location_DaciaService =
    LatLng(45.76877827862469, 21.222284218447292);
const LatLng location_SkodaService =
    LatLng(45.718902009112206, 21.19483613942405);
const LatLng location_VolkswagenService =
    LatLng(45.71738458490232, 21.19429261667287);
const LatLng location_HyundaiService =
    LatLng(45.703804509844375, 21.18551514929515);
const LatLng location_ToyotaService = LatLng(45.775602016907996, 21.3037432);

class MapWithServiceImages extends StatefulWidget {
  const MapWithServiceImages({super.key});

  @override
  State<MapWithServiceImages> createState() => _MapWithServiceImagesState();
}

class _MapWithServiceImagesState extends State<MapWithServiceImages> {
  Completer<GoogleMapController> _controller = Completer();
  Map<String, Marker> _markers = {};

  //Initial map position on load
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(45.760696, 21.226788),
    zoom: 11.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
          addMarker('autoSchunn', location_autoSchunn);
          addMarker('autoKlass', location_autoKlass);
          addMarker('RMBCasaAutoTimisoaraMercedesBenz',
              location_RMBCasaAutoTimisoaraMercedesBenz);
          addMarker('bmwService', location_BmwServiceTimisoara);
          addMarker('daciaService', location_DaciaService);
          addMarker('skodaService', location_SkodaService);
          addMarker('volkswagenService', location_VolkswagenService);
          addMarker('hyundaiService', location_HyundaiService);
          addMarker('toyotaService', location_ToyotaService);
        },
        markers: _markers.values.toSet(),
      ),
    );
  }

  // each marker I place on the map must have a unique key, I can't have 2 markers with the same id
  // because of this, I will add id as a parameter to my function
  // also added a Latlng parameter so that I place the marker exactly where I want
  addMarker(String id, LatLng location) async {
    var markerIcon_Mercedes = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/mercedesService_RESIZED.png');
    var markerIcon_Bmw = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/bmwService_RESIZED.png');
    var markerIcon_Dacia = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/daciaService_RESIZED.png');
    var markerIcon_Skoda = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/skodaService_RESIZED.png');
    var markerIcon_Volkswagen = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/volkswagenService_RESIZED.png');
    var markerIcon_Hyundai = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/hyundaiService_RESIZED.png');
    var markerIcon_Toyota = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(), 'assets/toyotaService_RESIZED.png');

    if (id == 'autoSchunn') {
      var marker_autoSchunn = Marker(
        markerId: MarkerId(id),
        position: location,
        infoWindow: const InfoWindow(
          title: " Mercedes Auto Schunn Timișoara Service",
        ),
        icon: markerIcon_Mercedes,
      );
      _markers[id] = marker_autoSchunn;
      setState(() {});
    }

    if (id == 'autoKlass') {
      var marker_autoKlass = Marker(
        markerId: MarkerId(id),
        position: location_autoKlass,
        infoWindow: const InfoWindow(
          title: " Mercedes Auto Klass Timișoara Service",
        ),
        icon: markerIcon_Mercedes,
      );
      _markers[id] = marker_autoKlass;
      setState(() {});
    }

    if (id == 'RMBCasaAutoTimisoaraMercedesBenz') {
      var marker_RMBMercedesBenz = Marker(
        markerId: MarkerId(id),
        position: location_RMBCasaAutoTimisoaraMercedesBenz,
        infoWindow: const InfoWindow(
          title: " RMB -Casa Auto Timișoara- Mercedes Benz",
        ),
        icon: markerIcon_Mercedes,
      );
      _markers[id] = marker_RMBMercedesBenz;
      setState(() {});
    }

    if (id == 'bmwService') {
      var marker_bmwService = Marker(
        markerId: MarkerId(id),
        position: location_BmwServiceTimisoara,
        infoWindow: const InfoWindow(
          title: " BMW SERVICE TIMISOARA",
        ),
        icon: markerIcon_Bmw,
      );
      _markers[id] = marker_bmwService;
      setState(() {});
    }

    if (id == 'daciaService') {
      var marker_daciaService = Marker(
        markerId: MarkerId(id),
        position: location_DaciaService,
        infoWindow: const InfoWindow(
          title: " DACIA AUTO EUROPA TIMISOARA 2",
        ),
        icon: markerIcon_Dacia,
      );
      _markers[id] = marker_daciaService;
      setState(() {});
    }

    if (id == 'skodaService') {
      var marker_skodaService = Marker(
        markerId: MarkerId(id),
        position: location_SkodaService,
        infoWindow: const InfoWindow(
          title: " Procar Skoda",
        ),
        icon: markerIcon_Skoda,
      );
      _markers[id] = marker_skodaService;
      setState(() {});
    }

    if (id == 'volkswagenService') {
      var marker_volkswagenService = Marker(
        markerId: MarkerId(id),
        position: location_VolkswagenService,
        infoWindow: const InfoWindow(
          title: " Procar Volkswagen",
        ),
        icon: markerIcon_Volkswagen,
      );
      _markers[id] = marker_volkswagenService;
      setState(() {});
    }

    if (id == 'hyundaiService') {
      var marker_hyundaiService = Marker(
        markerId: MarkerId(id),
        position: location_HyundaiService,
        infoWindow: const InfoWindow(
          title: " Hyundai Timisoara | Casa Auto",
        ),
        icon: markerIcon_Hyundai,
      );
      _markers[id] = marker_hyundaiService;
      setState(() {});
    }

    if (id == 'toyotaService') {
      var marker_toyotaService = Marker(
        markerId: MarkerId(id),
        position: location_ToyotaService,
        infoWindow: const InfoWindow(
          title: " Toyota Timișoara",
        ),
        icon: markerIcon_Toyota,
      );
      _markers[id] = marker_toyotaService;
      setState(() {});
    }
  }
}
