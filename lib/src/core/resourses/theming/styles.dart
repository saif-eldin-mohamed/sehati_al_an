import 'package:flutter/material.dart';
import 'colors.dart';
import 'font_weight_helper.dart';

class TextStylesManager {
  // Regular Styles
  static const TextStyle regular12 = TextStyle(
    fontFamily: 'Lato',
    fontSize: 12,
    fontWeight: FontWeightHelper.regular,
    height: 18 / 12,
    color: ColorsManager.textPrimary,
  );

  static const TextStyle regular14 = TextStyle(
    fontFamily: 'Lato',
    fontSize: 14,
    fontWeight: FontWeightHelper.regular,
    height: 21 / 14,
    color: ColorsManager.textPrimary,
  );

  static const TextStyle regular16 = TextStyle(
    fontFamily: 'Lato',
    fontSize: 16,
    fontWeight: FontWeightHelper.regular,
    height: 24 / 16,
    color: ColorsManager.textPrimary,
  );

  static const TextStyle regular22 = TextStyle(
    fontFamily: 'SF Pro Display',
    fontSize: 22,
    fontWeight: FontWeightHelper.regular,
    height: 28 / 22,
    color: ColorsManager.textPrimary,
  );

  // SemiBold Styles
  static const TextStyle semiBold12 = TextStyle(
    fontFamily: 'Lato',
    fontSize: 12,
    fontWeight: FontWeightHelper.semiBold,
    height: 21 / 12,
    color: ColorsManager.textPrimary,
  );

  static const TextStyle semiBold16 = TextStyle(
    fontFamily: 'Lato',
    fontSize: 16,
    fontWeight: FontWeightHelper.semiBold,
    height: 24 / 16,
    color: ColorsManager.textPrimary,
  );

  // Bold Styles
  static const TextStyle bold12 = TextStyle(
    fontFamily: 'Lato',
    fontSize: 12,
    fontWeight: FontWeightHelper.bold,
    height: 21 / 12,
    color: ColorsManager.textPrimary,
  );

  static const TextStyle bold14 = TextStyle(
    fontFamily: 'Lato',
    fontSize: 14,
    fontWeight: FontWeightHelper.bold,
    height: 21 / 14,
    color: ColorsManager.textPrimary,
  );

  static const TextStyle bold16 = TextStyle(
    fontFamily: 'Lato',
    fontSize: 16,
    fontWeight: FontWeightHelper.bold,
    height: 24 / 16,
    color: ColorsManager.textPrimary,
  );

  // ExtraBold Styles
  static const TextStyle extraBold18 = TextStyle(
    fontFamily: 'Lato',
    fontSize: 18,
    fontWeight: FontWeightHelper.extraBold,
    height: 1.0,
    color: ColorsManager.textPrimary,
  );

  static const TextStyle extraBold20 = TextStyle(
    fontFamily: 'Lato',
    fontSize: 20,
    fontWeight: FontWeightHelper.extraBold,
    height: 1.0,
    color: ColorsManager.textPrimary,
  );

  static const TextStyle extraBold24 = TextStyle(
    fontFamily: 'Lato',
    fontSize: 24,
    fontWeight: FontWeightHelper.extraBold,
    height: 1.0,
    color: ColorsManager.textPrimary,
  );

  // Special Fonts
  static const TextStyle comfortaaBold48 = TextStyle(
    fontFamily: 'Comfortaa',
    fontSize: 48,
    fontWeight: FontWeightHelper.bold,
    height: 1.0,
    color: ColorsManager.textPrimary,
  );

  static const TextStyle comfortaaMedium16_5 = TextStyle(
    fontFamily: 'Comfortaa',
    fontSize: 16.5,
    fontWeight: FontWeightHelper.medium,
    height: 1.0,
    color: ColorsManager.textPrimary,
  );

  static const TextStyle rokkittRegular71 = TextStyle(
    fontFamily: 'Rokkitt',
    fontSize: 71.4,
    fontWeight: FontWeightHelper.regular,
    height: 51 / 71.4,
    color: ColorsManager.textPrimary,
  );
}
