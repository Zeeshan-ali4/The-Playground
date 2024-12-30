import 'package:flutter/material.dart';

const Color brandColor = Color(0xFFCA1E16);

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    primary: brandColor, // Brand color for primary elements
    onPrimary: Colors.white, // Text/icons on primary-colored elements
    secondary: Colors.grey.shade300, // Accent or complementary color
    onSecondary: Colors.black, // Text/icons on secondary-colored elements
    surface: Colors.white, // Cards and surfaces
    onSurface: Colors.black, // Text/icons on surface
    background: Colors.white, // General background color
    onBackground: Colors.black, // Text/icons on background
    error: Colors.red.shade700, // Error state color
    onError: Colors.white, // Text/icons on error background
    tertiary: Colors.grey.shade100, // Neutral tertiary color
    inversePrimary: Colors.grey.shade800, // For dark text/icons in contrast
  ),
  scaffoldBackgroundColor: Colors.white, // Predominantly white background
  appBarTheme: AppBarTheme(
    backgroundColor: brandColor, // Brand-colored app bar
    foregroundColor: Colors.white, // White text/icons on app bar
    elevation: 0,
  ),
  textTheme: TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
    displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.grey.shade700),
    bodySmall: TextStyle(fontSize: 12, color: Colors.grey.shade600),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: brandColor, // Brand color for elevated buttons
      foregroundColor: Colors.white, // White text/icons on buttons
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.grey.shade100, // Light input fields
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.grey.shade400),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: brandColor), // Brand color focus
    ),
  ),
);