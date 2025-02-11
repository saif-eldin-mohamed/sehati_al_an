import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void customToastNotification(
  BuildContext context, {
  required String text,
  required ToastificationType type,
  int duration = 2,
  TextDirection direction = TextDirection.rtl,
}) {
  toastification.dismissAll();

  toastification.show(
    context: context,
    type: type,
    style: ToastificationStyle.flat,
    autoCloseDuration: Duration(seconds: duration),
    description: Text(
      text,
      // style:
      // context.titleSmall.copyWith(
      //   fontWeight: FontWeight.w700,
      //   fontSize: 16.responsive,
      // ),
    ),
    alignment: Alignment.topRight,
    direction: direction,
    animationDuration: const Duration(milliseconds: 200),
    showIcon: true,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    borderRadius: BorderRadius.circular(12),
    showProgressBar: true,
    closeButtonShowType: CloseButtonShowType.always,
    closeOnClick: false,
    pauseOnHover: true,
    dragToClose: true,
    applyBlurEffect: false,
  );
}
