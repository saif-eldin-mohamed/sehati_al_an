import 'package:flutter/material.dart';
import '../helpers/enums.dart';

import 'package:flutter/material.dart';
import '../helpers/enums.dart';

const String arabic = 'ar';
const String english = 'en';
const String assetsLocalization = 'assets/translations';

final Locale arabicLocal = Locale("ar", "SA");
final Locale englishLocal = Locale("en", "US");

extension LanguageTypeExtension on LanguageType {
  String get getValue {
    switch (this) {
      case LanguageType.english:
        return english;
      case LanguageType.arabic:
        return arabic;
    }
  }
}
