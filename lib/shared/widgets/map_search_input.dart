import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:example_websocket/core/config/app_config.dart';

class MapSearchBar extends StatefulWidget {
  final TextEditingController searchController;
  final Function(LatLng) onPlaceSelected;
  final VoidCallback? onClear;

  const MapSearchBar({
    super.key,
    required this.searchController,
    required this.onPlaceSelected,
    this.onClear,
  });

  @override
  State<MapSearchBar> createState() => _MapSearchBarState();
}

class _MapSearchBarState extends State<MapSearchBar> {
  final FocusNode _focusNode = FocusNode();

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GooglePlaceAutoCompleteTextField(
      focusNode: _focusNode,
      textEditingController: widget.searchController,
      googleAPIKey: AppConfig.googleMapApiKey,
      inputDecoration: InputDecoration(
        hintText: 'Search location...',
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        filled: true,
        fillColor: Colors.grey.shade50,
        prefixIcon: const Icon(Icons.search, color: Colors.grey),
        suffixIcon: widget.searchController.text.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () {
                  widget.searchController.clear();
                  widget.onClear?.call();
                },
              )
            : null,
      ),
      debounceTime: 400,
      countries: const ['id'],
      isLatLngRequired: true,
      getPlaceDetailWithLatLng: (Prediction prediction) {
        widget.onPlaceSelected(
          LatLng(
            (double.tryParse(prediction.lat ?? '0') ?? 0.0),
            (double.tryParse(prediction.lng ?? '0') ?? 0.0),
          ),
        );
      },
      itemClick: (Prediction prediction) {
        widget.searchController.text = prediction.description ?? '';
        widget.searchController.selection = TextSelection.fromPosition(
          TextPosition(offset: prediction.description?.length ?? 0),
        );
      },
      itemBuilder: (context, index, Prediction prediction) {
        return Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              const Icon(Icons.location_on),
              const SizedBox(width: 7),
              Expanded(
                child: Text(
                  prediction.description ?? '',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        );
      },
      seperatedBuilder: const Divider(),
      isCrossBtnShown: false,
    );
  }
}
