import 'dart:ui';

 abstract class AppColors{
   var primary = Color(0xFF139EEF);
   var onPrimary = Color(0xFFF5F5F5);
   var secondary = Color(0xFF1A1A1A);
   var background = Color(0xFFF5F5F5);
   var textPrimary = Color(0xFF212121);
   var textSecondary = Color(0xFF757575);
   var accent = Color(0xFFFFC107);
   var error = Color(0xFFF44336);
   var success = Color(0xFF4CAF50);
   var warning = Color(0xFFFF9800);
   var cardBackground = Color(0xFFF5F5F5);
   var border = Color(0xFFE0E0E0);
   var shadow = Color(0xFFBDBDBD);
   var disabled = Color(0xFFBDBDBD);
   var highlight = Color(0xFFFFEB3B);
   var divider = Color(0xFFBDBDBD);
   var overlay = Color(0x80000000); // Semi-transparent black
   var transparent = Color(0x00000000);// Fully transparent
   var borderColor = Color(0xFFE0E0E0);
   var hintColor = Color(0xFFBDBDBD);
}

 class AppColorsLight extends AppColors{
   AppColorsLight._internal();
   static final AppColorsLight _instance = AppColorsLight._internal();
   factory AppColorsLight() => _instance;
 }


class AppColorsDark extends AppColors {
  AppColorsDark._internal();
  static final AppColorsDark _instance = AppColorsDark._internal();
  factory AppColorsDark() => _instance;

  @override
  Color primary = const Color(0xFFE98D23);

  @override
  Color onPrimary = const Color(0xFFE0E0E0);

  @override
  Color secondary = const Color(0xFF1A1A1A);

  @override
  Color background = const Color(0xFF121212);

  @override
  Color textPrimary = const Color(0xFFE0E0E0);

  @override
  Color textSecondary = const Color(0xFFBDBDBD);

  @override
  Color accent = const Color(0xFFFFC107);

  @override
  Color error = const Color(0xFFF44336);

  @override
  Color success = const Color(0xFF4CAF50);

  @override
  Color warning = const Color(0xFFFF9800);

  @override
  Color cardBackground = const Color(0xFF1E1E1E);

  @override
  Color border = const Color(0xFF424242);

  @override
  Color shadow = const Color(0xFF616161);

  @override
  Color disabled = const Color(0xFFBDBDBD);

  @override
  Color highlight = const Color(0xFFFFEB3B);

  @override
  Color divider = const Color(0xFF424242);

  @override
  Color overlay = const Color(0x80000000); // Semi-transparent black

  @override
  Color transparent = const Color(0x00000000); // Fully transparent

  @override
  Color borderColor = const Color(0xFF424242);

  @override
  Color hintColor = const Color(0xFFBDBDBD);

}