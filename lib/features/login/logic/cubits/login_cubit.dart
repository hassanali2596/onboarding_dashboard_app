import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/enums/bloc_status.dart';

part  'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  void login(String email, String password) async {
    emit(state.copyWith(status: BlocStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    if (email.isNotEmpty && password.isNotEmpty) {
      emit(state.copyWith(status: BlocStatus.success));
    } else {
      emit(state.copyWith(
        status: BlocStatus.failure,
        errorMessage: "Email and password cannot be empty",
      ));
    }
  }
  showHidePassword() {
    emit(state.copyWith(showPassword: !state.showPassword));
  }
  void reset() => emit(state.copyWith(status: BlocStatus.initial));
}
