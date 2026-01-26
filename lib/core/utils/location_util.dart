import 'package:dartz/dartz.dart';
import 'package:example_websocket/core/models/location_utils_model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationUtils {
  static Stream<Either<String, LocationUtilsModel>> streamMyPosition({
    LocationAccuracy accuracy = LocationAccuracy.high,
    int distanceFilterMeter = 0,
  }) async* {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        yield const Left('Location service is disabled');
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          yield const Left('Location permission denied');
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        yield const Left('Location permission permanently denied');
        return;
      }

      final locationSettings = LocationSettings(
        accuracy: accuracy,
        distanceFilter: distanceFilterMeter,
      );

      await for (final position
          in Geolocator.getPositionStream(locationSettings: locationSettings)) {
        final location = LocationUtilsModel(
          lat: position.latitude,
          lng: position.longitude,
          accuracy: position.accuracy,
          speed: position.speed,
          altitude: position.altitude,
          timestamp: position.timestamp.millisecondsSinceEpoch,
        );
        yield Right(location);
      }
    } catch (e) {
      yield Left('Location stream error: $e');
    }
  }

  static LatLngBounds calculateBounds(List<LatLng> points) {
    assert(points.isNotEmpty);

    double south = points.first.latitude;
    double north = points.first.latitude;
    double west = points.first.longitude;
    double east = points.first.longitude;

    for (final p in points) {
      south = south < p.latitude ? south : p.latitude;
      north = north > p.latitude ? north : p.latitude;
      west = west < p.longitude ? west : p.longitude;
      east = east > p.longitude ? east : p.longitude;
    }

    return LatLngBounds(
      southwest: LatLng(south, west),
      northeast: LatLng(north, east),
    );
  }

  static Future<Either<String, LocationUtilsModel>>
      getCurrentLocationDetail() async {
    try {
      final serviceEnabled = await Geolocator.isLocationServiceEnabled();

      if (!serviceEnabled) {
        return const Left('Location service is disabled');
      }

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return const Left('Location permission denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        return const Left(
          'Location permission permanently denied',
        );
      }

      final position = await Geolocator.getCurrentPosition(
        locationSettings: const LocationSettings(
          accuracy: LocationAccuracy.high,
        ),
      );

      String? address;

      try {
        final placemarks = await placemarkFromCoordinates(
          position.latitude,
          position.longitude,
        );

        if (placemarks.isNotEmpty) {
          final p = placemarks.first;
          address =
              '${p.street}, ${p.locality}, ${p.administrativeArea}, ${p.country}';
        }
      } catch (_) {}
      final location = LocationUtilsModel(
        lat: position.latitude,
        lng: position.longitude,
        accuracy: position.accuracy,
        altitude: position.altitude,
        speed: position.speed,
        timestamp: DateTime.now().millisecondsSinceEpoch ~/ 1000,
        address: address,
      );

      return Right(location);
    } catch (e) {
      return Left('Failed to get location: $e');
    }
  }

  static double calculateDistance(
    double startLat,
    double startLng,
    double endLat,
    double endLng,
  ) {
    return Geolocator.distanceBetween(
      startLat,
      startLng,
      endLat,
      endLng,
    ); // result in meters
  }

  static double calculateProgress(
    double currentLat,
    double currentLng,
    double startLat,
    double startLng,
    double endLat,
    double endLng,
  ) {
    final totalDistance = calculateDistance(
      startLat,
      startLng,
      endLat,
      endLng,
    );

    if (totalDistance == 0) return 0.0;

    final distanceTraveled = calculateDistance(
      startLat,
      startLng,
      currentLat,
      currentLng,
    );

    return (distanceTraveled / totalDistance).clamp(0.0, 1.0);
  }
}
