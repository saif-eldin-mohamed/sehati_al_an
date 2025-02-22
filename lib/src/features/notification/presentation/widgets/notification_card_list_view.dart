import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resourses/theming/images.dart';
import 'notification_card.dart';

class NotificationCardListView extends StatelessWidget {
  const NotificationCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0.r),
      child: ListView.builder(
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) {
          return const NotificationCard(
            image: ImagesManager.splashImg,
            title: 'Upcoming Video Call',
            description: 'Reminder: Your video call with Dr. Olivia Smith is',
            highlightText: 'in 15 minutes.',
          );
        },
      ),
    );
  }
}
