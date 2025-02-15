import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sehati_al_an_app/src/core/resourses/theming/colors.dart';
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

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final appPreferences = sl<AppPreferences>();
  late Locale currentLocale;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    currentLocale = context.locale;
  }

  void _changeLanguage(Locale newLocale) async {
    await appPreferences.setAppLanguage(newLocale.languageCode);
    if (mounted) {
      setState(() {
        currentLocale = newLocale;
      });
      context.setLocale(newLocale);
    }
  }

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
                padding: EdgeInsetsDirectional.only(top: 24.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.only(start: 12.w),
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            decoration: BoxDecoration(
                              color: ColorsManager.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(
                                color: ColorsManager.primary,
                                width: 1,
                              ),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<Locale>(
                                value: currentLocale,
                                icon: const Icon(Icons.language,
                                    color: ColorsManager.primary),
                                style: TextStylesManager.regular14.copyWith(
                                  color: ColorsManager.primary,
                                ),
                                onChanged: (Locale? newLocale) {
                                  if (newLocale != null) {
                                    _changeLanguage(newLocale);
                                  }
                                },
                                items: const [
                                  DropdownMenuItem(
                                    value: englishLocal,
                                    child: Text('English',
                                        style: TextStylesManager.regular14),
                                  ),
                                  DropdownMenuItem(
                                    value: arabicLocal,
                                    child: Text('عربي',
                                        style: TextStylesManager.regular14),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.only(end: 16.w),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Routes.signInScreen);
                            },
                            child: Text(
                              AppStrings.skip.tr(),
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
                    Navigator.pushNamed(context, Routes.signInScreen);
                  } else {
                    cubit.animateToNextPage();
                  }
                },
                text: cubit.currentPage == onBoardingData.length - 1
                    ? (currentLocale == arabicLocal
                        ? 'ابدأ الآن'
                        : 'Get Started')
                    : (currentLocale == arabicLocal ? 'التالي' : 'Next'),
              ),
            );
          },
        ),
      ),
    );
  }
}
