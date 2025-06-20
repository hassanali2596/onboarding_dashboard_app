import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:onboarding_dashboard_app/core/constants/assets_paths.dart';
import 'package:onboarding_dashboard_app/core/enums/bloc_status.dart';

import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/custom_form_field_label.dart';
import '../../../core/widgets/custom_textfield.dart';
import '../../dashboard/ui/dashboard.dart';
import '../logic/cubits/login_cubit.dart';



class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(),
      child: const _LoginForm(),
    );
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm();

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> with TickerProviderStateMixin{
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final AnimationController _lottieController;
  Timer? _debounceTimer;

  void _navigateToDashboard() {
    Navigator.of(context).push(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 1200),
        pageBuilder: (_, __, ___) => const DashboardScreen(),
      ),
    );
  }
  // This method is called whenever the text in the TextField changes
  void _onTextChanged(String text) {

    if (!_lottieController.isAnimating) {
      _lottieController.repeat();
    }

    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      if (_lottieController.isAnimating) {
        _lottieController.stop();
      }
    });
  }
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _lottieController = AnimationController(vsync: this,);

  }
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _lottieController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    final theme = Theme.of(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocListener<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state.status==BlocStatus.success) {
            _navigateToDashboard();
          } else if (state.status==BlocStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage??"")),
            );
          }
        },
        child: SafeArea(
          child:  Padding(
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10,),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Hero(
                        tag: 'app-logo',
                        child: Image.asset(
                          AssetsPaths.logo,
                          width: 120,
                        ),
                      ),
                      Text("Login !",
                        style: theme.textTheme.headlineLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: theme.textTheme.bodyLarge?.color,
                        )),
                      const SizedBox(height: 8,),
                      Text("Enter your email and password to start your journey with us.",
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.textTheme.bodyLarge?.color,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 30,),
                      Lottie.asset(
                        AssetsPaths.typingAnimation,
                        controller: _lottieController,
                        onLoaded: (composition) {
                          _lottieController.duration = composition.duration;
                          _lottieController.stop();
                        },
                        width: 130, // Set desired width
                        height: 130, // Set desired height
                        fit: BoxFit.contain, // Adjust how the animation fits its bounds
                        repeat: true, // Set to true if your Lottie animation is designed to loop
                      ),
                    ],)),
                  CustomFormFieldLabel(labelText: "Email"),
                  const SizedBox(height: 8),
                  CustomTextField(controller: _emailController,
                    textInputAction: TextInputAction.next,
                      onChanged: _onTextChanged
                  ),
                  const SizedBox(height: 16),
                  CustomFormFieldLabel(labelText: "Password"),
                  const SizedBox(height: 8),
                  BlocSelector<LoginCubit, LoginState, bool>(
                    selector: (state) => state.showPassword,
                    builder: (context, showPassword) {
                      return CustomTextField(controller: _passwordController,
                          obscure: !showPassword,
                          textInputAction: TextInputAction.done,
                          suffixIcon: IconButton(
                            icon: Icon(
                              showPassword ? Icons.visibility : Icons.visibility_off,
                              color: theme.disabledColor,
                            ),
                            onPressed: () => cubit.showHidePassword(),
                          ),
                          onChanged: _onTextChanged);
                    },
                  ),

                  const SizedBox(height: 32),
                  BlocSelector<LoginCubit, LoginState, BlocStatus>(
                    selector: (state) => state.status,
                    builder: (context, state) {
                      final isLoading = (state == BlocStatus.loading);
                      return CustomButton(
                        isLoading: isLoading,
                        btnWidth: screenWidth,
                        onTap: isLoading
                            ? null
                            :(){
                          FocusScope.of(context).requestFocus(FocusNode());
                          cubit.login(_emailController.text, _passwordController.text);
                        },
                        label:  "Login",
                      );
                    },
                  ),
                  // const Spacer(flex: 3),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
