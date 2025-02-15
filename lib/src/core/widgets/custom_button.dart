import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';

class CustomButton extends StatelessWidget {
  final void Function()? onTap;
  final String? text;
  final Icon? icon;
  final Widget? widget;
  final EdgeInsets? padding;
  final double? borderRadius;
  final Color? color;
  final Color? fontColor;
  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final bool isBorderButton;
  final Color? splashColor;
  final Color? highlightColor;
  final Color? borderColor;

  // you can use Text or Icon or widget 'just One'
  const CustomButton({
    super.key,
    required this.onTap,
    this.text,
    this.icon,
    this.widget,
    this.color = ColorsManager.primary,
    this.splashColor,
    this.highlightColor,
    this.width,
    this.fontColor = Colors.white,
    this.textStyle,
    this.height,
    this.isBorderButton = false,
    this.borderRadius,
    this.padding,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 350.w,
      height: height ?? 48.h,
      decoration: isBorderButton
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(
                  borderRadius == null ? 13 : borderRadius!),
              border: Border.all(
                color: borderColor ?? Colors.black38,
              ),
            )
          : null,
      child: MaterialButton(
        onPressed: onTap,
        elevation: 0.0,
        splashColor: splashColor ?? ColorsManager.primary.withOpacity(.1),
        highlightColor: highlightColor ?? ColorsManager.primary.withOpacity(.1),
        highlightElevation: 0,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              borderRadius == null ? 13.r : borderRadius!),
        ),
        color: color,
        child: text != null
            ? Text(text!,
                style: textStyle ??
                    TextStylesManager.bold16
                        .copyWith(color: ColorsManager.background))
            : icon ?? widget,
      ),
    );
  }
}
