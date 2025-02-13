import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'on_boarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingInitial());

  final PageController imageController = PageController();
  final PageController textController = PageController();

  int currentPage = 0;

  void setCurrentIndex(int index) {
    currentPage = index;
    emit(ChangeCurrentIndexState());
  }

  void addPageListener() {
    imageController.addListener(() {
      if (imageController.page != textController.page) {
        textController.jumpTo(imageController.position.pixels);
      }
    });
  }

  void animateToNextPage() {
    imageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }
}
