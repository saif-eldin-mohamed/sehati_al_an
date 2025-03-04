import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../resourses/theming/colors.dart';
import '../resourses/theming/styles.dart';

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Text(
        title,
        style: TextStylesManager.extraBold18
            .copyWith(color: ColorsManager.primary),
      ),
    );
  }
}

class BiographyCard extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onMorePressed;

  const BiographyCard({
    Key? key,
    required this.isExpanded,
    required this.onMorePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.r),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: ColorsManager.primary.withOpacity(.2),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ولدت الدكتورة سارة باتيل في مومباي، الهند عام ١٩٨٠. كانت مستوحاة من التزامها بخدمة الآخرين. منذ سن مبكرة، عرفت سارة أنها تريد أن تسير على خطى أسلافها وتتابع مهنة في الطب.',
            style: TextStylesManager.regular14.copyWith(
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 4.h),
          if (isExpanded) ...[
            Text(
              'بعد إكمال دراستها الجامعية، واصلت سارة تعليمها في كلية الطب وتخصصت في طب الأطفال. عملت بجد لتطوير مهاراتها وتوسيع معرفتها لتقديم أفضل رعاية ممكنة لمرضاها. وهي الآن طبيبة معروفة في مجالها وتتمتع بسمعة طيبة لخبرتها ولطفها.',
              style: TextStylesManager.regular14.copyWith(
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 4.h),
            InkWell(
              onTap: onMorePressed,
              child: Text(
                'عرض أقل',
                style: TextStylesManager.regular16.copyWith(
                  color: ColorsManager.primary,
                ),
              ),
            ),
          ] else ...[
            Text(
              'بعد إكمال دراستها الجامعية...',
              style: TextStylesManager.regular14.copyWith(
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 4.h),
            InkWell(
              onTap: onMorePressed,
              child: Text(
                'المزيد',
                style: TextStylesManager.regular16.copyWith(
                  color: ColorsManager.primary,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
