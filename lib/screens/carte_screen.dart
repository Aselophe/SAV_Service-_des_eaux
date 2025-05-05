import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CarteScreen extends StatefulWidget {
  const CarteScreen({super.key});

  @override
  _CarteScreenState createState() => _CarteScreenState();
}

class _CarteScreenState extends State<CarteScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(46.2044, 6.1432); // Genève par défaut

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Carte des Ouvrages')),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center, zoom: 9.0),
      ),
    );
  }
}
