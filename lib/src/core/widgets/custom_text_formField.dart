import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehati_al_an_app/src/core/helpers/responsive_font_size.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';
import 'package:sehati_al_an_app/src/core/app_prefrences/app_prefrences.dart';
import 'package:get_it/get_it.dart';

class CustomTextFormField extends StatefulWidget {
  final String title;
  final String? hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final Widget? prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;
  final void Function()? onTap;
  final TextInputType? textInputType;
  final bool readOnly;
  final int? maxLines;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final AutovalidateMode? autoValidateMode;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final bool enablePasswordToggle;

  const CustomTextFormField({
    super.key,
    this.obscureText = false,
    required this.title,
    this.textInputType,
    this.prefixIcon,
    this.readOnly = false,
    this.validator,
    this.controller,
    this.hintText,
    this.maxLines = 1,
    this.onTap,
    this.onChanged,
    this.hintStyle,
    this.textStyle,
    this.autoValidateMode = AutovalidateMode.onUserInteraction,
    this.inputFormatters,
    this.initialValue,
    this.enablePasswordToggle = false,
  });

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _obscureText;
  late AppPreferences _appPreferences;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    _appPreferences = GetIt.I<AppPreferences>();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.title.isNotEmpty
            ? Padding(
                padding: EdgeInsetsDirectional.only(
                  bottom: 10.h,
                ),
                child: Text(
                  widget.title,
                  style: TextStylesManager.semiBold16,
                ),
              )
            : const SizedBox.shrink(),
        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          autovalidateMode: widget.autoValidateMode,
          onTap: widget.onTap,
          onChanged: widget.onChanged,
          inputFormatters: widget.inputFormatters,
          keyboardType: widget.textInputType,
          style: widget.textStyle ?? Theme.of(context).textTheme.titleSmall,
          readOnly: widget.readOnly,
          obscureText: _obscureText,
          obscuringCharacter: '•',
          initialValue: widget.initialValue,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            isDense: true,
            hintText: widget.hintText,
            filled: true,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            prefixIconConstraints:
                const BoxConstraints(minHeight: 28, minWidth: 40),
            suffixIconConstraints:
                const BoxConstraints(minHeight: 28, minWidth: 40),
            fillColor: Colors.transparent,
            hintStyle: widget.hintStyle ?? TextStylesManager.regular16,
            errorStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Colors.red,
                  fontSize: 14.responsive,
                ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide(
                color: ColorsManager.lightGrey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: ColorsManager.primary,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: ColorsManager.error,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: const BorderSide(
                color: ColorsManager.primary,
              ),
            ),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.enablePasswordToggle
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: ColorsManager.primary,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
