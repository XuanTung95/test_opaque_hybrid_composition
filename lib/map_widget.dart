


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapWidget extends StatefulWidget {
  const MapWidget({
    Key? key,
    this.markers,
    this.onControllerCreated,
    this.circles = const {},
    this.polyLines = const {},
  }) : super(key: key);
  final Set<Marker>? markers;
  final Set<Circle> circles;
  final Set<Polyline> polyLines;
  final void Function(GoogleMapController controller)? onControllerCreated;

  @override
  State<MapWidget> createState() => _MapWidgetState();
}

class _MapWidgetState extends State<MapWidget> {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _startPosition = CameraPosition(
    target: LatLng(35.70906377343968, 139.7030240122369),
    zoom: 14.4746,
  );

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.future.then((value) {
      value.dispose();
    });
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: _startPosition,
      onCameraMove: (detail) {},
    );
  }
}
