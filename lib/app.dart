import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sehati_al_an_app/src/core/app_prefrences/app_prefrences.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';

import 'package:sehati_al_an_app/src/core/routes/app_router.dart';
import 'package:sehati_al_an_app/src/core/services/dependency_injection.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppPreferences _appPreferences = sl<AppPreferences>();
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _appPreferences.getLocale().then((local) {
      return context.setLocale(local);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, Widget? child) {
        return GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: MaterialApp(
            theme: ThemeData(scaffoldBackgroundColor: ColorsManager.white),

            debugShowCheckedModeBanner: false,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            themeMode: ThemeMode.light,
            onGenerateRoute: AppRouter.generateRoute,
          ),
        );
      },
    );
  }
}
