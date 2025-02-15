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
                  SizedBox(height: 24.h),
                  CustomTextFormField(
                    controller: TextEditingController(),
                    title: '',
                    hintText: AppStrings.fullName.tr(),
                  ),
                  SizedBox(height: 16.h),
                  CustomTextFormField(
                    controller: TextEditingController(),
                    title: '',
                    hintText: AppStrings.emailAddress.tr(),
                  ),
                  SizedBox(height: 16.h),
                  CustomTextFormField(
                    controller: TextEditingController(),
                    title: '',
                    enablePasswordToggle: true,
                    hintText: AppStrings.password.tr(),
                  ),
                  SizedBox(height: 24.h),
                  CustomButton(
                    onTap: () {},
                    text: AppStrings.signIn.tr(),
                  ),
                  SizedBox(height: 24.h),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.signInScreen);
                      },
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${AppStrings.dontHaveAccount.tr()} ',
                              style: TextStylesManager.regular14,
                            ),
                            TextSpan(
                              text: AppStrings.signIn.tr(),
                              style: TextStylesManager.regular14.copyWith(
                                color: ColorsManager.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      const Expanded(
                        child: Divider(
                          color: ColorsManager.lightGrey,
                          thickness: 1,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: Text(
                          AppStrings.or.tr(),
                          style: TextStylesManager.regular14,
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: ColorsManager.lightGrey,
                          thickness: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24.h),
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
                  SizedBox(height: 16.h),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
