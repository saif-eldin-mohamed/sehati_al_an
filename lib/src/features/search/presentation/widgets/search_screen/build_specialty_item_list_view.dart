import 'package:flutter/cupertino.dart';
import 'package:sehati_al_an_app/src/features/search/presentation/widgets/search_screen/specialty_item.dart';

import '../../../../../core/resourses/theming/images.dart';

class SpecialtyItemListView extends StatelessWidget {
  const SpecialtyItemListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) => const SpecialtyItem(
          title: 'Dentistry',
          imagePath: SvgsManager.DentistrySvg,
        ),
      ),
    );
  }
}
