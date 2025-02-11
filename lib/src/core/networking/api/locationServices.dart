// import 'dart:developer';
//
// import 'package:geocoding/geocoding.dart' as geocoding;
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart';
//
// class LocationService {
//   final Location _location = Location();
//
//   // التحقق من تمكين خدمات الموقع
//   Future<void> checkAndRequestLocationService() async {
//     var isServiceEnabled = await _location.serviceEnabled();
//     if (!isServiceEnabled) {
//       isServiceEnabled = await _location.requestService();
//       if (!isServiceEnabled) {
//         throw LocationServiceException('خدمات الموقع معطلة');
//       }
//     }
//   }
//
//   // التحقق وطلب أذونات الموقع
//   Future<void> checkAndRequestLocationPermission() async {
//     var permissionStatus = await _location.hasPermission();
//     if (permissionStatus == PermissionStatus.deniedForever) {
//       throw LocationPermissionException('تم رفض إذن الموقع بشكل دائم');
//     }
//     if (permissionStatus == PermissionStatus.denied) {
//       permissionStatus = await _location.requestPermission();
//       if (permissionStatus != PermissionStatus.granted) {
//         throw LocationPermissionException('تم رفض إذن الموقع');
//       }
//     }
//   }
//
//   // الحصول على الموقع الحالي
//   Future<LocationData> getCurrentLocation() async {
//     try {
//       await checkAndRequestLocationService();
//       await checkAndRequestLocationPermission();
//
//       final locationData = await _location.getLocation();
//       if (locationData.latitude == null || locationData.longitude == null) {
//         throw LocationServiceException('تعذر الحصول على بيانات الموقع');
//       }
//
//       return locationData;
//     } catch (e) {
//       if (e is LocationServiceException || e is LocationPermissionException) {
//         rethrow;
//       }
//       throw LocationServiceException(
//           'فشل في الحصول على الموقع الحالي: ${e.toString()}');
//     }
//   }
//
//   // الحصول على تحديثات الموقع في الوقت الفعلي
//   Stream<LocationData> getLocationStream() async* {
//     try {
//       await checkAndRequestLocationService();
//       await checkAndRequestLocationPermission();
//
//       await for (final locationData in _location.onLocationChanged) {
//         if (locationData.latitude != null && locationData.longitude != null) {
//           log("خط العرض: ${locationData.latitude}");
//           log("خط الطول: ${locationData.longitude}");
//           yield locationData;
//         }
//       }
//     } catch (e) {
//       if (e is LocationServiceException || e is LocationPermissionException) {
//         rethrow;
//       }
//       throw LocationServiceException(
//           'فشل في الحصول على تحديثات الموقع: ${e.toString()}');
//     }
//   }
//
//   // الحصول على تفاصيل العنوان من الموقع الحالي
//   Future<geocoding.Placemark> getCurrentPlace() async {
//     try {
//       geocoding.setLocaleIdentifier('ar');
//       final locationData = await getCurrentLocation();
//
//       final placeMarks = await geocoding.placemarkFromCoordinates(
//         locationData.latitude!,
//         locationData.longitude!,
//       );
//
//       if (placeMarks.isEmpty) {
//         throw LocationServiceException('لم يتم العثور على عنوان للموقع الحالي');
//       }
//
//       return placeMarks.first;
//     } catch (e) {
//       if (e is LocationServiceException || e is LocationPermissionException) {
//         rethrow;
//       }
//       throw LocationServiceException(
//           'فشل في الحصول على تفاصيل العنوان: ${e.toString()}');
//     }
//   }
//
//   // الحصول على تفاصيل العنوان من إحداثيات محددة
//   Future<geocoding.Placemark> getPlaceFromLatLng({
//     required LatLng latLng,
//   }) async {
//     try {
//       geocoding.setLocaleIdentifier('ar');
//
//       final placeMarks = await geocoding.placemarkFromCoordinates(
//         latLng.latitude,
//         latLng.longitude,
//       );
//
//       if (placeMarks.isEmpty) {
//         throw LocationServiceException(
//             'لم يتم العثور على عنوان للإحداثيات المحددة');
//       }
//
//       return placeMarks.first;
//     } catch (e) {
//       if (e is LocationServiceException || e is LocationPermissionException) {
//         rethrow;
//       }
//       throw LocationServiceException(
//           'فشل في الحصول على تفاصيل العنوان: ${e.toString()}');
//     }
//   }
//
//   // تحويل بيانات الموقع إلى LatLng
//   LatLng locationDataToLatLng(LocationData locationData) {
//     if (locationData.latitude == null || locationData.longitude == null) {
//       throw LocationServiceException('بيانات الموقع غير صالحة');
//     }
//     return LatLng(locationData.latitude!, locationData.longitude!);
//   }
// }
//
// // استثناءات مخصصة
// class LocationServiceException implements Exception {
//   final String message;
//
//   LocationServiceException([this.message = 'حدث خطأ في خدمات الموقع']);
//
//   @override
//   String toString() => message;
// }
//
// class LocationPermissionException implements Exception {
//   final String message;
//
//   LocationPermissionException([
//     this.message = 'حدث خطأ في أذونات الموقع',
//   ]);
//
//   @override
//   String toString() => message;
// }
