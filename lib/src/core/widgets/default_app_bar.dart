import 'package:flutter/material.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    super.key,
    required this.title,
    this.actions,
    this.elevation = 0,
    this.scrolledUnderElevation = 0,
    this.showLeading = true,
  });

  final String title;
  final List<Widget>? actions;
  final double elevation;
  final double scrolledUnderElevation;
  final bool showLeading;

  @override
  Widget build(BuildContext context) {
    final bool isArabic = Directionality.of(context) == TextDirection.rtl;

    return AppBar(
      backgroundColor: ColorsManager.white,
      centerTitle: true,
      scrolledUnderElevation: 0,
      elevation: elevation,
      surfaceTintColor: Colors.transparent,
      leadingWidth: 56,
      leading: showLeading
          ? GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => Navigator.pop(context),
              child: Container(
                padding: const EdgeInsetsDirectional.only(start: 16),
                alignment: AlignmentDirectional.centerStart,
                child: Icon(
                  isArabic ? Icons.arrow_back_ios_new : Icons.arrow_back_ios,
                  color: Colors.black,
                  size: 24,
                ),
              ),
            )
          : const SizedBox(width: 0),
      actions: actions,
      title: Text(
        title,
        style: TextStylesManager.extraBold20.copyWith(
          color: ColorsManager.primary,
        ),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
