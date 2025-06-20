part of 'login_cubit.dart';

class LoginState extends Equatable {
  final String? errorMessage;
  final BlocStatus status;
  final bool showPassword;

  const LoginState({
    this.errorMessage,
    this.status = BlocStatus.initial,
    this.showPassword = false,
  });

  LoginState copyWith({
    String? errorMessage,
    BlocStatus? status,
    bool? showPassword,
    String? countryCode,
  }) {
    return LoginState(
      errorMessage: errorMessage ?? this.errorMessage,
      status: status ?? this.status,
      showPassword: showPassword ?? this.showPassword,
    );
  }

  @override
  List<Object?> get props => [
    errorMessage,
    status,
    showPassword,
  ];
}
