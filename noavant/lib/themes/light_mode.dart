import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Define primary brand colors
const Color brandColor = Color(0xFFCA1E16);
const Color gradientStartColor = Color(0xFFFF6B6B); // Light gradient start
const Color gradientEndColor = Color(0xFFFF8C42); // Light gradient end
const Color frostedGlassColor = Color(0xB3FFFFFF); // Semi-transparent white

ThemeData lightMode = ThemeData(
  // Define color scheme
  colorScheme: ColorScheme.light(
    primary: brandColor, // Main brand color for primary elements
    onPrimary: Colors.white, // Text/icons on primary-colored elements
    secondary: Colors.grey.shade300, // Accent or complementary color
    onSecondary: Colors.black, // Text/icons on secondary-colored elements
    surface: Colors.white, // For surfaces like cards
    onSurface: Colors.black, // Text/icons on surfaces
    background: Colors.grey.shade100, // General app background
    onBackground: Colors.black, // Text/icons on background
    error: Colors.red.shade700, // Error messages and indicators
    onError: Colors.white, // Text/icons on error elements
    inversePrimary: gradientEndColor, // Gradient-related styling
    tertiary: Colors.grey.shade200, // Neutral background
  ),

  // Background customization
  scaffoldBackgroundColor: Colors.grey.shade100, // Light gray for iOS feel

  // AppBar styling
  appBarTheme: AppBarTheme(
    backgroundColor: brandColor, // Brand-colored app bar
    foregroundColor: Colors.white, // White text/icons on app bar
    elevation: 0, // Flat, modern look
  ),

  // Input field styling
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Colors.white.withOpacity(0.8), // Frosted glass effect
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12), // Rounded corners for input
      borderSide: BorderSide(color: Colors.grey.shade400),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: brandColor), // Focus border in brand color
    ),
    hintStyle: TextStyle(
      color: Colors.grey.shade600, // Subtle hint text
      fontSize: 14,
    ),
  ),

  // Buttons
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30), // Rounded button shape
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
      backgroundColor: brandColor, // Brand gradient can be applied here
      foregroundColor: Colors.white, // White text/icons on button
      elevation: 3, // Subtle shadow
    ),
  ),

  // Typography
  textTheme: TextTheme(
    displayLarge: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.black),
    displayMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: brandColor),
    bodyLarge: TextStyle(fontSize: 16, color: Colors.black),
    bodyMedium: TextStyle(fontSize: 14, color: Colors.grey.shade700),
    bodySmall: TextStyle(fontSize: 12, color: Colors.grey.shade600),
    headlineSmall: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
  ),

  // Cupertino integration for iOS
  cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
    primaryColor: brandColor,
    primaryContrastingColor: Colors.white,
    barBackgroundColor: Colors.white,
    textTheme: CupertinoTextThemeData(
      primaryColor: brandColor,
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    ),
  ),

  // Elevated Card Styling for Frosted Glass Effect
  cardTheme: CardTheme(
    color: frostedGlassColor,
    elevation: 5,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  ),

  // Shadow and elevation for iOS feel
  shadowColor: Colors.black.withOpacity(0.1),

  // Additional decoration for gradients
  splashColor: gradientStartColor.withOpacity(0.2),
  highlightColor: gradientEndColor.withOpacity(0.2),
);
