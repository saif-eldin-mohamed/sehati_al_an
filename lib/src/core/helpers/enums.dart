//*********************** enums for languages *********************
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';

enum LanguageType { english, arabic }

//*********************** enums for api requests *********************
enum RequestMethod { get, post, put, delete, patch }
//*********************** enums for cart buttons *********************

enum AppointmentType {
  appointmentDate,
  video,
  messaging;

  String get displayName {
    switch (this) {
      case AppointmentType.appointmentDate:
        return 'Appointment date';
      case AppointmentType.video:
        return 'Video call date';
      case AppointmentType.messaging:
        return 'Messaging date';
    }
  }
}

enum AppointmentStatus {
  approved,
  pending,
  completed,
  cancelled,
  inProgress;

  String get displayName {
    switch (this) {
      case AppointmentStatus.approved:
        return 'Approved';
      case AppointmentStatus.pending:
        return 'Pending';
      case AppointmentStatus.completed:
        return 'Completed';
      case AppointmentStatus.cancelled:
        return 'Cancelled';
      case AppointmentStatus.inProgress:
        return 'In Progress';
    }
  }

  IconData get statusIcon {
    switch (this) {
      case AppointmentStatus.approved:
        return Icons.check_circle;
      case AppointmentStatus.pending:
        return Icons.access_time;
      case AppointmentStatus.cancelled:
        return Icons.cancel;
      case AppointmentStatus.inProgress:
        return Icons.autorenew;
      default:
        return Icons.info;
    }
  }

  Color get statusColor {
    switch (this) {
      case AppointmentStatus.approved:
        return Colors.green;
      case AppointmentStatus.pending:
        return Colors.orange;
      case AppointmentStatus.cancelled:
        return Colors.red;
      case AppointmentStatus.inProgress:
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
