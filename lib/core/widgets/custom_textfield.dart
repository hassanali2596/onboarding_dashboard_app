
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String)? onChanged;
  final TextInputAction? textInputAction;
  final bool obscure;
  final Widget? suffixIcon;
  const CustomTextField({
    super.key,
    required this.controller,
    this.onChanged,
    this.textInputAction,
    this.obscure = false,
    this.suffixIcon,
  });
  @override
  Widget build(BuildContext context) {
    var theme= Theme.of(context);
   return TextField(
     controller: controller,
     onChanged: onChanged,
     textInputAction: textInputAction,
     decoration:  InputDecoration(
         suffixIcon: suffixIcon
     ),
     obscureText: obscure,
   );
  }

}