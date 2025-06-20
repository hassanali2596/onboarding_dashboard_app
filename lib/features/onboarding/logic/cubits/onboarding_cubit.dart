import 'package:flutter_bloc/flutter_bloc.dart';
part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingState(currentPage: 0, isLastPage: false,pageOffset: 0));

  void updatePage(int index, int totalPages) {
    emit(state.copyWith(
      currentPage: index,
      isLastPage: index == totalPages - 1,
    ));
  }
  void updatePageOffset(double offset) {
    emit(state.copyWith(pageOffset: offset));
  }
}
