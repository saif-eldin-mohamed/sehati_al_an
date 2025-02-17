import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/enums.dart';
import '../../../../core/resourses/theming/colors.dart';
import '../../data/models/appointment_model.dart';

// Appointment Button Model
class AppointmentButton {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;

  const AppointmentButton({
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
  });
}

// Appointment Actions Manager
class AppointmentActions {
  static List<AppointmentButton> getButtons(
    Appointment appointment,
    BuildContext context,
  ) {
    final List<AppointmentButton> buttons = [];

    void handleNavigation(String route) {
      Navigator.pushNamed(context, route, arguments: appointment);
    }

    // Handle primary action based on appointment type
    _addPrimaryActionButton(appointment, buttons, handleNavigation);

    // Add review/cancel button based on status
    _addSecondaryActionButton(appointment, buttons, context);

    return buttons;
  }

  static void _addPrimaryActionButton(
    Appointment appointment,
    List<AppointmentButton> buttons,
    Function(String) handleNavigation,
  ) {
    switch (appointment.type) {
      case AppointmentType.video:
        buttons.add(
          AppointmentButton(
            text: 'Join Call',
            backgroundColor: ColorsManager.primary,
            textColor: ColorsManager.white,
            onPressed: () {},
          ),
        );
        break;
      case AppointmentType.messaging:
        buttons.add(
          AppointmentButton(
            text: 'Write a message',
            backgroundColor: ColorsManager.primary,
            textColor: ColorsManager.white,
            onPressed: () {},
          ),
        );
        break;
      default:
        if (appointment.status == AppointmentStatus.completed) {
          buttons.add(
            AppointmentButton(
              text: 'Write your review',
              backgroundColor: ColorsManager.secondary.withOpacity(0.2),
              textColor: ColorsManager.primary,
              onPressed: () {},
            ),
          );
        }
    }
  }

  static void _addSecondaryActionButton(
    Appointment appointment,
    List<AppointmentButton> buttons,
    BuildContext context,
  ) {
    if (appointment.status == AppointmentStatus.approved) {
      buttons.add(
        AppointmentButton(
          text: 'Write your review',
          backgroundColor: ColorsManager.primary.withOpacity(0.2),
          textColor: ColorsManager.primary,
          onPressed: () {},
        ),
      );
    }
  }
}
