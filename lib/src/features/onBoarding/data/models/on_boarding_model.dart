import 'package:equatable/equatable.dart';
import '../../../../core/resourses/lanuages_strings.dart';
import '../../../../core/resourses/theming/images.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingModel extends Equatable {
  final int id;
  final String title;
  final String description;
  final String image;
  final double imageWidth;
  final double imageHeight;

  OnboardingModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.imageWidth,
    required this.imageHeight,
  });

  @override
  List<Object?> get props =>
      [id, title, description, image, imageWidth, imageHeight];
}

List<OnboardingModel> onBoardingData = [
  OnboardingModel(
    id: 1,
    title: AppStrings.findYourDoctor,
    description: AppStrings.doctorSearchDescription,
    image: ImagesManager.onBoarding_1,
    imageWidth: 350.w,
    imageHeight: 350.h,
  ),
  OnboardingModel(
    id: 2,
    title: AppStrings.bookAConsultation,
    description: AppStrings.consultationDescription,
    image: ImagesManager.onBoarding_2,
    imageWidth: 350.w,
    imageHeight: 350.h,
  ),
  OnboardingModel(
    id: 3,
    title: AppStrings.askDoctors,
    description: AppStrings.askDoctorsDescription,
    image: ImagesManager.onBoarding_3,
    imageWidth: 350.w,
    imageHeight: 350.h,
  ),
];
