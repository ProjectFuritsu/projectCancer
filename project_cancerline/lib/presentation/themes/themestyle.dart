import 'package:flutter/material.dart';

class AppTheme {
  // 🎨 Color Palette
  static const Color primaryColor = Color(0xFF5B50A0);
  static const Color secondaryColor = Color(0xFF9891C3);
  static const Color defaultbackgroundColor = Color(0xFFF5F5F5);
  static const Color warningColor = Colors.red;
  static const Color completeColor = Colors.green;
  

  // 🧱 Typography
  static const double defaultFontSize = 16.0;
  static const FontWeight defaultFontWeight = FontWeight.normal;

  // ⚠️ TextStyle for warnings
  static const TextStyle warningTextStyle = TextStyle(
    color: warningColor,
    fontSize: defaultFontSize,
  );

  // 🧩 Light Theme
  static final ThemeData light = ThemeData(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    fontFamily: 'Inter',

// ✅ AppBar Theme
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: primaryColor,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: primaryColor,
        fontSize: defaultFontSize + 2,
        fontWeight: FontWeight.bold,
      ),
    ),


    // ✅ Text Theme
    textTheme: TextTheme(
      // ✅ Headline Text Styles for Titles
      titleLarge: TextStyle(
        fontSize: defaultFontSize + 4,
        fontWeight: FontWeight.bold,
        color: primaryColor,
      ),
      titleMedium: TextStyle(
        fontSize: defaultFontSize + 2,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),
      titleSmall: TextStyle(
        fontSize: defaultFontSize,
        fontWeight: FontWeight.w500,
        color: primaryColor,
      ),
      // ✅ Body Text Styles for General Content
      bodyLarge: TextStyle(
        fontSize: defaultFontSize + 2,
        fontWeight: FontWeight.normal,
        color: primaryColor,
      ),
      bodyMedium: TextStyle(
        fontSize: defaultFontSize,
        fontWeight: FontWeight.normal,
        color: primaryColor,
      ),
      bodySmall: TextStyle(
        fontSize: defaultFontSize - 2,
        fontWeight: FontWeight.normal,
        color: primaryColor,
      ),
      // ✅ Label Text Styles for Button
      labelLarge: TextStyle(
        fontSize: defaultFontSize + 2,
        fontWeight: FontWeight.w600,
        color: primaryColor,
      ),
      labelMedium: TextStyle(
        fontSize: defaultFontSize,
        fontWeight: FontWeight.w500,
        color: primaryColor,
      ),
      labelSmall: TextStyle(
        fontSize: defaultFontSize - 2,
        fontWeight: FontWeight.w400,
        color: primaryColor,
      ),
    ),



    // ✅ Registration Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: primaryColor,
        backgroundColor: defaultbackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 30.0),
        side: const BorderSide(color: primaryColor, width: 2.0),
       
      ),
    ),
  );
}
