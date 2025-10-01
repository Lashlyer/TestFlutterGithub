import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shopping_list/models/storeDetail/storeDetail.dart';

class StoreMapScreen extends StatelessWidget {
  final StoreDetail detail;

  const StoreMapScreen({super.key, required this.detail});

  @override
  Widget build(BuildContext context) {
    LatLng detailLal = LatLng(detail.latvalue(), detail.lngvalue());

    return SizedBox(
        width: double.infinity,
        height: 250,
        child: GoogleMap(
          initialCameraPosition: CameraPosition(target: detailLal, zoom: 13),
          markers: {
            Marker(
              markerId: const MarkerId('test'),
              icon: BitmapDescriptor.defaultMarker,
              position: detailLal)
          },
        ),
        
      );
  }
}
