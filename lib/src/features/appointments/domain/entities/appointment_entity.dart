import '../../../../core/helpers/enums.dart';
import '../../../../core/resourses/theming/images.dart';
import '../../data/models/appointment_model.dart';

class StaticData {
  static final List<Appointment> appointments = [
    Appointment(
      id: '1',
      doctorName: 'Dr. Sarah Patel',
      doctorImage: ImagesManager.onBoarding_3,
      specialty: 'Internal Medicine',
      dateTime: DateTime.now().add(Duration(days: 2)),
      duration: Duration(minutes: 45),
      type: AppointmentType.appointmentDate,
      status: AppointmentStatus.completed,
    ),
    Appointment(
      id: '2',
      doctorName: 'Dr. Olivia Smith',
      doctorImage: ImagesManager.doctorImg,
      specialty: 'Pediatric Dentistry',
      dateTime: DateTime.now().add(Duration(days: 3)),
      type: AppointmentType.video,
      duration: Duration(minutes: 30),
      status: AppointmentStatus.approved,
    ),
    Appointment(
      id: '3',
      doctorName: 'Dr. Liam Johnson',
      doctorImage: ImagesManager.onBoarding_1,
      specialty: 'Oral and Maxillofacial Surgery',
      dateTime: DateTime.now().add(const Duration(days: 1)),
      duration: const Duration(minutes: 45),
      type: AppointmentType.messaging,
      status: AppointmentStatus.pending,
    ),
    Appointment(
      id: '4',
      doctorName: 'Dr. Michael Brown',
      doctorImage: ImagesManager.onBoarding_2,
      specialty: 'Cardiology',
      dateTime: DateTime.now().subtract(Duration(days: 1)),
      duration: Duration(minutes: 30),
      type: AppointmentType.appointmentDate,
      status: AppointmentStatus.completed,
    ),
  ];
}
