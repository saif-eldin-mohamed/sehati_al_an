import 'package:flutter/material.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({super.key, required this.title, this.actions});

  final String title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    bool isArabic = Directionality.of(context) == TextDirection.rtl;

    return AppBar(
      backgroundColor: ColorsManager.white,
      centerTitle: false,
      titleSpacing: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Padding(
          padding: const EdgeInsetsDirectional.only(start: 16),
          child: Icon(
            isArabic ? Icons.arrow_back_ios_new : Icons.arrow_back_ios,
          ),
        ),
      ),
      actions: actions,
      title: Text(
        title,
        style: TextStylesManager.bold16,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
