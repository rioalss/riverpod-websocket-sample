import 'package:example_websocket/core/utils/location_util.dart';
import 'package:example_websocket/shared/widgets/map_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key, this.initialPosition});
  final LatLng? initialPosition;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? _mapController;
  Marker? _selectedMarker;
  LatLng? _selectedLocation;
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _moveToCurrentLocation() async {
    final res = await LocationUtils.getCurrentLocationDetail();

    res.fold(
      (_) {
        // optional: show snackbar / ignore
      },
      (data) async {
        final position = LatLng(
          data.lat ?? 0,
          data.lng ?? 0,
        );

        await animateTo(position, zoom: 16);

        setState(() {
          _selectedLocation = position;
          _selectedMarker = Marker(
            markerId: const MarkerId('current'),
            position: position,
            infoWindow: const InfoWindow(title: 'Your Location'),
          );
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final safePadding = MediaQuery.of(context).padding;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            // Reusable Map
            MapView(
              onMapCreated: (controller) async {
                _mapController = controller;

                if (widget.initialPosition != null) {
                  _onMapTap(widget.initialPosition!);
                } else {
                  await _moveToCurrentLocation();
                }
              },
              markers: _selectedMarker != null ? {_selectedMarker!} : {},
              onTap: _onMapTap,
              showMyLocation: true,
            ),

            // Button Next
            if (_selectedLocation != null)
              Positioned(
                bottom: safePadding.bottom,
                left: 16,
                right: 16,
                child: ElevatedButton(
                  onPressed: _finishSelection,
                  child: const Text('Next'),
                ),
              ),

            // Reusable Search Bar
            // Positioned(
            //   top: safePadding.top,
            //   left: 16,
            //   right: 16,
            //   child: MapSearchBar(
            //     searchController: _searchController,
            //     onPlaceSelected: _onPlaceSelected,
            //     onClear: _clearSelection,
            //   ),
            // ),

            // Positioned(
            //   top: size.height * .75,
            //   right: 16,
            //   child: InkWell(
            //     onTap: () async {
            //       final res = await LocationUtils.getCurrentLocationDetail();
            //       if (res.isRight()) {
            //         final data = res.getOrElse(() => {});
            //         _onPlaceSelected(
            //             LatLng(data['lat'] as double, data['lng']));
            //       }
            //     },
            //     child: Container(
            //       padding: const EdgeInsets.all(10),
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         borderRadius: BorderRadius.circular(12),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.black.withValues(alpha: 0.1),
            //             blurRadius: 10,
            //           ),
            //         ],
            //       ),
            //       child: const Icon(Icons.my_location),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Future<void> animateTo(LatLng position, {double zoom = 16}) async {
    if (_mapController == null) return;
    await _mapController!.animateCamera(
      duration: const Duration(milliseconds: 1500),
      CameraUpdate.newLatLngZoom(position, zoom),
    );
  }

  void _onPlaceSelected(LatLng position) async {
    await animateTo(position, zoom: 17);
    setState(() {
      _selectedLocation = position;
      _selectedMarker = Marker(
        markerId: const MarkerId('selected'),
        position: position,
        infoWindow: const InfoWindow(title: 'Selected Location'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
        draggable: true,
        onDragEnd: (newPosition) =>
            setState(() => _selectedLocation = newPosition),
      );
    });
    FocusScope.of(context).unfocus();
    // await _mapController?.showMarkerInfoWindow(const MarkerId('selected'));

    // Access MapView controller via GlobalKey jika perlu animate
    // _searchController.text =  ;
  }

  void _onMapTap(LatLng position) => _onPlaceSelected(position);

  void _clearSelection() {
    setState(() {
      _selectedLocation = null;
      _selectedMarker = null;
      _searchController.clear();
    });
  }

  void _finishSelection() {
    if (_selectedLocation != null) {
      context.pop(_selectedLocation);
    }
  }
}
