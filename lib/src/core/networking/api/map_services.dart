// import 'dart:math';
//
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:sina_doctor_app/core/networking/api/routes_services.dart';
// import 'package:sina_doctor_app/core/theming/colors.dart';
//
// import 'locationServices.dart';
//
// class MapServices {
//   final LocationService locationService = LocationService();
//   final RoutesService routesService = RoutesService();
//
//   LatLng? currentLocation;
//
//   // Update current location on map
//   Future<void> updateCurrentLocation({
//     required GoogleMapController googleMapController,
//     required Set<Marker> markers,
//     required Function onUpdateCurrentLocation,
//   }) async {
//     try {
//       final locationData = await locationService.getCurrentLocation();
//       currentLocation = locationService.locationDataToLatLng(locationData);
//
//       final currentLocationMarker = Marker(
//         markerId: const MarkerId('my location'),
//         position: currentLocation!,
//         icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
//         infoWindow: const InfoWindow(title: 'موقعك الحالي'),
//       );
//
//       final cameraPosition = CameraPosition(
//         target: currentLocation!,
//         zoom: 17,
//       );
//
//       await googleMapController
//           .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
//
//       markers.clear();
//       markers.add(currentLocationMarker);
//       onUpdateCurrentLocation();
//     } catch (e) {
//       rethrow;
//     }
//   }
//
//   // Display route on map
//   void displayRoute(
//     List<LatLng> points, {
//     required Set<Polyline> polyLines,
//     required GoogleMapController googleMapController,
//   }) {
//     final route = Polyline(
//       polylineId: const PolylineId('route'),
//       color: ColorsManager.primaryColor,
//       width: 5,
//       points: points,
//       patterns: [
//         PatternItem.dash(20),
//         PatternItem.gap(10),
//       ],
//     );
//
//     polyLines.clear();
//     polyLines.add(route);
//
//     final bounds = getLatLngBounds(points);
//     googleMapController.animateCamera(CameraUpdate.newLatLngBounds(bounds, 50));
//   }
//
//   // Calculate bounds for multiple points
//   LatLngBounds getLatLngBounds(List<LatLng> points) {
//     if (points.isEmpty) {
//       throw Exception('Points list cannot be empty');
//     }
//
//     double southWestLat = points.first.latitude;
//     double southWestLng = points.first.longitude;
//     double northEastLat = points.first.latitude;
//     double northEastLng = points.first.longitude;
//
//     for (var point in points) {
//       southWestLat = min(southWestLat, point.latitude);
//       southWestLng = min(southWestLng, point.longitude);
//       northEastLat = max(northEastLat, point.latitude);
//       northEastLng = max(northEastLng, point.longitude);
//     }
//
//     return LatLngBounds(
//       southwest: LatLng(southWestLat, southWestLng),
//       northeast: LatLng(northEastLat, northEastLng),
//     );
//   }
//
//   // Get directions between two points
//   Future<(List<LatLng>, double, Duration)> getDirections({
//     required LatLng origin,
//     required LatLng destination,
//   }) async {
//     try {
//       final points = await routesService.fetchDirections(
//         origin: origin,
//         destination: destination,
//       );
//       return points;
//     } catch (e) {
//       throw Exception('Failed to get directions: ${e.toString()}');
//     }
//   }
//
//   // Helper method to get real-time location updates
//   Stream<LatLng> getLocationStream() {
//     return locationService.getLocationStream().map(
//         (locationData) => locationService.locationDataToLatLng(locationData));
//   }
// }
