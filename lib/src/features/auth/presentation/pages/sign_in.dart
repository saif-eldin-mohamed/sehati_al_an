import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';
import 'package:sehati_al_an_app/src/core/routes/routes.dart';
import 'package:sehati_al_an_app/src/core/widgets/default_app_bar.dart';
import 'package:sehati_al_an_app/src/core/resourses/lanuages_strings.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/images.dart';
import 'package:sehati_al_an_app/src/core/widgets/custom_button.dart';
import 'package:sehati_al_an_app/src/core/widgets/custom_signIn_buttons.dart';
import 'package:sehati_al_an_app/src/core/widgets/custom_text_formField.dart';

import '../widgets/logo_widget.dart';
import '../widgets/or_divider.dart';
import '../widgets/sign_in_widgets/forget_password_button.dart';
import '../widgets/sign_in_widgets/sign-in_navigation_button.dart';
import '../widgets/sign_in_widgets/sign_in_form.dart';
import '../widgets/social_media_buttons.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(
        title: '',
        showLeading: false,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.0.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LogoWidget(),
              SizedBox(height: 16.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    AppStrings.welcomeBack.tr(),
                    style: TextStylesManager.extraBold18,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    AppStrings.signInToAccount.tr(),
                    style: TextStylesManager.regular16,
                  ),
                  SizedBox(height: 16.h),
                  const SignInForm(),
                  SizedBox(height: 16.h),
                  const SignInNavigationButton(),
                  SizedBox(height: 16.h),
                  const OrDivider(),
                  SizedBox(height: 16.h),
                  const SocialMediaButtons(),
                  SizedBox(height: 16.h),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
