part of '../../../onboarding/logic/cubits/onboarding_cubit.dart';

class OnboardingState {
  final int currentPage;
  final bool isLastPage;
  final double pageOffset;

  OnboardingState({required this.currentPage, required this.isLastPage, required this.pageOffset});

  OnboardingState copyWith({int? currentPage, bool? isLastPage, double? pageOffset}) {
    return OnboardingState(
      currentPage: currentPage ?? this.currentPage,
      isLastPage: isLastPage ?? this.isLastPage,
      pageOffset: pageOffset ?? this.pageOffset,
    );
  }
}
