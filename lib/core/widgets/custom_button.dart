import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final bool isLoading;
  final double btnWidth;
  final Function()? onTap;
  final String label;
  const CustomButton({
    super.key,
    this.isLoading = false,
    required this.btnWidth,
    required this.onTap,
    required this.label,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: isLoading ? 48.0 : btnWidth,
        height: 48.0,
        decoration: BoxDecoration(
          color: theme.primaryColor,
          borderRadius: BorderRadius.circular(isLoading ? 24.0 : 12.0),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(24),
            child: Center(
              child: isLoading
                  ? const SizedBox(
                height: 24,
                width: 24,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
                  :  Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

}