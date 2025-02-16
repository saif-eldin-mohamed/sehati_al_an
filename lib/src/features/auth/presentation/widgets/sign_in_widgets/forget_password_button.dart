import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/resourses/lanuages_strings.dart';
import '../../../../../core/resourses/theming/colors.dart';
import '../../../../../core/resourses/theming/styles.dart';
import '../../../../../core/routes/routes.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, Routes.forgetPasswordScreen);
          },
          child: Text(
            AppStrings.forgotPassword.tr(),
            style: TextStylesManager.regular14.copyWith(
              color: ColorsManager.primary,
            ),
          ),
        ),
      ],
    );
  }
}
