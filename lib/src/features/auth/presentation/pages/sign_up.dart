import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sehati_al_an_app/src/core/widgets/default_app_bar.dart';
import '../../../../core/resourses/lanuages_strings.dart';
import '../../../../core/resourses/theming/images.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_signIn_buttons.dart';
import '../../../../core/widgets/custom_text_formField.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/logo_widget.dart';
import '../widgets/or_divider.dart';
import '../widgets/sign_up_widgets/sign-up_navigation_button.dart';
import '../widgets/sign_up_widgets/sign_up_form.dart';
import '../widgets/social_media_buttons.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: '',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LogoWidget(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.signUp.tr(),
                    style: TextStylesManager.extraBold18,
                  ),
                  SizedBox(height: 16.h),
                  const SignUpForm(),
                  SizedBox(height: 16.h),
                  const SignUpNavigationButton(),
                  SizedBox(height: 16.h),
                  const OrDivider(),
                  SizedBox(height: 16.h),
                  const SocialMediaButtons(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
