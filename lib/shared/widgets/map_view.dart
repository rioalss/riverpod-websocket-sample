import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  final Set<Marker> markers;
  final LatLng? driverLocation;
  final Function(LatLng)? onTap;
  final bool showMyLocation;
  final CameraPosition? initialPosition;
  final Function(GoogleMapController)? onMapCreated;
  final BitmapDescriptor? driverIcon;
  final Set<Polygon> polygons;
  final Set<Polyline> polylines;
  final void Function()? onMapDisposed;

  const MapView({
    super.key,
    required this.markers,
    this.driverLocation,
    this.onTap,
    this.showMyLocation = true,
    this.onMapCreated,
    this.initialPosition,
    this.driverIcon,
    this.polygons = const {},
    this.polylines = const {},
    this.onMapDisposed,
  });

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  GoogleMapController? _controller;

  void _onMapCreated(GoogleMapController controller) {
    _controller ??= controller;
    widget.onMapCreated?.call(controller);
  }

  @override
  void dispose() {
    widget.onMapDisposed?.call();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: widget.initialPosition ??
          const CameraPosition(
            target: LatLng(-6.2088, 106.8456),
            zoom: 12,
          ),
      markers: widget.markers,
      myLocationEnabled: widget.showMyLocation,
      myLocationButtonEnabled: widget.showMyLocation,
      onTap: widget.onTap,
      zoomControlsEnabled: false,
      compassEnabled: false,
      polygons: widget.polygons,
      polylines: widget.polylines,
    );
  }
}
