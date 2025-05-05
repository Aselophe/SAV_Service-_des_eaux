import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class CarteSelectionScreen extends StatefulWidget {
  final LatLng? positionInitiale;
  final List<LatLng>? multiplePositions;
  final List<String>? nomsOuvrages;
  final bool lectureSeule;
  final bool montrerPositionActuelle;

  const CarteSelectionScreen({
    this.positionInitiale,
    this.multiplePositions,
    this.nomsOuvrages,
    this.lectureSeule = false,
    this.montrerPositionActuelle = false,
    super.key,
  });

  @override
  State<CarteSelectionScreen> createState() => _CarteSelectionScreenState();
}

class _CarteSelectionScreenState extends State<CarteSelectionScreen> {
  LatLng? _positionSelectionnee;
  LatLng? _positionActuelle;

  @override
  void initState() {
    super.initState();
    if (widget.positionInitiale != null) {
      _positionSelectionnee = widget.positionInitiale;
    }
    if (widget.montrerPositionActuelle) {
      _obtenirPositionActuelle();
    }
  }

  Future<void> _obtenirPositionActuelle() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      final position = await Geolocator.getCurrentPosition();
      setState(() {
        _positionActuelle = LatLng(position.latitude, position.longitude);
      });
    }
  }

  void _selectionnerPosition(LatLng pos) {
    if (!widget.lectureSeule) {
      setState(() {
        _positionSelectionnee = pos;
      });
    }
  }

  void _valider() {
    if (_positionSelectionnee != null) {
      Navigator.pop(context, _positionSelectionnee);
    }
  }

  @override
  Widget build(BuildContext context) {
    final cameraTarget =
        widget.positionInitiale ??
        widget.multiplePositions?.first ??
        _positionActuelle ??
        LatLng(46.8, 8.2);

    final cameraPosition = CameraPosition(target: cameraTarget, zoom: 14);

    Set<Marker> marqueurs = {};

    if (widget.multiplePositions != null) {
      for (int i = 0; i < widget.multiplePositions!.length; i++) {
        marqueurs.add(
          Marker(
            markerId: MarkerId('multi_$i'),
            position: widget.multiplePositions![i],
            infoWindow: InfoWindow(
              title:
                  widget.nomsOuvrages != null && i < widget.nomsOuvrages!.length
                      ? widget.nomsOuvrages![i]
                      : 'Ouvrage',
            ),
          ),
        );
      }
    } else if (_positionSelectionnee != null) {
      marqueurs.add(
        Marker(
          markerId: MarkerId('selection'),
          position: _positionSelectionnee!,
          infoWindow: InfoWindow(title: 'Position sélectionnée'),
        ),
      );
    }

    if (_positionActuelle != null) {
      marqueurs.add(
        Marker(
          markerId: MarkerId('actuelle'),
          position: _positionActuelle!,
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueAzure,
          ),
          infoWindow: InfoWindow(title: 'Vous êtes ici'),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.lectureSeule ? 'Carte' : 'Choisir une position'),
      ),
      body: GoogleMap(
        initialCameraPosition: cameraPosition,
        markers: marqueurs,
        onTap: _selectionnerPosition,
        myLocationEnabled: widget.montrerPositionActuelle,
      ),
      floatingActionButton:
          widget.lectureSeule
              ? null
              : FloatingActionButton.extended(
                onPressed: _valider,
                label: Text('Valider'),
                icon: Icon(Icons.check),
              ),
    );
  }
}
