import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehati_al_an_app/src/core/resourses/lanuages_strings.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/images.dart';
import 'package:sehati_al_an_app/src/core/widgets/custom_signIn_buttons.dart';

class SocialMediaButtons extends StatelessWidget {
  const SocialMediaButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSignInButton(
          text: AppStrings.signInGoogle.tr(),
          imagePath: SvgsManager.googleSvg,
          onPressed: () {},
        ),
        SizedBox(height: 16.h),
        CustomSignInButton(
          text: AppStrings.signInFacebook.tr(),
          imagePath: SvgsManager.facebookSvg,
          onPressed: () {},
        ),
        SizedBox(height: 16.h),
        CustomSignInButton(
          text: AppStrings.signInApple.tr(),
          imagePath: SvgsManager.appleSvg,
          onPressed: () {},
        ),
      ],
    );
  }
}
