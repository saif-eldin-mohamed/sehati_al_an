import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:sehati_al_an_app/src/core/routes/routes.dart';
import '../../../../../core/resourses/lanuages_strings.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_formField.dart';

class ForgetPasswordForm extends StatelessWidget {
  const ForgetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: TextEditingController(),
          title: '',
          hintText: AppStrings.emailAddress.tr(),
        ),
        SizedBox(height: 16.h),
        CustomButton(
          onTap: () {
            Navigator.pushNamed(context, Routes.signInScreen);
          },
          text: AppStrings.resetPassword.tr(),
        ),
      ],
    );
  }
}
