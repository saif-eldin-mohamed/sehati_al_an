import 'package:flutter/material.dart';

import '../../data/models/on_boarding_model.dart';

class OnBoardingItem extends StatelessWidget {
  const OnBoardingItem({
    super.key,
    required this.model,
  });

  final OnboardingModel model;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      model.image,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
