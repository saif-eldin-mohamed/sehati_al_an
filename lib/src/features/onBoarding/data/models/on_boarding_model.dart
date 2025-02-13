import 'package:equatable/equatable.dart';
import '../../../../core/resourses/theming/images.dart';

class OnboardingModel extends Equatable {
  final int id;

  final String title;

  final String description;

  final String image;

  const OnboardingModel({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        image,
      ];
}

const List<OnboardingModel> onBoardingData = [
  OnboardingModel(
    id: 1,
    title: 'Find Your Doctor',
    description: 'Easily search for doctors based on location, \n specialty, and availability.',
    image: ImagesManager.onBoarding_1,
  ),
  OnboardingModel(
    id: 2,
    title: 'Book a Consultation',
    description:
        'Schedule a video consultation at a time that \n works best for you.',
    image: ImagesManager.onBoarding_2,
  ),
  OnboardingModel(
    id: 3,
    title: 'Ask Doctors',
    description:
        'Send your questions to doctors through \n messages anytime.',
    image: ImagesManager.onBoarding_3,
  ),

];
