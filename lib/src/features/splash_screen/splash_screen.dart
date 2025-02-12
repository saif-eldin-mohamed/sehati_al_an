import 'package:flutter/material.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/images.dart';
import 'dart:async';

import 'package:sehati_al_an_app/src/core/routes/routes.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(seconds: 8), () {
    //   Navigator.pushNamed(context, Routes.homeScreen);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.primary,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 500) {
            return Center(
              child: Image.asset(
                ImagesManager.splashImg,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
            );          } else  {
            return Center(
              child: Image.asset(
                ImagesManager.splashImg,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.contain,
              ),
            );
          }
        },
      ),
    );
  }
}