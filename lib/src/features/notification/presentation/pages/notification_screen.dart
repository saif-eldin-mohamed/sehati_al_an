import 'package:flutter/material.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/images.dart';
import 'package:sehati_al_an_app/src/core/widgets/default_app_bar.dart';

import '../widgets/notification_card.dart';
import '../widgets/notification_card_list_view.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const DefaultAppBar(title: 'Notifications', showLeading: false),
        body: NotificationCardListView());
  }
}
