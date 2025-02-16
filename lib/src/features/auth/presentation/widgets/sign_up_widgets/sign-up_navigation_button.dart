import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../../core/resourses/lanuages_strings.dart';
import '../../../../../core/resourses/theming/colors.dart';
import '../../../../../core/resourses/theming/styles.dart';
import '../../../../../core/routes/routes.dart';

class SignUpNavigationButton extends StatelessWidget {
  const SignUpNavigationButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
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
    );
  }
}
