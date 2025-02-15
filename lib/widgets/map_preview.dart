import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPreview extends StatelessWidget {
  final GeoPoint location;

  const MapPreview({super.key, required this.location});

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: LatLng(location.latitude, location.longitude),
        zoom: 14,
      ),
      markers: {
        Marker(
          markerId: const MarkerId('task_location'),
          position: LatLng(location.latitude, location.longitude),
        ),
      },
    );
  }
}