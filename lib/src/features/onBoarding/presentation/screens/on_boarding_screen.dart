import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/styles.dart';
import 'package:sehati_al_an_app/src/core/routes/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/app_prefrences/app_prefrences.dart';
import '../../../../core/resourses/language_manager.dart';
import '../../../../core/resourses/lanuages_strings.dart';
import '../../../../core/services/dependency_injection.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_indicator_widget.dart';
import '../../data/models/on_boarding_model.dart';
import '../cubit/on_boarding_cubit.dart';
import '../widget/on_boarding_item.dart';
import 'package:easy_localization/easy_localization.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {                                final appPreferences = sl<AppPreferences>();

@override
  Widget build(BuildContext context) {final appPreferences = sl<AppPreferences>();

return BlocProvider(
      create: (context) => OnBoardingCubit()..addPageListener(),
      child: Scaffold(
        body: BlocBuilder<OnBoardingCubit, OnBoardingState>(
          builder: (context, state) {
            final cubit = context.read<OnBoardingCubit>();
            return SafeArea(
              child: Padding(
                padding: EdgeInsetsDirectional.only(top: 24.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Language Selection Button
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 16.w),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                                width: 1,
                              ),
                            ),
                            child: TextButton(
                              onPressed: () async {

                                final newLocale = context.locale == englishLocal ? arabicLocal : englishLocal;

                                // حفظ اللغة المختارة
                                await appPreferences.setAppLanguage(newLocale.languageCode);

                                // تغيير اللغة في الواجهة
                                context.setLocale(newLocale);
                              },


                              child: Text(
                                context.locale.languageCode == 'ar' ? 'English' : 'عربي',
                                style: TextStylesManager.regular14.copyWith(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                        // Skip Button
                        Padding(
                          padding: EdgeInsetsDirectional.only(end: 16.w),
                          child: TextButton(
                            onPressed: () {
                              // sl<AppPreferences>().setOnBoarding();
                              Navigator.pushNamed(context, Routes.homeScreen);
                            },
                            child: Text(AppStrings.skip.tr(),
                              style: TextStylesManager.regular14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 2,
                      child: PageView.builder(
                        controller: cubit.imageController,
                        itemCount: onBoardingData.length,
                        onPageChanged: (index) {
                          cubit.setCurrentIndex(index);
                        },
                        itemBuilder: (context, index) {
                          return OnBoardingItem(
                            model: onBoardingData[index],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 36.h),
                    Expanded(
                      child: Stack(
                        children: [
                          PageView.builder(
                            controller: cubit.textController,
                            itemCount: onBoardingData.length,
                            physics: const NeverScrollableScrollPhysics(),
                            pageSnapping: false,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  Text(
                                    onBoardingData[index].title.tr(),
                                    style: TextStylesManager.extraBold24,
                                  ),
                                  SizedBox(height: 12.h),
                                  Text(
                                    onBoardingData[index].description.tr(),
                                    textAlign: TextAlign.center,
                                    style: TextStylesManager.regular16,
                                  ),
                                ],
                              );
                            },
                          ),
                          Positioned(
                            bottom: 48.h,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                onBoardingData.length,
                                    (index) => IndicatorDotsWidget(
                                  isActive: index == cubit.currentPage,
                                ),
                              ),
                            ),
                          ),
                        ],
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
                    // sl<AppPreferences>().setOnBoarding();
                    Navigator.pushNamed(context, Routes.homeScreen);
                  } else {
                    cubit.animateToNextPage();
                  }
                },
                text: AppStrings.getStarted.tr(),
              ),
            );
          },
        ),
      ),
    );
  }
}