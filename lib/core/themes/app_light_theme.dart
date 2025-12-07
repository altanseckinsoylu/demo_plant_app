import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {
  static const Color _primaryGreen = Color(0xFF28AF6E);

  static ThemeData getTheme(BuildContext context) {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white,

      iconTheme: const IconThemeData(color: Colors.white, size: 17),

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
          fontSize: 18 * MediaQuery.of(context).size.width / 375.0,
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
          minimumSize: Size(
            double.infinity,
            MediaQuery.of(context).size.height * 0.07,
          ),
          textStyle: TextStyle(
            fontSize: 16 * MediaQuery.of(context).size.width / 375.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      textTheme: TextTheme(
        displaySmall: TextStyle(
          color: Colors.black87,
          fontSize: 28 * MediaQuery.of(context).size.width / 375.0,
          fontWeight: FontWeight.w300,
        ),
        bodyLarge: TextStyle(
          color: Colors.grey,
          fontSize: 16 * MediaQuery.of(context).size.width / 375.0,
        ),
        labelSmall: TextStyle(
          color: Colors.grey,
          fontSize: 11 * MediaQuery.of(context).size.width / 375.0,
        ),
      ),
    );
  }
}
