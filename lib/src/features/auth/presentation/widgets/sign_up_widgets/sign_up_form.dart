import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../../../../../core/resourses/lanuages_strings.dart';
import '../../../../../core/routes/routes.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_formField.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
        SizedBox(height: 16.h),
        CustomButton(
          onTap: () {
            Navigator.pushNamed(context, Routes.appLayOut);
          },
          text: AppStrings.signIn.tr(),
        ),
      ],
    );
  }
}
