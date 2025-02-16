import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animate_do/animate_do.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/images.dart';

import '../../core/routes/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, Routes.onBoardingScreen);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.secondary,
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 1200) {
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      ImagesManager.splashImg,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned.fill(
                    top: 0,
                    left: 0,
                    right: .8.sw,
                    child: FadeInLeft(
                      duration: const Duration(seconds: 2),
                      child: Image.asset(
                        ImagesManager.backGroundSplashImg,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    top: 0,
                    left: .8.sw,
                    right: 0,
                    child: FadeInRight(
                      duration: const Duration(seconds: 2),
                      child: Image.asset(
                        ImagesManager.backGroundSplashImg,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    top: 0,
                    left: 0,
                    right: .5.sw,
                    child: FadeInLeft(
                      duration: const Duration(seconds: 2),
                      child: Image.asset(
                        ImagesManager.backGroundSplashImg,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    top: 0,
                    left: .5.sw,
                    right: 0,
                    child: FadeInRight(
                      duration: const Duration(seconds: 2),
                      child: Image.asset(
                        ImagesManager.backGroundSplashImg,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else if (constraints.maxWidth > 600) {
            return SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      ImagesManager.splashImg,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Positioned.fill(
                    top: 0,
                    left: 0,
                    right: .8.sw,
                    child: FadeInLeft(
                      duration: const Duration(seconds: 2),
                      child: Image.asset(
                        ImagesManager.backGroundSplashImg,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    top: 0,
                    left: .8.sw,
                    right: 0,
                    child: FadeInRight(
                      duration: const Duration(seconds: 2),
                      child: Image.asset(
                        ImagesManager.backGroundSplashImg,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
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
