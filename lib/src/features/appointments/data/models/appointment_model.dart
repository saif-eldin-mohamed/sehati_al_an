import '../../../../core/helpers/enums.dart';

class Appointment {
  final String id;
  final String doctorName;
  final String doctorImage;
  final String specialty;
  final DateTime dateTime;
  final Duration duration;
  final AppointmentType type;
  final AppointmentStatus status;

  const Appointment({
    required this.id,
    required this.doctorName,
    required this.doctorImage,
    required this.specialty,
    required this.dateTime,
    required this.duration,
    required this.type,
    required this.status,
  });
}
