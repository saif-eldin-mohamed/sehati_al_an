import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';
import 'package:sehati_al_an_app/src/core/routes/routes.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_prefrences/app_prefrences.dart';
import '../../../../core/services/dependency_injection.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_indicator_widget.dart';
import '../../data/models/on_boarding_model.dart';
import '../cubit/on_boarding_cubit.dart';
import '../widget/on_boarding_item.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit()..addPageListener(),
      child: Scaffold(
        body: BlocBuilder<OnBoardingCubit, OnBoardingState>(
          builder: (context, state) {
            final cubit = context.read<OnBoardingCubit>();
            return SafeArea(
              child: Padding(
                padding:  EdgeInsetsDirectional.only(top: 50.h),
                child: Column(
                  children: [

                    Expanded(
                      flex: 2,
                      //   height: MediaQuery.sizeOf(context).height * 0.45,
                      child: PageView.builder(
                        controller: cubit.imageController,
                        itemCount: onBoardingData.length,
                        onPageChanged: (index) {
                          cubit.setCurrentIndex(index);
                          // setState(() {});
                        },
                        itemBuilder: (context, index) {
                          return OnBoardingItem(
                            model: onBoardingData[index],
                          );
                        },
                      ),
                    ),

                    SizedBox(
                      height: 36.h,
                    ),
                    Expanded(
                      child: PageView.builder(
                        controller: cubit.textController,
                        itemCount: onBoardingData.length,
                        physics: const NeverScrollableScrollPhysics(),
                        pageSnapping: false,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Text(
                                onBoardingData[index].title,
                                style:TextStylesManager.extraBold24
                              ),
                               SizedBox(
                                height: 12.h,
                              ),
                              Text(
                                onBoardingData[index].description,
                                textAlign: TextAlign.center,
                                  style:TextStylesManager.regular16

                              ),
                               SizedBox(
                                height: 48.h,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(
                                  onBoardingData.length,
                                      (index) {
                                    return IndicatorDotsWidget(
                                      // index: index,
                                      isActive: index == cubit.currentPage,
                                    );
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),

                  ],
                ),
              ),
            );
          },
        ),
        bottomNavigationBar: BlocBuilder<OnBoardingCubit, OnBoardingState>(
          builder: (context, state) {
            final cubit = context.read<OnBoardingCubit>();
            return Padding(
              padding: const EdgeInsetsDirectional.only(
                bottom: 30,
                start: 16,
                end: 16,
              ),
              child: CustomButton(
                onTap: () {
                  if (cubit.currentPage == onBoardingData.length - 1) {
                    sl<AppPreferences>().setOnBoarding();
                    Navigator.pushNamed(context, Routes.homeScreen);
                    // context.go(Routes.login);
                  } else {
                    cubit.animateToNextPage();
                  }
                },
                text:  'Get started',
              ),
            );
          },
        ),
      ),
    );
  }
}
