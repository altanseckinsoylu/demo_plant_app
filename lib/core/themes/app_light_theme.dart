import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static const Color _primaryGreen = Color(0xFF28AF6E);
  static const Color _lightBackground = Colors.white;

  static ThemeData getTheme(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final double textScale = size.width / 375.0;
    final double buttonHeight = size.height * 0.07;

    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: _lightBackground,

      colorScheme: const ColorScheme.light(
        primary: _primaryGreen,
        secondary: _primaryGreen,
        surface: Colors.white,
        onPrimary: Colors.white,
      ),

      appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        iconTheme: const IconThemeData(color: Colors.black87),
        titleTextStyle: TextStyle(
          color: Colors.black87,
          fontSize: 18 * textScale,
          fontWeight: FontWeight.w600,
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: _primaryGreen,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: EdgeInsets.zero,
          minimumSize: Size(double.infinity, buttonHeight),
          textStyle: TextStyle(
            fontSize: 16 * textScale,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      textTheme: TextTheme(
        displaySmall: TextStyle(
          color: Colors.black87,
          fontSize: 28 * textScale,
          fontWeight: FontWeight.w300,
        ),
        bodyLarge: TextStyle(color: Colors.grey, fontSize: 16 * textScale),
        labelSmall: TextStyle(color: Colors.grey, fontSize: 11 * textScale),
      ),
    );
  }
}
