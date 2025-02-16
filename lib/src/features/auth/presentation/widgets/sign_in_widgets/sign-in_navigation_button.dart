import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/resourses/lanuages_strings.dart';
import '../../../../../core/resourses/theming/colors.dart';
import '../../../../../core/resourses/theming/styles.dart';
import '../../../../../core/routes/routes.dart';

class SignInNavigationButton extends StatelessWidget {
  const SignInNavigationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.signUpScreen);
        },
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${AppStrings.dontHaveAccount.tr()} ',
                style: TextStylesManager.regular14,
              ),
              TextSpan(
                text: AppStrings.signUp.tr(),
                style: TextStylesManager.regular14.copyWith(
                  color: ColorsManager.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
