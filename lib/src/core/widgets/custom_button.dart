import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onTap;
  final String? text;
  final Widget? child;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Color backgroundColor;
  final Color textColor;
  final double? width;
  final double height;
  final bool outlined;
  final Color? borderColor;

  const CustomButton({
    super.key,
    required this.onTap,
    this.text,
    this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 24),
    this.borderRadius = 13,
    this.backgroundColor = ColorsManager.primary,
    this.textColor = Colors.white,
    this.width,
    this.height = 48,
    this.outlined = false,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: outlined
          ? BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(
          color: borderColor ?? ColorsManager.textSecondary,
          width: 1,
        ),
      )
          : null,
      child: MaterialButton(
        onPressed: onTap,
        elevation: 0,
        highlightElevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        color: outlined ? Colors.transparent : backgroundColor,
        child: text != null
            ? Text(
          text!,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: outlined ? backgroundColor : textColor,
          ),
        )
            : child,
      ),
    );
  }
}