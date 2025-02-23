import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../../../core/resourses/theming/colors.dart';
import '../../../../../core/resourses/theming/styles.dart';
import 'filter_bottom-sheet.dart';

class AppBarSearchDetails extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSearchDetails({super.key});

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => FilterBottomSheet(
        onApplyFilter: (sort, subspecialty, type) {
          // Handle the filter results here
          print('Sort: $sort');
          print('Subspecialty: $subspecialty');
          print('Type: $type');
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorsManager.white,
      scrolledUnderElevation: 0,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        'Results',
        style: TextStylesManager.extraBold20.copyWith(
          color: ColorsManager.primary,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(LucideIcons.filter),
          onPressed: () => _showFilterBottomSheet(context),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}