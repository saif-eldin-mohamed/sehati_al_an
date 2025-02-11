// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// class RoutesService {
//   final String baseUrl =
//       'https://routes.googleapis.com/directions/v2:computeRoutes';
//   final String apiKey = 'AIzaSyARJKYuZLAoUWO0M68tJLDrbUjAz57FaGA';
//
//   Future<(List<LatLng>, double, Duration)> fetchDirections({
//     required LatLng origin,
//     required LatLng destination,
//   }) async {
//     try {
//       PolylinePoints polylinePoints = PolylinePoints();
//
//       PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//         googleApiKey: "AIzaSyARJKYuZLAoUWO0M68tJLDrbUjAz57FaGA",
//         request: PolylineRequest(
//           origin: PointLatLng(origin.latitude, origin.longitude),
//           destination: PointLatLng(destination.latitude, destination.longitude),
//           mode: TravelMode.driving,
//         ),
//       );
//
//       List<LatLng> points = result.points
//           .map((point) => LatLng(point.latitude, point.longitude))
//           .toList();
//
//       // Extract distance and duration if available
//       int? distanceMeters = result.totalDistanceValue; // Distance in meters
//       int? durationSeconds = result.totalDurationValue; // Duration in seconds
//
//       double distanceKm = distanceMeters != null ? distanceMeters / 1000.0 : 0;
//       Duration duration = Duration(seconds: durationSeconds ?? 0);
//
//       return (points, distanceKm, duration);
//     } catch (e) {
//       throw Exception('unable to get directions');
//     }
//   }
// }
